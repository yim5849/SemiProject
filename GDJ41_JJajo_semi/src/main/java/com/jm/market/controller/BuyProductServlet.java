package com.jm.market.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jm.market.service.MarketService;

/**
 * Servlet implementation class BuyProductServlet
 */
@WebServlet("/buyProduct.do")
public class BuyProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuyProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//구매하기버튼 클릭시 해당 pd_no를 PD_BUY테이블에 추가하는 서블릿
		
		String productNo=request.getParameter("productNo");
		String memberNo=request.getParameter("memberNo");
		System.out.println(productNo);
		System.out.println(memberNo);
		
		int result=new MarketService().buyProduct(productNo,memberNo);
		
		
		String msg="";
		String loc="";
		if(result>0) {
			msg="성공적으로 구매 되었습니다";
			loc="/marketMainView.do";
		}else {
			msg="구매에 실패 했습니다";
			loc="/productView.do?productNo="+productNo;
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
