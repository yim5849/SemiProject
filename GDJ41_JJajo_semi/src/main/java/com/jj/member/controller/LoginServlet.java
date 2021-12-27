package com.jj.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jj.member.model.service.MemberService;
import com.jj.member.model.vo.Member;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/* 요청에 대한 서비스를 제공한다! */

		// 아이디 입력창과 비밀번호 입력창으로부터 입력받은 값을 가져온다
		// 파라미터값에 들어가는 것은 해당 태그의 name값이다!
		String memberId = request.getParameter("memberId");
		String memberPwd = request.getParameter("memberPwd");

		// DB로 부터 값을 가져온다 => Main->Service->Dao->Service->Main
		Member m = new MemberService().login(memberId, memberPwd);

		/* 아이디 저장로직 */
		String saveId = request.getParameter("saveId");
		if (saveId != null) {
			Cookie c = new Cookie("saveId", memberId); // 키와 value값을 ()안에 작성
			c.setMaxAge(24 * 60 * 60 * 7);
			response.addCookie(c);
		} else {
			Cookie c = new Cookie("saveId", memberId);
			c.setMaxAge(0);// 쿠키삭제 
			response.addCookie(c);
		}

		System.out.println(saveId);

		/* 인증 로직 처리하기 */

		if (m != null) {
			/* 로그인 성공시 로직 */

			/// 로그인한 사용자에 대한 정보를 session객체를 생성해서 저장한다.
			// session 생성하기
			HttpSession session = request.getSession();

			session.setAttribute("loginMember", m);

			request.setAttribute("msg", "로그인 성공!");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);

		} else {

			/* 로그인 실패시 로직 */
			request.setAttribute("msg", "로그인 실패, 다시 시도하세요!");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);

		}

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
