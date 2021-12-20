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

public class CH_AdvertisementDao {

	private Properties prop=new Properties();
	
	public CH_AdvertisementDao() {
		
		String path=CH_AdvertisementDao.class.getResource("/sql/challengers/advertisement_sql.properties").getPath();
		try {
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
		
	}
	
/* ====================================광고 출력================================================ */
	
	
	public List<CH_Advertisement> searchAllAdvertisement(Connection conn){
		
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		CH_Advertisement ad=null;
		
		List<CH_Advertisement> list=new ArrayList();
		
		String sql=prop.getProperty("searchAllAdvertisement");
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				
				ad=CH_Advertisement.builder()
					  .advertisementNo(rs.getInt("AD_NO"))
					  .content(rs.getString("AD_CONTENT"))
					  .address(rs.getString("AD_ADDRESS"))
					  .filepath(rs.getString("AD_FILEPATH"))
					  .enrollDate(rs.getDate("AD_ENROLLDATE"))
					  .build();
				
				list.add(ad);
			}
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
		
		
	}
	
	
/* ====================================광고 등록================================================ */
	
	
	public int insertAdvertisement(Connection conn,CH_Advertisement ad) {
		
		PreparedStatement pstmt=null;
		int result=0;
		
		String sql=prop.getProperty("insertAdvertisement");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, ad.getContent());
			pstmt.setString(2, ad.getAddress());
			pstmt.setString(3, ad.getFilepath());
			
			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
		
	}
	
	
/* ====================================광고 수정================================================ */
	
	
	
/* ====================================광고 삭제================================================ */
	
	public int deleteAdvertisement(Connection conn, int adNo) {
		
		PreparedStatement pstmt=null;
		int result=0;
		
		String sql=prop.getProperty("deleteAdvertisement");
		
		try {
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, adNo);
			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
	}
	
}
