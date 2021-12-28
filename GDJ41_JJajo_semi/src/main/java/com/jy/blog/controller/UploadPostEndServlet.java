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
 * Servlet implementation class UploadPostEndServlet
 */
@WebServlet("/blog/uploadpostend.do")
public class UploadPostEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
 
 
	public UploadPostEndServlet() { 
		// TODO Auto-generated constructor stub
 
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 파일 업로드가 된 요청인지 아닌지 판단
		if (!ServletFileUpload.isMultipartContent(request)) {
			// 파일업로드 요청을 해야하는데 그 요청이 아닐 때 예외처리
			request.setAttribute("msg", "공지사항 작성오류 [form:enctype] 관리자에게 문의하세요! :(");
			request.setAttribute("loc", "/blog/uploadpost.do");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}
		
		String path = request.getServletContext().getRealPath("/upload/blog/");
		int maxSize = 1024 * 1024 * 10;
		String encode = "UTF-8";
		// 업로드 처리
		MultipartRequest mr=new MultipartRequest(request, path, maxSize, encode,new DefaultFileRenamePolicy());
		//다중으로 업로드된 파일명 가져오기
		Enumeration<String> e=mr.getFileNames();//업로드된 파일들에 대한 파일명을 모두 가져옴
		List<AttachedFile> afList=new ArrayList<AttachedFile>();
		AttachedFile af= null;
		while(e.hasMoreElements()) {
			af=AttachedFile.builder()
							.imgName(mr.getFilesystemName(e.nextElement()))
							.build();
			afList.add(af);
		}
		
		//태그 리스트 - List<String> tagList 이제 안써서 필요없음
		/* List<String> htList=new ArrayList<String>(); */
		/*
		 * System.out.println("mr.title: " + mr.getParameter("title"));
		 * System.out.println("mr.content: " + mr.getParameter("content"));
		 * System.out.println("mr.tag: " + mr.getParameter("tag"));
		 */
		
		/*
		 * String tag=mr.getParameter("tag"); System.out.println(tag); String[]
		 * tags=tag.split("#"); //조건문 수정필요 -> #으로 시작, 띄어쓰기X, _(언더바)만 사용가능
		 * System.out.println(tags); for(int i=0; i<tags.length;i++) {
		 * htList.add(tags[i]); }
		 */
		 
		//멤버넘버 -> 개인블로그주소 구분짓기 위함(blog+memberNo)
		String memberNo = mr.getParameter("memberNo");

		// DB에 저장할 데이터 가져오기
		MainBoard mb = MainBoard.builder()
				.boardTitle(mr.getParameter("title"))
				.boardContent(mr.getParameter("content"))
				.tag(mr.getParameter("tag"))
				.attachedFileList(afList)
				.build();
		
		 int result=new MainBoardService().insertBoard(mb,memberNo);
		 
		 
		 
		 String msg="";
		 String loc="";
		 if(result>0) {
			 msg="게시물을 등록했습니다.";
			 loc="/blog/blogmain.do?memberNo="+memberNo; }
		 else {
			 msg="게시물을 등록에 실패했습니다.";
			 loc="/blog/uploadpost.do";
			 }
		 
		 
		 JSONObject jo=new JSONObject();
		 jo.put("msg",msg);
		 jo.put("loc",loc);
		 
		 response.setContentType("application/json;charset=UFT-8");
		 response.getWriter().print(jo);
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
				/*
				 * request.setAttribute("msg", msg); request.setAttribute("loc", loc);
				 * request.getRequestDispatcher("/views/common/msg.jsp")
				 * .forward(request,response);
				 */
		 
		
		 

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
