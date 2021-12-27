package com.im.challengers.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.im.challengers.model.service.CH_MychallengeNoticeService;

/**
 * Servlet implementation class CH_MychallengeNoticeSubmitServlet
 */
@WebServlet("/challengers/notice_submit.do")
public class CH_MychallengeNoticeSubmitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CH_MychallengeNoticeSubmitServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String content = request.getParameter("chNotice_content");
		System.out.println(content);
		
		int result = new CH_MychallengeNoticeService().insertMychallengeNotice(content);
		
		String msg="";
		String loc="";
		
		if(result>0) {
			msg="관리자님! 마이챌린지 안내사항 등록이 완료되었습니다 :)";
		}else {
			msg="관리자님! 마이챌린지 안내사항 등록에 문제가 발생하였습니다 :(";
		}
		loc="/challengers/mychallenge.do";
		
		request.setAttribute("msg",msg);
		request.setAttribute("loc", loc);
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
