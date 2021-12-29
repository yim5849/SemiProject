package com.jy.blog.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.main.model.service.MainBoardService;
import com.db.main.model.vo.AttachedFile;
import com.google.gson.Gson;

/**
 * Servlet implementation class BlogImgListAjaxServlet
 */
@WebServlet("/blog/blogImgList.do")
public class BlogImgListAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BlogImgListAjaxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String boardNo=request.getParameter("boardNo");
		System.out.println("보드넘버!!"+boardNo);
		List<AttachedFile> imageList=new MainBoardService().getImageList(boardNo);
		
		response.setContentType("application/json;charset=utf-8");
		new Gson().toJson(imageList,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
