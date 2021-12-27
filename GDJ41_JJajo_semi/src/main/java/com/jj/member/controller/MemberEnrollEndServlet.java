package com.jj.member.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jj.common.AESCryptor;
//import com.jj.common.AESCryptor;
import com.jj.member.model.service.MemberService;
import com.jj.member.model.vo.Member;

/**
 * Servlet implementation class MemberEnrollEndServlet
 */
@WebServlet(name = "memberEnroll", urlPatterns = { "/member/enrollMemberEnd.do" })
public class MemberEnrollEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MemberEnrollEndServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String memberId = request.getParameter("memberId");
		String memberPwd = request.getParameter("memberPwd");
		String memberName = request.getParameter("memberName");
		String gender = request.getParameter("gender");
		String birthday = request.getParameter("birthday");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String filePath = request.getParameter("filePath");
		String enrollDate = request.getParameter("enrollDate");
		

		Member m = Member.builder().memberId(memberId).memberPwd(memberPwd).memberName(memberName)
				.gender(gender).birthday(birthday).email(email).phone(phone)
				.address(address).filePath(filePath).build();

		// DB에 접속해서 Member m저정하기!
		int result = new MemberService().insertMember(m);

		// 응답화면 설정하기
		String msg = "";
		String loc = "";
		if (result > 0) {
			msg = "회원가입을 성공하였습니다!";
			loc = "/";
		} else {
			msg = "회원가입에 실패했습니다 다시시도하세요";
			loc = "/member/enrollMember.do";
		}
		// request에 데이터 세팅하기
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);

		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
