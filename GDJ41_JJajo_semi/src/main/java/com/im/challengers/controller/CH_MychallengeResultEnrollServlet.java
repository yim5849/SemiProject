package com.im.challengers.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.im.challengers.model.service.CH_MychallengeService;

/**
 * Servlet implementation class CH_MychallengeResultEnrollServlet
 */
@WebServlet("/challengers/result_enroll.do")
public class CH_MychallengeResultEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CH_MychallengeResultEnrollServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String myDay=request.getParameter("ch_Day");
		int count = Integer.parseInt(request.getParameter("ch_Count"));
		int chNo=Integer.parseInt(request.getParameter("challengers_No"));
		int memberNo=Integer.parseInt(request.getParameter("member_No"));
		String result=request.getParameter("chResult");
			
		int end = new CH_MychallengeService().challengeResultEnroll(myDay, count, chNo, memberNo, result);
		
		String msg="";
		String loc="";
		if(end>0) {
			msg="결과 등록이 정상적으로 완료되었습니다! :)";
			loc="/challengers/mychallenge.do?challengersNo="+chNo;
		}else {
			msg="결과 등록에 문제가 발생하였습니다 :(";
			loc="/challengers/mychallenge.do?challengersNo="+chNo;
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
