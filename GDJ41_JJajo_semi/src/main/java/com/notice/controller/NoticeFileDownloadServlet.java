package com.notice.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class NoticeFileDownloadServlet
 */
@WebServlet("/notice/noticeFileDown.do")
public class NoticeFileDownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeFileDownloadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String fileName=request.getParameter("fileName");
		
		String path = request.getServletContext().getRealPath("/upload/notice/");
		String filePath = path+fileName;
		
		FileInputStream fis = new FileInputStream(filePath);
	
		BufferedInputStream bis= new BufferedInputStream(fis);
		
	
		String fileRename="";
		
		String header=request.getHeader("user-agent");
		
		
		boolean isMSIE = header.contains("MSIE")||header.contains("Trident");
		if(isMSIE) {
			fileRename=URLEncoder.encode(fileName,"UTF-8").replaceAll("\\+", "%20");
		}else {
			fileRename=new String(fileName.getBytes("utf-8"),"ISO-8859-1");
		}
		
		
		ServletOutputStream sos=response.getOutputStream();
		BufferedOutputStream bos=new BufferedOutputStream(sos);
		
		
	
		response.setContentType("application/octet-stream");
		
		response.setHeader("Content-disposition", "attachment;filename="+fileRename);
		
	
		int read=-1;
		while((read=bis.read())!=-1) {
			bos.write(read);
		}
		
		bis.close();
		bos.close();
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
