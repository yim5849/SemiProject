package com.jm.market.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.json.simple.JSONObject;

import com.jm.market.model.vo.AttachedFiles;
import com.jm.market.model.vo.ProductBoard;
import com.jm.market.service.MarketService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class UpdateProductEndServlet
 */
@WebServlet("/updateProductEnd.do")
public class UpdateProductEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProductEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "잘못된 요청입니다 관리자에게 문의하세요 XD");
			request.setAttribute("loc", "/board/enrollBoard.do");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}
		 
		
		String path=getServletContext().getRealPath("/upload/market/");
		MultipartRequest mr=new MultipartRequest(request, path,1024*1024*10,
				"UTF-8",new DefaultFileRenamePolicy());
		
		Enumeration<String> e=mr.getFileNames();
		List<AttachedFiles> filenames=new ArrayList();
		AttachedFiles file=null;
		
		while (e.hasMoreElements()) {
			file=AttachedFiles.builder().
						    fileName(mr.getFilesystemName(e.nextElement())).build();
			filenames.add(file);
		}
		System.out.println(filenames);
		
		ProductBoard pb=ProductBoard.builder().productNo(Integer.parseInt(mr.getParameter("productNo")))
											  .title(mr.getParameter("title"))
				                              .address(mr.getParameter("address"))
				                              .price(Integer.parseInt(mr.getParameter("price")))
				                              .category(mr.getParameter("category"))
				                              .content(mr.getParameter("content")) 
				                              .memberNo(Integer.parseInt(mr.getParameter("memberNo")))
				                              .fileName(filenames)
				                              .build();
		System.out.println(pb);		
				
		int result =new MarketService().updateBoard(pb);
		
		
		String msg="";
		String loc="";
		if(result>0) {
			msg="상품 수정 성공";
			loc="/marketMainView.do";
		}else {
			msg="상품 수정 실패";
			loc="/enrollproduct.do";
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
