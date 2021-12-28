package com.jm.market.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jj.member.model.vo.Member;
import com.jm.market.model.vo.ProductBoard;
import com.jm.market.service.MarketService;

/**
 * Servlet implementation class MarketMyStoreServet
 */
@WebServlet("/myStore.do")
public class MarketMyStoreServet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MarketMyStoreServet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 중고거래 내상점 화면으로 전환해주는 서블릿
		String memberNo=request.getParameter("memberNo");
		List<ProductBoard> list= new MarketService().storeMain(memberNo);
		Member m=new MarketService().searchMember(memberNo);
		
		/*
		 * if(request.getParameter("productNo")!=null) { int
		 * productNo=Integer.parseInt(request.getParameter("productNo")); ProductBoard
		 * pb=new MarketService().searchProduct(productNo);
		 * request.setAttribute("productBoard", pb); }
		 */
		request.setAttribute("list", list); 
		request.setAttribute("member", m); 
		request.getRequestDispatcher("/views/market/store/mystore.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
