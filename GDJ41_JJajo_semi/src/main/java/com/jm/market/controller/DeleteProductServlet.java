package com.jm.market.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jm.market.service.MarketService;

/**
 * Servlet implementation class DeleteProductServlet
 */
@WebServlet("/deleteProduct.do")
public class DeleteProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 게시글 삭제하는 서블릿
		
		int productNo =Integer.parseInt(request.getParameter("productNo"));
		String memberNo=request.getParameter("memberNo");
		System.out.println(productNo);
		
		int result = new MarketService().deleteProduct(productNo);
		System.out.println(result);
		
		String msg="";
		String loc="";
		if(result>0) {
			msg="상품이 삭제 되었습니다";
			loc="/myStore.do?memberNo="+memberNo;
		}else {
			msg="상품 삭제에 실패했습니다";
			loc="/myStore.do?memberNo="+memberNo;
		}
		
		request.setAttribute("msg", msg);
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
