package com.im.challengers.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.im.challengers.model.service.CH_MychallengeImageService;

/**
 * Servlet implementation class CH_MychallengersImageDeleteServlet
 */
@WebServlet("/challengers/galary_delete.do")
public class CH_MychallengersImageDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CH_MychallengersImageDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int imageNo = Integer.parseInt(request.getParameter("image_del_imNum"));
								
		// 화면 전환시 get방식으로 전환하기 위해 필요한 데이터 => 갤러리 등록 후 해당 챌린저스의 마이페이지로 돌아가야하기 때문
		int chNo = Integer.parseInt(request.getParameter("galary_challengersNo"));
		
		
		int result = new CH_MychallengeImageService().deleteMyImage(imageNo);
		
		String msg="";
		String loc="";
		if(result>0) {
			msg="사진이 정상적으로 완료되었습니다! :)";
			loc="/challengers/mychallenge.do?challengersNo="+chNo;
		}else {
			msg="사진을 삭제하는 과정에서 문제가 발생하였습니다 :(";
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
