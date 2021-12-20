package com.im.challengers.model.dao;

import static com.jj.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
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
	
	
	
}
