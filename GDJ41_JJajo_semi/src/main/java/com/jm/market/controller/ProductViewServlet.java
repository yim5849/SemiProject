package com.jm.market.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jj.member.model.vo.Member;
import com.jm.market.model.vo.ProductBoard;
import com.jm.market.service.MarketService;

/**
 * Servlet implementation class ProductViewServlet
 */
@WebServlet("/productView.do")
public class ProductViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//메인화면에서 받아온 BOARDNO로 해당 게시글 조회
		//1.메인페이지에서 조회할 상품번호 값 불러오기
		int productNo=Integer.parseInt(request.getParameter("productNo"));
		//2.조회할 BOARDNO 게시글 가져오기
		ProductBoard pb=new MarketService().searchProduct(productNo);
		 
		//3.저장하기
		request.setAttribute("productBoard", pb);
		
		//4.화면으로 전송하기
		request.getRequestDispatcher("/views/market/product.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
