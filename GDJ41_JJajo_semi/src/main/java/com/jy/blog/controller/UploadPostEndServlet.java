package com.jy.blog.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.db.main.model.service.MainBoardService;
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
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				//파일 업로드가 된 요청인지 아닌지 판단
				if(!ServletFileUpload.isMultipartContent(request)) {
					//파일업로드 요청을 해야하는데 그 요청이 아닐 때 예외처리
					request.setAttribute("msg","공지사항 작성오류 [form:enctype] 관리자에게 문의하세요! :(");
					request.setAttribute("loc","/notice/noticeList.do");
					request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
					return;
				}
				
				String path=request.getServletContext().getRealPath("/upload/board/");
				System.out.println(path);
				
				//저장할 파일의 크기를 설정 -> 요청정보를 받을 때 크기
				int maxSize=1024*1024*10;
				
				//문자열에 대한 인코딩 설정
				String encode="UTF-8";
				
				//업로드 처리
				MultipartRequest mr=new MultipartRequest(request,path,maxSize,encode,new DefaultFileRenamePolicy());
				
				//DB에 저장할 데이터 가져오기
				// ************ tag, image 추가해야함 ***************
				MainBoard mb=MainBoard.builder()
						.boardTitle(mr.getParameter("title"))
						.boardContent("content")
						.build();
				
				int result=new MainBoardService().insertMainBoard(mb);
				String msg="";
				String loc="";
				if(result>0) {
					msg="게시물을 등록했습니다.";
					loc="/blog/blogmain.do";
				}else {
					msg="게시물을 등록에 실패했습니다.";
					loc="/blog/uploadpost.do";
				}
				request.setAttribute("msg", msg);
				request.setAttribute("loc", loc);
				request.getRequestDispatcher("/views/common/msg.jsp")
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
