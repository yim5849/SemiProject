package com.im.challengers.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.im.challengers.model.service.CH_ChallengersService;

/**
 * Servlet implementation class CH_ChallengersUpdateServlet
 */
@WebServlet("/challengers/ch_update.do")
public class CH_ChallengersUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CH_ChallengersUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int chNo = Integer.parseInt(request.getParameter("challengersNo"));
		
		request.setAttribute("challengers", new CH_ChallengersService().searchChallengers(chNo));
		
		request.getRequestDispatcher("/views/challengers/challengers_list_update.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
