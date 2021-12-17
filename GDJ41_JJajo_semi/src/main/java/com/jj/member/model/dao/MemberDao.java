package com.jj.member.model.dao;

import static com.jj.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.jj.member.model.vo.Member;

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
	
	
	
	
	
	
	
	
	
	
}

