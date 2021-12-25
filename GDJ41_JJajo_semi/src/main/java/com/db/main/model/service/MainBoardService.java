package com.db.main.model.service;

import static com.jj.common.JDBCTemplate.close;
import static com.jj.common.JDBCTemplate.commit;
import static com.jj.common.JDBCTemplate.rollback;
import static com.jj.common.JDBCTemplate.close;
import static com.jj.common.JDBCTemplate.getConnection;
import static com.jj.common.JDBCTemplate.commit;
import static com.jj.common.JDBCTemplate.rollback;

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

	
	//JY
	public int insertBoard(MainBoard mb, String memberNo) {
		Connection conn=getConnection();
		int result=dao.insertMainBoard(conn, mb, memberNo);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;		 
	}

	
	
	
	
	
	
	
	
	
	
	
}

