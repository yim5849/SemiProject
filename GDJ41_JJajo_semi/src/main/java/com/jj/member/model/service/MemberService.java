package com.jj.member.model.service;

import static com.jj.common.JDBCTemplate.close;
import static com.jj.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.jj.member.model.dao.MemberDao;
import com.jj.member.model.vo.Member;

public class MemberService {

	// dao 클래스와 연결하기 위한 객체 생성
	private MemberDao dao=new MemberDao();
	
	/*로그인 정보를 반환하는 메서드!*/
	public Member login(String userId, String password) {
		
		// 커넥션 객체 생성!
		Connection conn = getConnection();
		
		// 생성한 커넥션 객체와 servlet으로 부터 받아온 아이디와 비밀번호를
		// Dao클래스의 login 메서드로 전달한다.
		Member m=dao.login(conn,userId,password);
		
		// 커넥션 객체를 닫는다!
		close(conn);
		
		// 조회된 멤버를 반환한다!
		return m;
	}
	
}