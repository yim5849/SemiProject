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

import com.im.challengers.model.vo.CH_MychallengeImage;

public class CH_MychallengeImageDao {

	private Properties prop=new Properties();
	
	public CH_MychallengeImageDao() {
		
		String path=CH_AdvertisementDao.class.getResource("/sql/challengers/myChallengeImage_sql.properties").getPath();
		try {
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
	
/* ================================이미지 출력============================================ */	
	
	public List<CH_MychallengeImage> searchAllMyImage(Connection conn, int memberNo, int chNum){
		
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		CH_MychallengeImage im=null;
		
		List<CH_MychallengeImage> list = new ArrayList();
		
		String sql=prop.getProperty("searchAllMyImage");
		
		try {
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			pstmt.setInt(2, chNum);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				
				im=CH_MychallengeImage.builder()
						.ch_imgNo(rs.getInt("IM_NO"))
						.filepath(rs.getString("IM_FILEPATH"))
						.memberNo(rs.getInt("MEMBER_NO"))
						.challengersNo(rs.getInt("CH_NO"))
						.build();
				list.add(im);
				
			}
			System.out.println("사진 리스트는 바로 : "+list);
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
		
	}
	
	
	
/* ================================이미지 등록============================================ */	

	public int insertMyImage(Connection conn, CH_MychallengeImage im) {
		
		PreparedStatement pstmt=null;
		int result=0;
		
		String sql=prop.getProperty("insertMyImage");
		
		try {
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, im.getFilepath());
			pstmt.setInt(2, im.getMemberNo());
			pstmt.setInt(3, im.getChallengersNo());
			
			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;

	}
	
	
/* ================================이미지 수정============================================ */	

	public int updateMyImage(Connection conn, CH_MychallengeImage im) {
		
		PreparedStatement pstmt=null;
		int result=0;
		
		String sql=prop.getProperty("updateMyImage");
		
		try {
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, im.getFilepath());
			pstmt.setInt(2, im.getCh_imgNo());
			
			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
		
		
		
	}
	
	
/* ================================이미지 삭제============================================ */	

	public int deleteMyImage(Connection conn, int imageNo) {
	
		PreparedStatement pstmt=null;
		int result=0;
		
		String sql=prop.getProperty("deleteMyImage");
	
		
		try {
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, imageNo);
			
			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
		
	}
	
	
	
}
