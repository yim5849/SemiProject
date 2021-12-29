package com.db.find.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.find.model.service.FindService;
import com.google.gson.Gson;
import com.jj.member.model.vo.Member;

/**
 * Servlet implementation class FindFollowingListAjaxServlet
 */
@WebServlet("/find/findFriendsList.do")
public class FindFollowingListAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindFollowingListAjaxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberNo = request.getParameter("memberNo");
		
		List<Member> followingList = new FindService().findFollowing(memberNo);
		
		
		response.setContentType("application/json;charset=utf-8");
		
		new Gson().toJson(followingList,response.getWriter());
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
