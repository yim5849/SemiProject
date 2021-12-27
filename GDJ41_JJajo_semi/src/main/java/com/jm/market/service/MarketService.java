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
	
//---------------------------------메인 조회하기---------------------------------
	public List<ProductBoard> allProduct(){
		Connection conn = getConnection();
		List<ProductBoard> list = dao.allProduct(conn);
		close(conn);
		return list;
	}
	
	
//---------------------------------상품 조회하기----------------------------------	
	public ProductBoard searchProduct(int productNo) {
		Connection conn = getConnection();
		//조회할 product_no값으로 ProductBoard값을 가져온다
		ProductBoard pb = dao.searchProduct(conn,productNo); 
		close(conn);
		return pb;
	}
	
//---------------------------------게시물 추가하기----------------------------------	
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
 
//------------------------------------카테고리------------------------------------
   public List<ProductBoard> categoryMain(String category){
	   Connection conn=getConnection();
	   List<ProductBoard> list=dao.categoryMain(conn, category);
	   close(conn);
	   return list;
   }
   
//---------------------------------내상점 메인화면가기--------------------------------
   public List<ProductBoard> storeMain(String memberNo){
	   Connection conn = getConnection();
		List<ProductBoard> list = dao.storeMain(conn,memberNo);
		close(conn);
		return list;
   }
   
   
//---------------------------------게시물 수정하기----------------------------------
   public int updateBoard(ProductBoard pb) {
	   Connection conn=getConnection();
		int result=dao.updateBoard(conn,pb); 
		if(result>0) {
				dao.deleteFile(conn,pb.getProductNo());
				
				for(int i=0; i<pb.getFileName().size();i++) {
					dao.insertFile(conn,pb,pb.getProductNo(),pb.getFileName().get(i).getFileName());
				}
				commit(conn); 
		}else {
				rollback(conn);
		}
		close(conn);
		return result; 
   }

//---------------------------------게시물 삭제하기----------------------------------   
   public int deleteProduct(int productNo) {
	   Connection conn=getConnection();
	   	ProductBoard pb=dao.searchProduct(conn, productNo);
	   	//System.out.println(pb);
	   	if(pb!=null&&!pb.getFileName().isEmpty()) {
	   		dao.deleteFile(conn,productNo);	   		
	   	}
	   //	if(pb!=null&&pb.getIsDelete().equals("Y")) {
	   //		dao.deleteBuyList(conn,productNo);
	   //	}
	   	int result=dao.deleteProduct(conn,productNo);  
	   	if(result>0) {
	   			commit(conn); 				 
	   	}else {
	   			rollback(conn);
	   	}
	   	System.out.println(result);
		close(conn); 
		return result;
  }
 //---------------------------------거래완료로 변경하기--------------------------------   
   public int dealProduct(int productNo) {
	   Connection conn=getConnection();
		int result=dao.dealProduct(conn,productNo); 
		if(result>0) {  
				commit(conn); 
		}else {
				rollback(conn);
		}
		close(conn);
		return result;  
   }

   //----------------------------상품 구매하기-------------------------------------
   
   
   public int buyProduct(String productNo,String memberNo) {
	   Connection conn=getConnection();
		int result=dao.buyProduct(conn,productNo,memberNo); 
		if(result>0) {  
			int result2=dao.updateBuyBoard(conn,productNo);
			if(result>0) {
					commit(conn); 
			}else {
				rollback(conn);
		}
		close(conn);
   }
		return result; 
   }
   
   
   //--------------------------구매 리스트-----------------------------------------
   
   public List<ProductBoard> buyList(String memberNo){
	   Connection conn = getConnection();
		List<ProductBoard> list = dao.buyList(conn,memberNo);
		close(conn);
		return list;
   }
   
   //-------------------------리뷰쓰기-------------------------------------------
   
   public ProductBoard reviewBoard(int productNo) {
	   Connection conn = getConnection();
	   ProductBoard pb = dao.searchProduct(conn,productNo);
		close(conn);
		return pb;
   }
}