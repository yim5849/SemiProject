package com.im.challengers.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.im.challengers.model.service.CH_MychallengeService;
import com.im.challengers.model.vo.CH_Mychallenge;

/**
 * Servlet implementation class CH_MychallengeFinishServlet
 */
@WebServlet("/challengers/mychallenge_finish_submit.do")
public class CH_MychallengeFinishServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CH_MychallengeFinishServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String check = request.getParameter("my_finish_N");
		int myNo;
		if(request.getParameter("my_finish_myNo")==null) {
			System.out.println("문제발생");
			return;
		}else {
			myNo = Integer.parseInt(request.getParameter("my_finish_myNo"));
		}
		System.out.println(check+" 뭘까  "+myNo);


		int result = new CH_MychallengeService().finishChallenge(check,myNo);
		
		String msg="";
		String loc="";
		if(result>0) {
			msg=" 챌린지가 정상적으로 완료되었습니다! :)";
			loc="/challengers/mychallenge.do";
		}else {
			msg="문제가 발생하였습니다 :(";
			loc="/challengers/mychallenge.do";
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
