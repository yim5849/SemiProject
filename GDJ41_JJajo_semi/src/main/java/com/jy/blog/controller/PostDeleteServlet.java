package com.jy.blog.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.main.model.service.MainBoardService;

/**
 * Servlet implementation class PostDeleteServlet
 */
@WebServlet("/blog/postdelete.do")
public class PostDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String boardNo = request.getParameter("delete_post");
		/* System.out.println("송신 성공!! 넘어온 번호는 :"+boardNo); */
		
		int userNo=Integer.parseInt(request.getParameter("delete_post_userNo"));
		
		int result=new MainBoardService().deletePost(boardNo);
		
		
		
		
		String msg="";
		String loc="";
		if(result>0) {
			msg="게시물 삭제 완료!";
			loc="/blog/blogmain.do?memberNo="+userNo;
		}else {
				msg="게시물 삭제 실패";
				loc="/blog/blogmain.do?memberNo="+userNo;
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
