package com.jy.blog.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.db.main.model.service.MainBoardService;
import com.db.main.model.vo.AttachedFile;
import com.db.main.model.vo.MainBoard;
import com.jj.member.model.vo.Member;

/**
 * Servlet implementation class BlogMainServlet
 */
@WebServlet("/blog/blogmain.do")
public class BlogMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BlogMainServlet() {
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
			curPosition=1;
		}
		
		
		int numPerOnce=20;
		//String memberNo= request.getParameter(getServletName());
		String memberNo=request.getParameter("memberNo");

		List<MainBoard> ubList = new MainBoardService().getUserBlog(curPosition, numPerOnce,memberNo); //member_no 보내야함
		
		request.setAttribute("userBoardList", ubList);//생성!
		
		List<String> allTags = new MainBoardService().getAllTags();
		request.setAttribute("allTags", allTags);
		/*
		 * if(ubList!=null&&!(ubList.isEmpty())){ for(MainBoard u : ubList) {
		 * System.out.println("BlogMainServlet 테스트 : "+u.getAttachedFileList().get(
		 * numPerOnce));
		 * 
		 * }
		 * 
		 * }
		 */
		
		
		HttpSession session=request.getSession(false);
		Member m=null;
		if(session!=null) {
			if(session.getAttribute("loginMember")!=null) {
				m=(Member)session.getAttribute("loginMember");
			}else if(session==null || m==null) {
				
				String msg="로그인 후, 이용해주세요! :(";
				String loc="/";
				
				request.setAttribute("msg",msg);
				request.setAttribute("loc", loc);
				request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
				return;
			}
		}
		int memberNo1=m.getMemberNo();
		
		//이미지만들기(병승쌤)
		Map<Integer,String> imageMap=new HashMap();
		for(int i=0;i<ubList.size();i++) {
			List<AttachedFile> imgList=ubList.get(i).getAttachedFileList();
			String nameimg="";
			for(int j=0;j<imgList.size();j++) {
				if(j!=0) nameimg+=",";
				nameimg=imgList.get(j).getImgName();
			}
			imageMap.put(i, nameimg);
		}
		System.out.println(imageMap);
		
		
		
		
		String myinfo = new MainBoardService().getMyInfo(memberNo1);
		request.setAttribute("myInfo",myinfo);
		
		
		/* new Gson().toJson(ubList,response.getWriter()); */
		
		
		
		request.getRequestDispatcher("/views/blog/blogMain.jsp")
		.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
