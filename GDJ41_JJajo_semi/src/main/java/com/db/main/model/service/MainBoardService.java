package com.db.main.model.service;

import static com.jj.common.JDBCTemplate.close;
import static com.jj.common.JDBCTemplate.commit;
import static com.jj.common.JDBCTemplate.rollback;
import static com.jj.common.JDBCTemplate.getConnection;


import java.sql.Connection;
import java.util.List;

import com.db.main.model.dao.MainBoardDao;
import com.db.main.model.vo.MainBoard;

public class MainBoardService {
	private MainBoardDao dao = new MainBoardDao();
	
	public List<MainBoard> searchMainBoard(int curPosition, int numPerOnce) {
		//DB
		Connection conn = getConnection();
		List<MainBoard> mbList = dao.searchMainBoard(conn, curPosition, numPerOnce);
		close(conn);
		return mbList;
	}
	
	public List<MainBoard> getUserBlog (int curPosition, int numPerOnce, String memberNo){
		Connection conn = getConnection();
		List<MainBoard> ubList = dao.getUserBlog(conn, memberNo, curPosition, numPerOnce); //member_no 필수
		close(conn);

		return ubList;
	}

	
	//JY
	public int insertBoard(MainBoard mb, String memberNo) {
		Connection conn=getConnection();
		int result=dao.insertBoard(conn, mb, memberNo);
		String boardNo=dao.getBoardNo(conn);
		if(result>0&&boardNo!=null) {
			int result2=dao.insertImageFile(conn,mb,boardNo);
			if(result2>0) {
				/* int result3=dao.insertTag(conn, mb,boardNo); */
				result=1;
			}else rollback(conn);
		}else rollback(conn);	
		close(conn);
		return result;		 
	}

	
	
	
	
	
	
	
	
	
	
	
}

