package com.im.challengers.model.service;

import static com.jj.common.JDBCTemplate.close;
import static com.jj.common.JDBCTemplate.commit;
import static com.jj.common.JDBCTemplate.getConnection;
import static com.jj.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.im.challengers.model.dao.CH_AdvertisementDao;
import com.im.challengers.model.vo.CH_Advertisement;

public class CH_AdvertisementService {

	private CH_AdvertisementDao dao = new CH_AdvertisementDao();
	
	
/* ====================================광고 출력================================================ */
	
	
	public List<CH_Advertisement> searchAllAdvertisement(){
		
		Connection conn=getConnection();
		List<CH_Advertisement> result = dao.searchAllAdvertisement(conn);
		close(conn);
		return result;
		
	}
	
	
/* ====================================광고 등록================================================ */
	
	
	public int insertAdvertisement(CH_Advertisement ad) {
		
		Connection conn=getConnection();
		int result = dao.insertAdvertisement(conn, ad);
		
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	
	}
	
	
/* ====================================광고 수정================================================ */
	
/* ====================================광고 삭제================================================ */
	
	public int deleteAdvertisement(int adNo) {
		
		Connection conn=getConnection();
		int result = dao.deleteAdvertisement(conn, adNo);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
		
	}
	
	
	
}
