package com.im.challengers.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.im.challengers.model.service.CH_ChallengersService;

/**
 * Servlet implementation class CH_ChallengersDeleteServlet
 */
@WebServlet("/challengers/ch_delete.do")
public class CH_ChallengersDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CH_ChallengersDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int chNo=Integer.parseInt(request.getParameter("challengersNo"));
		
		int result = new CH_ChallengersService().deleteChallengers(chNo);
		
		String msg="";
		String loc="";
		if(result>0) {
			msg="관리자님! 챌린져스 삭제가 정상적으로 완료되었습니다! :)";
			loc="/challengers/introduce.do";
		}else {
			msg="관리자님! 챌린져스 삭제 프로세스에 문제가 발생하였습니다 :(";
			loc="/challengers/introduce.do";
		}
		request.setAttribute("msg",msg);
		request.setAttribute("loc",loc);
		request.getRequestDispatcher("/views/common/msg.jsp")
		.forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
