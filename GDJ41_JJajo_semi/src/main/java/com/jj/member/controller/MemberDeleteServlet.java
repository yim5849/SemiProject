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

/**
 * Servlet implementation class MemberDeleteServlet
 */
@WebServlet("/member/memberDelete.do")
public class MemberDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("요청 들어오았는지 확인해줘!");
		
		String memberId = request.getParameter("memberId");
		
		int result = new MemberService().memberDelete(memberId);
		
		// 메시지 //
		String msg = "";
		String loc = "";
		if (result > 0) {
			String saveId = request.getParameter("saveId");
			System.out.println(saveId); 
				Cookie c = new Cookie("saveId", memberId);
				c.setMaxAge(0);// 쿠키삭제 
				response.addCookie(c); 
			// 세션을 삭제해주는 로직을 작성 //
			HttpSession session=request.getSession(false);
			if(session!=null) {
				session.invalidate();
			}
			
			msg = "정상적으로 탈퇴되었습니다!";
			loc = "/";
		} else {
			msg = "회원탈퇴에 실패했습니다 다시시도하세요";
			loc = "/member/memberView.do";
		}
		// request에 데이터 세팅하기
		request.setAttribute("msg", msg); // 메시지 
		request.setAttribute("loc", loc); // 위치

		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
