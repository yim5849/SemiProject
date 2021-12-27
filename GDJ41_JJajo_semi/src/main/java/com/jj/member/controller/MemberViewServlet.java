package com.jj.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jj.common.AESCryptor;
import com.jj.member.model.service.MemberService;
import com.jj.member.model.vo.Member;

/**
 * Servlet implementation class MemberViewServlet
 */
@WebServlet("/member/memberView.do")
public class MemberViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//클라이언트가 보낸 아이디값을 기준으로 정보를 조회해서 화면에 보내주는 기능
		
		String memberId=request.getParameter("memberId");
		
			System.out.println(memberId);		
			
			Member m=new MemberService().checkIdDuplicate(memberId);
			try {
				m.setPhone(AESCryptor.decrypt(m.getPhone()));
				m.setEmail(AESCryptor.decrypt(m.getEmail()));
				m.setAddress(AESCryptor.decrypt(m.getAddress()));
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		
			request.setAttribute("member", m);
			
			
			request.getRequestDispatcher("/views/member/memberView.jsp")
			.forward(request, response);
			// 특정한 데이터 가져올 수 있게 하는 모습
		//}
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
