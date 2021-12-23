package com.im.challengers.model.dao;

import static com.jj.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.im.challengers.model.vo.CH_Advertisement;
import com.im.challengers.model.vo.CH_MychallengeNotice;

public class CH_MychallengeNoticeDao {

	private Properties prop=new Properties();
	
	public CH_MychallengeNoticeDao() {
		
		String path=CH_MychallengeNoticeDao.class.getResource("/sql/challengers/mychallengenotice_sql.properties").getPath();
		try {
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
/* ===================마이챌린지 공지사항 출력=================== */
	
	public List<CH_MychallengeNotice> searchAllNotice(Connection conn){
		
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		CH_MychallengeNotice no = null;
		
		List<CH_MychallengeNotice> list = new ArrayList();
		
		String sql = prop.getProperty("searchAllNotice");
		
		try {
			
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				
				no=CH_MychallengeNotice.builder()
						.mychallengeNoticeNo(rs.getInt("NO_NO"))
						.content(rs.getString("NO_CONTENT"))
						.build();
				
				list.add(no);
			}
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
		
	}
	
	
/* ===================마이챌린지 공지사항 등록=================== */
	
	public int insertMychallengeNotice(Connection conn, String content) {
		
		PreparedStatement pstmt=null;
		int result=0;
		
		String sql = prop.getProperty("insertMychallengeNotice");
		
		try {
			
			pstmt=conn.prepareStatement(sql);	
			pstmt.setString(1,content);
			
			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
		
	}
	
/* ===================마이챌린지 공지사항 수정=================== */
	
	public int updateMychallengeNotice(Connection conn, CH_MychallengeNotice no) {
		
		PreparedStatement pstmt=null;
		int result=0;
		
		String sql = prop.getProperty("updateMychallengeNotice");
		
		try {
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, no.getContent());
			pstmt.setInt(2, no.getMychallengeNoticeNo());
			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
	}
	
	
/* ===================마이챌린지 공지사항 삭제 ===================*/
	
	public int deleteMychallengeNotice(Connection conn, int noNo) {
		
		PreparedStatement pstmt=null;
		int result=0;
		
		String sql = prop.getProperty("deleteMychallengeNotice");
		
		try {
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, noNo);
			result=pstmt.executeUpdate();
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
	}
	
}
