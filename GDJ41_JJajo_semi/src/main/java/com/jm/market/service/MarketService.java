package com.jm.market.service;

 
import static com.jj.common.JDBCTemplate.close;
import static com.jj.common.JDBCTemplate.commit;
import static com.jj.common.JDBCTemplate.getConnection;
import static com.jj.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.jm.market.dao.MarketDao;
import com.jm.market.model.vo.AttachedFiles;
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
		//조회할 product_no값으로 ProductBoard값을 가져온다
		ProductBoard pb = dao.searchProduct(conn,productNo); 
		close(conn);
		return pb;
	}
	
	
	public int insertBoard(ProductBoard pb) {
		Connection conn=getConnection();
		int result=dao.insertBoard(conn,pb); 
		if(result>0) { 	
				int productNo=dao.maxCount(conn);
				
				for(int i=0; i<pb.getFileName().size();i++) {
					dao.insertFile(conn,pb,productNo,pb.getFileName().get(i).getFileName());
				}
				commit(conn); 
		}else {
				rollback(conn);
		}
		close(conn);
		return result; 
	}
 
	
   public List<ProductBoard> categoryMain(String category){
	   Connection conn=getConnection();
	   List<ProductBoard> list=dao.categoryMain(conn, category);
	   close(conn);
	   return list;
   }
   
   public List<ProductBoard> storeMain(String memberNo){
	   Connection conn = getConnection();
		List<ProductBoard> list = dao.storeMain(conn,memberNo);
		close(conn);
		return list;
   }

}
