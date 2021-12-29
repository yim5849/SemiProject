package com.notice.model.service;

import java.sql.Connection;
import java.util.List;

import com.notice.model.dao.NoticeDao;
import com.notice.model.vo.Notice;

import static com.jj.common.JDBCTemplate.getConnection;
import static com.jj.common.JDBCTemplate.close;
import static com.jj.common.JDBCTemplate.commit;
import static com.jj.common.JDBCTemplate.rollback;

public class NoticeService {
	private NoticeDao dao = new NoticeDao();
	
	public List<Notice> searchNoticeByPaging(int curPage, int numPerPage) {
		Connection conn = getConnection();
		List<Notice> list = dao.searchNoticeByPaging(conn,curPage,numPerPage);
		close(conn);
		return list;
	}

	public int searchNoticeAllCount() {
		Connection conn = getConnection();
		int result= dao.searchNoticeAllCount(conn);
		close(conn);
		return result;
		
	}

	public Notice searchNoticeOne(String noticeNo) {
		Connection conn = getConnection();
		Notice notice = dao.searchNoticeOne(conn,noticeNo);
		close(conn);
		return notice;
	}

	public int insertNotice(Notice notice) {
		Connection conn = getConnection();
		int result = dao.insertNotice(conn, notice);
		if(result>0)commit(conn);
		else rollback(conn);
		return result;
	}

}
