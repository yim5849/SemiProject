package com.jm.market.service;

 
import static com.jj.common.JDBCTemplate.close;
import static com.jj.common.JDBCTemplate.getConnection;
import static com.jj.common.JDBCTemplate.commit;
import static com.jj.common.JDBCTemplate.rollback;

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
	
	public int insertBoard(ProductBoard pb) {
		Connection conn=getConnection();
		int result=dao.insertBoard(conn,pb); ;
		if(result>0) { 	
				commit(conn); 
		}else {
				rollback(conn);
		}
		close(conn);
		return result; 
	}

	public int maxCount(ProductBoard pb) {
		Connection conn=getConnection();
		int result=dao.maxCount(conn,pb); 
		return result;
	}
	
	public int insertFile(ProductBoard pb,int pdno) {
		Connection conn=getConnection();
		int result=dao.insertFile(conn,pb,pdno); 
		if(result>0) { 	
				commit(conn); 
		}else {
				rollback(conn);
		}
		close(conn);
		return result; 
	}
	

}
