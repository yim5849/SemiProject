package com.im.challengers.model.service;

import static com.jj.common.JDBCTemplate.getConnection;
import static com.jj.common.JDBCTemplate.close;
import static com.jj.common.JDBCTemplate.commit;
import static com.jj.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.im.challengers.model.dao.CH_ChallengersDao;
import com.im.challengers.model.vo.CH_Challengers;


public class CH_ChallengersService {

	private CH_ChallengersDao dao = new CH_ChallengersDao();
	
/* ================================챌린져스 번호로 챌린져스 찾기=========================== */	
	
	public CH_Challengers searchChallengers(int chNo) {
		
		Connection conn=getConnection();
		CH_Challengers ch = dao.searchChallengers(conn, chNo);
		close(conn);
		return ch;
		
	}
	
/* ================================챌린져스 출력 (페이징 처리)============================= */	

	public List<CH_Challengers> searchAllChallengers(int cPage, int numPerPage){
		
		Connection conn=getConnection();
		List<CH_Challengers> list = dao.searchAllChallengers(conn, cPage, numPerPage);
		close(conn);
		return list;
		
	}
	
/* ======================================챌린져스 등록================================= */	

	public int insertChallengers(CH_Challengers ch) {
		
		Connection conn=getConnection();
		int result = dao.insertChallengers(conn, ch);
		
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
		
	}
	
/* ======================================챌린져스 수정================================= */	

	public int updateChallengers(CH_Challengers ch) {
		
		Connection conn=getConnection();
		int result = dao.updateChallengers(conn, ch);
		
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
		
	}

/* ======================================챌린져스 삭제================================= */	

	public int deleteChallengers(int chNo) {
		
		Connection conn=getConnection();
		int result = dao.deleteChallengers(conn, chNo);
		
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
		
	}
	
/* ================================================================================= */	

}
