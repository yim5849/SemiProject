package com.im.challengers.model.service;

import static com.jj.common.JDBCTemplate.getConnection;
import static com.jj.common.JDBCTemplate.close;
import static com.jj.common.JDBCTemplate.commit;
import static com.jj.common.JDBCTemplate.rollback;


import java.sql.Connection;
import java.util.List;

import com.im.challengers.model.dao.CH_MychallengeDao;
import com.im.challengers.model.vo.CH_Mychallenge;

public class CH_MychallengeService {

	
	private CH_MychallengeDao dao = new CH_MychallengeDao();
	
	
/*============================== 챌린지 찾기 ============================ */	
	
	public List<CH_Mychallenge> searchChallenge(int memberNo,int challengersNo){
		
		Connection conn=getConnection();
		List<CH_Mychallenge> list = dao.searchChallenge(conn, memberNo, challengersNo);
	
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
