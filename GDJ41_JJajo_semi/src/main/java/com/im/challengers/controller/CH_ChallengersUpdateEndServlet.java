package com.im.challengers.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.im.challengers.model.service.CH_ChallengersService;
import com.im.challengers.model.vo.CH_Challengers;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class CH_ChallengersUpdateEndServlet
 */
@WebServlet("/challengers/ch_update_end.do")
public class CH_ChallengersUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CH_ChallengersUpdateEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "시스템 에러 [form:enctype] 관리자에게 문의하세요 :(");
			request.setAttribute("loc", "/notice/noticeList.do");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}
		
		String path=getServletContext().getRealPath("/images/challengers/");
		
		int maxSize = 1024*1024*10;
		
		String encode="UTF-8";
		
		MultipartRequest mr=new MultipartRequest(request,path,maxSize,
												encode,new DefaultFileRenamePolicy());
		
		CH_Challengers ch=CH_Challengers.builder()
											.challengersNo(Integer.parseInt(mr.getParameter("challengersNo")))
											.title(mr.getParameter("ch_title"))
											.content(mr.getParameter("ch_content"))
											.build();
		
		//파일이 전송됐는지 확인하고 전송이 됐으면 이전파일을 삭제
				//전송되지않았으면 이전파일을 넣어야함.
		File f=mr.getFile("ch_upfile");
		
		if(f!=null&&f.length()>0) {
		//클라이언트가 데이터를 넘김
		//이전파일삭제
		File deleteFile=new File(path+mr.getParameter("ch_orifile"));
		deleteFile.delete();
		ch.setFilepath(mr.getFilesystemName("ch_upfile"));
		}else {
		//업로드파일이 없음
		ch.setFilepath(mr.getParameter("ch_orifile"));
		}
		
		int result = new CH_ChallengersService().updateChallengers(ch);
		
		String msg="";
		String loc="";
		if(result>0) {
			msg="관리자님! 챌린져스 수정이 정상적으로 완료되었습니다! :)";
			loc="/challengers/introduce.do";
		}else {
			msg="관리자님! 챌린져스 수정에 문제가 발생하였습니다 :(";
			loc="/challengers/ch_update.do";
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
