package com.im.challengers.model.service;

import static com.jj.common.JDBCTemplate.close;
import static com.jj.common.JDBCTemplate.commit;
import static com.jj.common.JDBCTemplate.getConnection;
import static com.jj.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.im.challengers.model.dao.CH_MychallengeImageDao;
import com.im.challengers.model.vo.CH_MychallengeImage;

public class CH_MychallengeImageService {

	private CH_MychallengeImageDao dao = new CH_MychallengeImageDao();

	
/* ================================이미지 출력============================================ */	

	public List<CH_MychallengeImage> searchAllMyImage(int memberNo, int chNum){
		
		Connection conn=getConnection();
		List<CH_MychallengeImage> list = dao.searchAllMyImage(conn, memberNo, chNum);
		close(conn);
		return list;
				
	}
	
	
/* ================================이미지 등록============================================ */	

	public int insertMyImage(CH_MychallengeImage im) {
		
		Connection conn=getConnection();
		int result = dao.insertMyImage(conn, im);
		
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
		
	}
	
	
/* ================================이미지 수정============================================ */	

	public int updateMyImage(CH_MychallengeImage im) {
		
		Connection conn=getConnection();
		int result = dao.updateMyImage(conn,im);
		
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
		
	}
	
	
	
/* ================================이미지 삭제============================================ */	

	public int deleteMyImage(int imageNo) {
		
		Connection conn=getConnection();
		int result = dao.deleteMyImage(conn,imageNo);
		
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
		
	}
	
	
}
