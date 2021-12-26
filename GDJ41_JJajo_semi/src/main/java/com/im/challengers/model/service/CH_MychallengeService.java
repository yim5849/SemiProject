package com.im.challengers.model.service;

import static com.jj.common.JDBCTemplate.close;
import static com.jj.common.JDBCTemplate.commit;
import static com.jj.common.JDBCTemplate.getConnection;
import static com.jj.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.im.challengers.model.dao.CH_MychallengeDao;
import com.im.challengers.model.vo.CH_Challengers;
import com.im.challengers.model.vo.CH_Mychallenge;

public class CH_MychallengeService {

	
	private CH_MychallengeDao dao = new CH_MychallengeDao();
	
	
/*=================== 챌린지 찾기(회원번호, 챌린져스 번호 사용) ================= */	
	
	public List<CH_Mychallenge> searchChallenge(int memberNo,int challengersNo){
		
		Connection conn=getConnection();
		List<CH_Mychallenge> list = dao.searchChallenge(conn, memberNo, challengersNo);
	
		close(conn);
		
		return list;
		
	}
	
/*========================== 챌린지 찾기(회원번호 사용) ====================== */	
	
	public List<CH_Mychallenge> searchChallenge(int memberNo){
		
		Connection conn=getConnection();
		List<CH_Mychallenge> list = dao.searchChallenge(conn, memberNo);
	
		close(conn);
		
		return list;
		
	}
	
/*============================= DropList에 담을 챌린지 찾기========================= */	
	
	public List<CH_Challengers> searchChallengeListDrop(int memberNo){
		
		Connection conn=getConnection();
		List<CH_Challengers> list = dao.searchChallengeListDrop(conn, memberNo);
	
		close(conn);
		
		return list;
		
	}
	
/*============================= 마이 챌린지 등록 ========================== */
	
	public int startChallenge(int count, int memberNo, int challengersNo) {
		
		Connection conn=getConnection();
		int result = dao.startChallenge(conn,count,memberNo,challengersNo);
		if(result>0)commit(conn);
		else rollback(conn);
		close(conn);
		return result;
		
	}
	
	
/*============================= 마이 챌린지 등록 ========================== */
/*============================= 마이 챌린지 등록 ========================== */
/*============================= 마이 챌린지 등록 ========================== */
/*============================= 마이 챌린지 등록 ========================== */
/*============================= 마이 챌린지 등록 ========================== */
	
	
}
