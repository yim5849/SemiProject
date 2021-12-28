package com.im.challengers.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.im.challengers.model.service.CH_MychallengeImageService;
import com.im.challengers.model.vo.CH_MychallengeImage;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class CH_MychallengeImageUpdateEndServlet
 */
@WebServlet("/challengers/galary_update.do")
public class CH_MychallengeImageUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CH_MychallengeImageUpdateEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "시스템 에러 [form:enctype] 관리자에게 문의하세요 :(");
			request.setAttribute("loc", "/challengers/mychallenge.do");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}
		
		String path=getServletContext().getRealPath("/upload/challengers/");
		
		int maxSize = 1024*1024*10;
		
		String encode="UTF-8";
		
		MultipartRequest mr=new MultipartRequest(request,path,maxSize,
												encode,new DefaultFileRenamePolicy());
		

		CH_MychallengeImage im=CH_MychallengeImage.builder()
			.ch_imgNo(Integer.parseInt(mr.getParameter("image_up_imNum")))
			.build();
	
		File f=mr.getFile("galary_upfile");
		
		if(f!=null&&f.length()>0) {
		//클라이언트가 데이터를 넘김
		//이전파일삭제
		File deleteFile=new File(path+mr.getParameter("galary_orifile"));
		deleteFile.delete();
		im.setFilepath(mr.getFilesystemName("galary_upfile"));
		}else {
		//업로드파일이 없음
		im.setFilepath(mr.getParameter("galary_orifile"));
		}
		
		int result = new CH_MychallengeImageService().updateMyImage(im);
		
		int chNo=Integer.parseInt(mr.getParameter("galary_up_challengersNo"));
		
		
		
		String msg="";
		String loc="";
		if(result>0) {
			msg="사진이 정상적으로 수정되었습니다! :)";
			loc="/challengers/mychallenge.do?challengersNo="+chNo;
		}else {
			msg="사진을 수정하는 과정에서 문제가 발생하였습니다 :(";
			loc="/challengers/mychallenge.do?challengersNo="+chNo;
		}
		request.setAttribute("msg",msg);
		request.setAttribute("loc",loc);
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
