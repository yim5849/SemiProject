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

import com.jm.market.model.vo.AttachedFiles;
import com.jm.market.model.vo.ProductBoard;
import com.jm.market.service.MarketService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class ProductEnrollEndServlet
 */
@WebServlet("/enrollProductEnd.do")
public class ProductEnrollEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductEnrollEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 상품등록화면에서 얻어온 데이터 변수명에 대입하기
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
		
		ProductBoard pb=ProductBoard.builder().title(mr.getParameter("title"))
				                              .address(mr.getParameter("address"))
				                              .price(Integer.parseInt(mr.getParameter("price")))
				                              .category(mr.getParameter("category"))
				                              .content(mr.getParameter("content"))
				                              .memberNo(Integer.parseInt(mr.getParameter("memberNo")))
				                              .fileName(filenames)
				                              .build();
		
	  
		System.out.println(pb);
		//System.out.println(pb.getFileName().get(1));
		int result=new MarketService().insertBoard(pb);
		 
		
		//int pdno=new MarketService().maxCount(pb);
		//System.out.println(pdno);
//		int result2=new MarketService().insertFile(pb,pdno);
		
		
		String msg="";
		String loc="";
		if(result>0) {
			msg="상품 등록 성공";
			loc="/marketMainView.do";
		}else {
			msg="상품 등록 실패";
			loc="/enrollproduct.do";
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
