package com.notice.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.notice.model.service.NoticeService;
import com.notice.model.vo.Notice;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class NoticeFileUploadAjax
 */
@WebServlet("/notice/noticeFileUpload.do")
public class NoticeFileUploadAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeFileUploadAjax() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String path = getServletContext().getRealPath("/upload/notice/");
		MultipartRequest mr = new MultipartRequest(request, path, 1024*1024*10,"UTF-8",new DefaultFileRenamePolicy());
		
		String title = mr.getParameter("title");
		String content = mr.getParameter("content");
		
		Enumeration<String> enu = mr.getFileNames();
		List<String> fileNameList = new ArrayList();
		
		while(enu.hasMoreElements()) {
			fileNameList.add(mr.getFilesystemName(enu.nextElement()));
		}
		
		System.out.println(fileNameList);
		System.out.println(title);
		System.out.println(content);
		
		
		
		Notice notice = Notice.builder().noticeTitle(title).noticeContent(content).filePath(getStringFromList(fileNameList)).build();
		
		int result = new NoticeService().insertNotice(notice);
		
		response.setContentType("text/html;charset=utf-8");
		
		if(result>0) {
			//response.getWriter().write(1123414);
			response.sendRedirect(request.getContextPath());
		}else {
			response.sendRedirect(request.getContextPath());
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	
	private String getStringFromList(List<String> list) {
		
		if(list==null) return "";
		
		String fileNameStr="";
		
		for(String s : list) {
			fileNameStr += s + "|";
		}
		
		return fileNameStr;
	}
	
	
	
	
	
	
}




























