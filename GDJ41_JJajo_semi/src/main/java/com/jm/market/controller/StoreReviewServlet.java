package com.jm.market.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jm.market.model.vo.Comment;
import com.jm.market.service.MarketService;

/**
 * Servlet implementation class StoreReviewServlet
 */
@WebServlet("/review.do")
public class StoreReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StoreReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//후기화면으로 전환
		String memberNo=request.getParameter("memberNo");
		String memberName=request.getParameter("memberName");
		//String title=request.getParameter("title");
	//	System.out.println(memberNo);
	//	System.out.println(memberName);
		List<Comment> list= new MarketService().commentAll(memberNo);
		//System.out.println(list);
		
		//request.setAttribute("title", title);
		request.setAttribute("memberNo", memberNo);
		request.setAttribute("memberName", memberName);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/market/store/reviewView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
