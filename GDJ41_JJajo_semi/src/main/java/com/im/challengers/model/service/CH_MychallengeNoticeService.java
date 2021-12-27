package com.im.challengers.model.service;

import static com.jj.common.JDBCTemplate.close;
import static com.jj.common.JDBCTemplate.commit;
import static com.jj.common.JDBCTemplate.getConnection;
import static com.jj.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.im.challengers.model.dao.CH_MychallengeNoticeDao;
import com.im.challengers.model.vo.CH_MychallengeNotice;

public class CH_MychallengeNoticeService {

	private CH_MychallengeNoticeDao dao = new CH_MychallengeNoticeDao();
	
	
/* ===================마이챌린지 공지사항 출력=================== */
	
	public List<CH_MychallengeNotice> searchAllNotice(){
		
		Connection conn=getConnection();
		List<CH_MychallengeNotice> list = dao.searchAllNotice(conn);
		close(conn);
		return list;
		
	}
	
/* ===================마이챌린지 공지사항 등록=================== */
		
		public int insertMychallengeNotice(String content) {
			
			Connection conn=getConnection();
			int result = dao.insertMychallengeNotice(conn, content);
			
			if(result>0) commit(conn);
			else rollback(conn);
			close(conn);
			return result;
			
		}
		
/* ===================마이챌린지 공지사항 수정=================== */
		
		public int updateMychallengeNotice(CH_MychallengeNotice no) {
			
			Connection conn=getConnection();
			int result = dao.updateMychallengeNotice(conn, no);
			
			if(result>0) commit(conn);
			else rollback(conn);
			close(conn);
			return result;
			
		}
		
/* ===================마이챌린지 공지사항 삭제 ===================*/	
	
		public int deleteMychallengeNotice(int noNo) {
			
			Connection conn=getConnection();
			int result = dao.deleteMychallengeNotice(conn, noNo);
			
			if(result>0) commit(conn);
			else rollback(conn);
			close(conn);
			return result;
			
		}
	
/* ========================================================== */		
	
	
}
