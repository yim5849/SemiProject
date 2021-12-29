package com.jj.member.model.dao;

import static com.jj.common.JDBCTemplate.close;
import static com.jj.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.jj.member.model.vo.Member;
import com.jj.member.model.vo.Member.MemberBuilder;

public class MemberDao {

	// 프로퍼티스 객체 생성!
	private Properties prop = new Properties();
	
	/* Dao클래스 생성시 자동으로 프로퍼티스 로드하기! */
	public MemberDao() {
		
		// 경로 가져오기
		String path=MemberDao.class.getResource("/sql/member/member_sql.properties").getPath();
		try {
		// 프로퍼티스 load하기!
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}

	}
	
	
	public Member login(Connection conn, String memberId, String memberPwd) {
		
		// sql 구문을 실행시키기 위한 PreparedStatement 객체 생성
		PreparedStatement pstmt=null;
		
		// 갑을 저장할 ResultSet 객체 생성
		ResultSet rs=null;
		
		// 결과를 반환할 객체 생성!
		Member m=null;
		
		// 프로퍼티스에 저장된 sql 구문 가져오기!
		String sql=prop.getProperty("checkLogin");
		
		try {
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			pstmt.setString(2, memberPwd);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
			/*builder패턴 이용하기*/
				m=Member.builder()
						.memberNo(rs.getInt("member_no"))
						.memberId(rs.getString("member_id"))
						.memberPwd(rs.getString("member_password"))
						.memberName(rs.getString("member_name"))
						.birthday(rs.getString("birthday"))
						.gender(rs.getString("gender"))
						.email(rs.getString("email"))
						.phone(rs.getString("phone"))
						.address(rs.getString("address"))
						.enrollDate(rs.getDate("enrolldate"))
						.filePath(rs.getString("filepath"))
						.build();					
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
		// rs. pstmt 객체 닫기
			close(rs);
			close(pstmt);
		}
		// 결과를 담은 객체 반환!
		return m;
	}
	
	public int insertMember(Connection conn, Member m) {
		// 서비스에 있는걸 여기로 보냄
		PreparedStatement pstmt=null;
		int result=0; // 0또는 1이 담긴다
		String sql=prop.getProperty("insertMember");
		try {
			pstmt=conn.prepareStatement(sql);
			// 여기 밑에는 컬럼 순서대로 적어줘야한다
			pstmt.setString(1, m.getMemberId());
			pstmt.setString(2, m.getMemberPwd());
			pstmt.setString(3, m.getMemberName());
			pstmt.setString(4, m.getBirthday());
			pstmt.setString(5, m.getGender());
			pstmt.setString(6, m.getAddress());
			pstmt.setString(7, m.getEmail());
			pstmt.setString(8, m.getPhone());
			
			
			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result; // 0또는 1일 반환한다 , 다시 서비스로 간다
	}
	
	
	public Member checkIdDuplicate(Connection conn, String memberId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Member m=null;
		//boolean flag=false;
		String sql=prop.getProperty("selectId");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m=Member.builder()
						.memberId(rs.getString("member_id"))
						// 디벨로퍼와 동일하게 작성을 해야한다
						// 컬럼명과 동일하게
						.memberName(rs.getString("member_Name"))
						.birthday(rs.getString("birthday"))
						.gender(rs.getString("gender"))
						.email(rs.getString("email"))
						.phone(rs.getString("phone"))
						.address(rs.getString("address"))
						.build();
				//flag=true;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return m;
	}
	
	
	public int updateMember(Connection conn, Member m) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("updateMember");
		try {
			pstmt=conn.prepareStatement(sql);
			// sql 디비에 담겨 있는 데이터 순서대로 적어야 한다
			pstmt.setString(1, m.getMemberName());
			pstmt.setString(2, m.getGender());
			pstmt.setString(3, m.getBirthday());
			pstmt.setString(4, m.getEmail());
			pstmt.setString(5, m.getPhone());
			pstmt.setString(6, m.getAddress());
			pstmt.setString(7, m.getMemberId());
			
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	
	
	public int updatePassword(Connection conn,String memberPwd) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("updatePassword");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, memberPwd);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	public int memberDelete(Connection conn, String memberId) {
		PreparedStatement pstmt=null;
		int result=0;
		//boolean flag=false;
		String sql=prop.getProperty("delete");
		// 프로폴티스 = 디비 작성문들을 한곳에 작성을 해놓는 곳
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
}

	
	
	
	
	
	
	
	


