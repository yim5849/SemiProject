package com.jj.member.model.service;

import static com.jj.common.JDBCTemplate.commit;
import static com.jj.common.JDBCTemplate.rollback;
import static com.jj.common.JDBCTemplate.close;
import static com.jj.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.jj.member.model.dao.MemberDao;
import com.jj.member.model.vo.Member;

public class MemberService {

	// dao 클래스와 연결하기 위한 객체 생성
	private MemberDao dao=new MemberDao();
	
	/*로그인 정보를 반환하는 메서드!*/
	public Member login(String memberId, String memberPwd) {
		
		// 커넥션 객체 생성!
		Connection conn = getConnection();
		
		// 생성한 커넥션 객체와 servlet으로 부터 받아온 아이디와 비밀번호를
		// Dao클래스의 login 메서드로 전달한다.
		Member m=dao.login(conn,memberId,memberPwd);
		
		// 커넥션 객체를 닫는다!
		close(conn);
		
		// 조회된 멤버를 반환한다!
		return m;
	}

	public int insertMember(Member m) {
		Connection conn=getConnection();
		int result=dao.insertMember(conn,m);
		//DML구문은 트렌젝션처리를 해야함.
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		
		return result; // int result=dao.insertMember(conn,m);을 담는다
				
	}
	
	public Member checkIdDuplicate(String memberId) {
		Connection conn=getConnection();
		Member m=dao.checkIdDuplicate(conn,memberId);
		close(conn);
		return m;
	}
	
	
	public int updateMember(Member m) {
		Connection conn=getConnection();
		int result=dao.updateMember(conn,m);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	
	public int updatePassword(String password, String newPassword) {
		Connection conn=getConnection();
		int result=dao.updatePassword(conn,password);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int memberDelete(String memberId) {
		Connection conn=getConnection();
		
		int result=dao.memberDelete(conn,memberId);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
}


	
