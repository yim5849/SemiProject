package com.jm.market.dao;

import static com.jj.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.jj.member.model.vo.Member;
import com.jm.market.model.vo.ProductBoard;

public class MarketDao {

	private Properties prop = new Properties();
	
	public MarketDao(){
		
		try {
			String path=MarketDao.class.getResource("/sql/market/market.properties").getPath();
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	
	
	}
	
	public List<ProductBoard> allProduct(Connection conn){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ProductBoard pb=null;
		List<ProductBoard> list = new ArrayList();
		String sql=prop.getProperty("allProduct");
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				pb=ProductBoard.builder().productNo(rs.getInt("pd_no"))
										 .Title(rs.getString("pd_title"))
										 .Category(rs.getString("pd_category"))
										 .content(rs.getString("pd_content"))
										 .price(rs.getInt("pd_price"))
										 .address(rs.getString("pd_address"))
										 .enrollDate(rs.getDate("pd_enrolldate"))
										 .isSale(rs.getString("pd_sale"))
										 .isDelete(rs.getString("pd_delete"))
										 .memberNo(rs.getInt("member_no"))
										 .build();
				list.add(pb);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
		
		
	}
	
	public ProductBoard searchProduct(Connection conn,int productNo) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ProductBoard pb=null;  
		String sql=prop.getProperty("searchProduct");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, productNo);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				pb=ProductBoard.builder().productNo(rs.getInt("pd_no"))
						 .Title(rs.getString("pd_title"))
						 .Category(rs.getString("pd_category"))
						 .content(rs.getString("pd_content"))
						 .price(rs.getInt("pd_price"))
						 .address(rs.getString("pd_address"))
						 .enrollDate(rs.getDate("pd_enrolldate"))
						 .isSale(rs.getString("pd_sale"))
						 .isDelete(rs.getString("pd_delete"))
						 .memberNo(rs.getInt("member_no"))  
						 .build();  
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return pb;
		
	}
	
	
	
	
	
	
}//클래스 종료
