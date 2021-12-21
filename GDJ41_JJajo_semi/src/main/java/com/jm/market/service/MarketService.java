package com.jm.market.service;

import static com.jj.common.JDBCTemplate.close;
import static com.jj.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.jm.market.dao.MarketDao;
import com.jm.market.model.vo.ProductBoard;
public class MarketService {
	
	public MarketDao dao =new MarketDao();
	
	public List<ProductBoard> allProduct(){
		Connection conn = getConnection();
		List<ProductBoard> list = dao.allProduct(conn);
		close(conn);
		return list;
	}
	
	
	public ProductBoard searchProduct(int productNo) {
		Connection conn = getConnection();
		ProductBoard pb = dao.searchProduct(conn,productNo);
		close(conn);
		return pb;
	}
	

}
