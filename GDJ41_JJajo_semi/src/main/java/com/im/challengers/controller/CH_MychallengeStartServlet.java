package com.im.challengers.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.im.challengers.model.service.CH_MychallengeService;
import com.im.challengers.model.vo.CH_Mychallenge;

/**
 * Servlet implementation class ChallengersStartServlet
 */
@WebServlet("/challengers/ch_start.do")
public class CH_MychallengeStartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CH_MychallengeStartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		int challengersNo = Integer.parseInt(request.getParameter("challengersNo"));
		System.out.println("memberNo = "+memberNo+" challengersNo = "+challengersNo);
		
		List<CH_Mychallenge> myList = new CH_MychallengeService().searchChallenge(memberNo,challengersNo);
		
		int count=0;
		
		if(myList==null || myList.isEmpty()) {
			count=1;
		}else {
			for(CH_Mychallenge my : myList) {
				if(count<my.getCount()) {
				count=my.getCount();
				}
			}
			count++;
		}
		
		int result = new CH_MychallengeService().startChallenge(count,memberNo,challengersNo);
		
		String msg="";
		String loc="";
		if(result>0) {
			msg="챌린지 신청에 성공하였습니다! :)";
			loc="/challengers/introduce.do";
		}else {
			msg="회원님.. 챌린지 신청에 문제가 발생하였습니다 :(";
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
