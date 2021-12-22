package com.notice.model.service;

import java.sql.Connection;
import java.util.List;

import com.notice.model.dao.NoticeDao;
import com.notice.model.vo.Notice;

import static com.jj.common.JDBCTemplate.getConnection;
import static com.jj.common.JDBCTemplate.close;

public class NoticeService {
	private NoticeDao dao = new NoticeDao();
	
	public List<Notice> searchNoticeByPaging(int curPage, int numPerPage) {
		Connection conn = getConnection();
		List<Notice> list = dao.searchNoticeByPaging(conn,curPage,numPerPage);
		close(conn);
		return list;
	}

}
