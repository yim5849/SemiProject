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
 * Servlet implementation class MarketMainViewServlet
 */
@WebServlet("/marketMainView.do")
public class MarketMainViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MarketMainViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//중고거래 메인화면을 출력해주는 서블릿
		
		//1.DB에 접속해서 판매게시글 테이블의 전체 리스트를 가져온다
		List<ProductBoard> list =new MarketService().allProduct();
		//System.out.println(list);
		//2.전체 리스트를 저장한다 
		request.setAttribute("list", list);
		//3.JSP 화면으로 출력해준다 
		request.getRequestDispatcher("/views/market/marketMainView.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
