package com.db.find.model.service;

import static com.jj.common.JDBCTemplate.close;
import static com.jj.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.db.find.model.dao.FindDao;
import com.jj.member.model.vo.Member;


public class FindService {
	private FindDao dao = new FindDao();

	public List<Member> findFollowing(String memberNo) {
		Connection conn = getConnection();
		List<Member> fList = dao.findFollowing(conn,memberNo);
		close(conn);
		return fList;
	}
	
	
}
