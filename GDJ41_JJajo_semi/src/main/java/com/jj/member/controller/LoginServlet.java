package com.jj.member.controller;
 

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	/*요청에 대한 서비스를 제공한다!*/
	
	// 아이디 입력창과 비밀번호 입력창으로부터 입력받은 값을 가져온다
	// 파라미터값에 들어가는 것은 해당 태그의 name값이다!
	String memberId = request.getParameter("memberId");
	String memberPwd = request.getParameter("memberPwd");
	
	// DB로 부터 값을 가져온다 => Main->Service->Dao->Service->Main
	Member m = new MemberService().login(memberId,memberPwd); 
	
	
	
	/*인증 로직 처리하기*/
	// m 이 null 이거나 값이 있거나 둘 중 하나일 것이다 (아이디는 pk이므로 1개이니까)
	// m이 null값이면 인증실패(입력한 아이디/비밀번호로 가입된 회원이 없다)
	// m값이 존재한다면(1명의 데이터) =>인증성공
		
	if(m!=null) {
	/* 로그인 성공시 로직*/	
		
	///로그인한 사용자에 대한 정보를 session객체를 생성해서 저장한다.
	// session 생성하기	
	HttpSession session=request.getSession();	
	
	session.setAttribute("loginMember", m);
	
	request.setAttribute("msg", "로그인 성공!");
	request.setAttribute("loc","/");
	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		
	}else {
		
	/*로그인 실패시 로직*/
	request.setAttribute("msg", "로그인 실패, 다시 시도하세요!");
	request.setAttribute("loc","/");
	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		
	}
	
	
	// 4. 사용자에게 보여줄 화면을 선택한다
	// 로그인이 완료되면 메인페이지로 이동해야 하기 때문에 주소값이 유지되면 안된다!
	// /login.do 가 유지되면 계속 로그인 처리 창이 뜬다...!
	
	//response.sendRedirect(request.getContextPath());
	
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
