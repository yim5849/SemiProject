package com.im.challengers.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.im.challengers.model.service.CH_MychallengeNoticeService;
import com.im.challengers.model.vo.CH_MychallengeNotice;

/**
 * Servlet implementation class CH_MychallengeUpdateEndServlet
 */
@WebServlet("/challengers/update_end.do")
public class CH_MychallengeNoticeUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CH_MychallengeNoticeUpdateEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int noNo = Integer.parseInt(request.getParameter("updatenoticeNo"));
		String content = request.getParameter("chNotice_content");
		
		CH_MychallengeNotice no=null;
		
		no = CH_MychallengeNotice.builder()
				.mychallengeNoticeNo(noNo)
				.content(content).build();
		System.out.println(no);
		int result = new CH_MychallengeNoticeService().updateMychallengeNotice(no);
		
		String msg="";
		String loc="";
		
		if(result>0) {
			msg="관리자님! 마이챌린지 안내사항 수정이 완료되었습니다 :)";
		}else {
			msg="관리자님! 마이챌린지 안내사항 수정에 문제가 발생하였습니다 :(";
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
