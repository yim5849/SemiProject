package com.jm.market.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jm.market.model.vo.ProductBoard;
import com.jm.market.service.MarketService;

/**
 * Servlet implementation class ReviewEnrollServlet
 */
@WebServlet("/reviewEnroll.do")
public class ReviewEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewEnrollServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 리뷰작성페이지로 화면전환
		int productNo=Integer.parseInt(request.getParameter("productNo"));
		ProductBoard pb=new MarketService().reviewBoard(productNo);
		request.setAttribute("pb", pb);
		request.getRequestDispatcher("/views/market/store/reviewEnroll.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
