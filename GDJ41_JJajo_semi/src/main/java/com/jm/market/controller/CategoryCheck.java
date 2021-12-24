package com.jm.market.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.jm.market.model.vo.ProductBoard;
import com.jm.market.service.MarketService;

/**
 * Servlet implementation class CategoryCheck
 */
@WebServlet("/categoryCheck.do")
public class CategoryCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategoryCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//정렬할 카테고리 값을 가져온다 
		
		String category=request.getParameter("category");
		//System.out.println(category);
		List<ProductBoard> list =new MarketService().categoryMain(category);
		//System.out.println(list);
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/market/marketMainView.jsp").forward(request, response);
		
		//response.setContentType("application/json;charset=UTF-8");
		//new Gson().toJson(list,response.getWriter());
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
