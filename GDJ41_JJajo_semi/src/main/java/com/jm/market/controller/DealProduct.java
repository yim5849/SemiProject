package com.jm.market.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jm.market.service.MarketService;

/**
 * Servlet implementation class DealProduct
 */
@WebServlet("/dealProduct.do")
public class DealProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DealProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 거래완료료 변경해주는 서블릿 pd_sale 'Y'=>'N'으로변경
		
		int productNo =Integer.parseInt(request.getParameter("productNo"));
		String memberNo=request.getParameter("memberNo"); 
		
		int result = new MarketService().dealProduct(productNo);

		String msg="";
		String loc="";
		if(result>0) {
			msg="거래완료로 변경 되었습니다";
			loc="/myStore.do?memberNo="+memberNo;
		}else {
			msg="거래완료에 실패했습니다";
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
