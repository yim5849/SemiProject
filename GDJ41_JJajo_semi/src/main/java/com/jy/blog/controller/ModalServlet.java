package com.jy.blog.controller;

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

import com.db.main.model.service.MainBoardService;
import com.db.main.model.vo.AttachedFile;
import com.db.main.model.vo.MainBoard;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class ModalServlet
 */
@WebServlet("/blog/modal.do")
public class ModalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModalServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String path = request.getServletContext().getRealPath("/upload/blog/");
		int maxSize = 1024 * 1024 * 10;
		String encode = "UTF-8";
		// 업로드 처리
		MultipartRequest mr=new MultipartRequest(request, path, maxSize, encode,new DefaultFileRenamePolicy());
				
				System.out.println("boardNo넘어오는지 확인!!!"+mr.getParameter("boardNo"));
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
