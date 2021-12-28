package com.jy.blog.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.json.simple.JSONObject;

import com.db.main.model.service.MainBoardService;
import com.jj.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class ModifyMyinfoEndServlet
 */
@WebServlet("/blog/myinfoend.do")
public class ModifyMyinfoEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyMyinfoEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		//		***** ModifyMyInfo 자기소개 수정!!!!!*******
		
		// 파일 업로드가 된 요청인지 아닌지 판단
		if (!ServletFileUpload.isMultipartContent(request)) {
			// 파일업로드 요청을 해야하는데 그 요청이 아닐 때 예외처리
			request.setAttribute("msg", "자기소개 작성오류 [form:enctype] 관리자에게 문의하세요! :(");
			request.setAttribute("loc", "/blog/blogmain.do");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}
		
		String path = request.getServletContext().getRealPath("/upload/blog/");
		int maxSize = 1024 * 1024 * 10;
		String encode = "UTF-8";
		// 업로드 처리
		MultipartRequest mr=new MultipartRequest(request, path, maxSize, encode,new DefaultFileRenamePolicy());

		Member m=Member.builder()
				.memberNo(Integer.parseInt(mr.getParameter("memberNo")))
				.myInfo(mr.getParameter("myInfo"))
				.build();
		
		int result=new MainBoardService().ModifyMyInfo(m);
		
		 String msg="";
		 String loc="";
		 if(result>0) {
			 msg="자기소개 수정 완료!";
			 loc="/blog/blogmain.do?memberNo="+m.getMemberNo(); }
		 else {
			 msg="자기소개 수정을 실패했습니다 :(";
			 loc="/blog/modifymyinfo.do";
			 }
		
		 JSONObject jo=new JSONObject();
		 jo.put("msg",msg);
		 jo.put("loc",loc);
		 
		 System.out.println("Complete : --- "+ m.getMyInfo() + " - " + m.getMemberName());
		 response.setContentType("application/json;charset=UFT-8");
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
