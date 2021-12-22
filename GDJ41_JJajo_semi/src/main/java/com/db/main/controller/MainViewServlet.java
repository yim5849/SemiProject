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
import com.google.gson.Gson;

/**
 * Servlet implementation class MainViewServlet
 */
@WebServlet("/main/mainView.do")
public class MainViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainViewServlet() {
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
		System.out.println(curPosition);
		int numPerOnce=20;
		
		List<MainBoard> mbList = new MainBoardService().searchMainBoard(curPosition,numPerOnce);
		
//	
//		JSONArray jarr = new JSONArray();
//		
//		for(MainBoard mb :mbList) {
//			JSONObject jo = new JSONObject();
//			jo.put("no", mb.getBoardNo());
//			jo.put("title", mb.getBoardTitle());
//			jo.put("content", mb.getBoardContent());
//			jo.put("mainImgName", findMainImageName(mb));
//			jo.put("profileImgName", "profile.png");  //프로필 이미지 추가 해야함
//			jo.put("date", String.valueOf(mb.getBoardDate()));
//			jo.put("writer", mb.getMemberName());
//			
//			jarr.add(jo);
//		}
//		
//		response.setContentType("application/json;charset=utf-8");
//		response.getWriter().print(jarr);
		
		new Gson().toJson(mbList,response.getWriter());
		
		
		
		
	}
	
	// imgno 1번 있으면 이미지이름 리턴 없으면 "" 리턴 
	private String findMainImageName(MainBoard mb) {
		List<String> imgNoList= mb.getAttachedFile().getImgNoList();
		List<String> imgNameList = mb.getAttachedFile().getImgNameList();
		
		int idx = imgNoList.indexOf("1");
		
		if(idx>=0) {
			//메인이미지 있음
			return imgNameList.get(idx);
		}else {
			//없음
			return "";
		}
		
	}
	
	
	
	
	
	
	
	
	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
