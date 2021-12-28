package com.jm.market.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.json.simple.JSONObject;

import com.jm.market.model.vo.Comment;
import com.jm.market.service.MarketService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class ReviewEnrollEndServlet
 */
@WebServlet("/reviewEnrollend.do")
public class ReviewEnrollEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewEnrollEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//리뷰작성 서블릿
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "잘못된 요청입니다 관리자에게 문의하세요 XD");
			request.setAttribute("loc", "/board/enrollBoard.do");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}
		 
		
		String path=getServletContext().getRealPath("/upload/market/");
		MultipartRequest mr=new MultipartRequest(request, path,1024*1024*10,
				"UTF-8",new DefaultFileRenamePolicy());
		
		
		int memberNo=Integer.parseInt(mr.getParameter("memberNo"));
		int productNo=Integer.parseInt(mr.getParameter("productNo"));
		String title=mr.getParameter("title");
		String writer=mr.getParameter("writer");
		String content=mr.getParameter("content");
		System.out.println(title);
		System.out.println(productNo);
		System.out.println(writer);
		System.out.println(content);
		Comment c=Comment.builder().memberNo(memberNo).productNo(productNo).commentContent(content).CommentWriter(writer).productTitle(title).build();
		
		int result = new MarketService().insertReview(c);
		
		String msg="";
		String loc="";
		if(result>0) {
			msg="성공적으로 후기가 등록되었습니다";
			loc="/marketMainView.do";
		}else {
			msg="후기등록에 실패하였습니다. 다시 시도해주세요";
			loc="/reviewEnroll.do?productNo="+productNo;
			
		}
		   
		JSONObject jo=new JSONObject();
		jo.put("msg", msg);
		jo.put("loc", loc);
		response.setContentType("application/json;charset=UTF-8");
		response.getWriter().print(jo);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
