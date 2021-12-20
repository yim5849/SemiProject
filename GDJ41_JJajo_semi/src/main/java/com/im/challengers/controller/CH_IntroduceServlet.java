package com.im.challengers.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.im.challengers.model.service.CH_AdvertisementService;
import com.im.challengers.model.vo.CH_Advertisement;

/**
 * Servlet implementation class CH_IntroduceServlet
 */
@WebServlet("/challengers/introduce.do")
public class CH_IntroduceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CH_IntroduceServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		/* 광고 */
		List<CH_Advertisement> adlist = new CH_AdvertisementService().searchAllAdvertisement();
		
		request.setAttribute("advertisementList", adlist);
		
		
		request.getRequestDispatcher("/views/challengers/challengers_introduce.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
