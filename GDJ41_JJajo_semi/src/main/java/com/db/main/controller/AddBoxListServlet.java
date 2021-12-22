package com.db.main.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.main.model.service.MainBoardService;
import com.db.main.model.vo.MainBoard;

/**
 * Servlet implementation class AddBoxListServlet
 */
@WebServlet("/main/addBoxList")
public class AddBoxListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddBoxListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int curPosition;
		try {
			curPosition=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			curPosition=2;
		}
		
		int numPerOnce=20;
		
		List<MainBoard> mbList = new MainBoardService().searchMainBoard(curPosition,numPerOnce);
		
		request.setAttribute("mainBoardList", mbList);
		
		request.getRequestDispatcher("/views/main/addmainbox.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
