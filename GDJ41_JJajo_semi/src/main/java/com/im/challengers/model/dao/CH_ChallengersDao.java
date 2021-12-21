package com.im.challengers.model.dao;

import static com.jj.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.im.challengers.model.vo.CH_Challengers;

public class CH_ChallengersDao {

	private Properties prop=new Properties();
	
	public CH_ChallengersDao() {
		
		String path=CH_ChallengersDao.class.getResource("/sql/challengers/challengers_sql.properties").getPath();
		try {
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
/* ================================챌린져스 번호로 챌린져스 찾기=========================== */	
	
	public CH_Challengers searchChallengers(Connection conn, int chNo) {
		
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		CH_Challengers ch=null;
		
		String sql = prop.getProperty("searchChallengers");
		
		try {
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, chNo);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				
				ch=CH_Challengers.builder()
						.challengersNo(rs.getInt("CH_NO"))
						.title(rs.getString("CH_TITLE"))
						.content(rs.getString("CH_CONTENT"))
						.filepath(rs.getString("CH_FILEPATH"))
						.enrolldate(rs.getDate("CH_ENROLLDATE"))
						.build();
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return ch;
		
	}
	
	
	
/* ================================챌린져스 출력 (페이징 처리)============================= */	

	
/* ======================================챌린져스 등록================================= */	

	public int insertChallengers(Connection conn, CH_Challengers ch) {
		
		PreparedStatement pstmt=null;
		int result=0;
		
		String sql=prop.getProperty("insertChallengers");
		
		try {
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, sql);
			pstmt.setString(2, sql);
			pstmt.setString(3, sql);
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
		
		
	}
	
	
/* ======================================챌린져스 수정================================= */	

	
/* ======================================챌린져스 삭제================================= */	

	
/* ================================================================================= */	

	
	
}
