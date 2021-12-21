package com.im.challengers.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.im.challengers.model.service.CH_AdvertisementService;
import com.im.challengers.model.vo.CH_Advertisement;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class CH_AdvertisementSubmitServlet
 */
@WebServlet("/challengers/advertisement_submit.do")
public class CH_AdvertisementSubmitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CH_AdvertisementSubmitServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/* 파일 업로드가 된 요청인지 아닌지를 판단한다 */
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "잘못된 요청입니다 관리자에게 문의하세요 XD");
			request.setAttribute("loc","/challengers/introduce.do");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}
		
		/* 파일을 저장할 위치의 정보를 가져온다 => 절대경로를 가져온다 */
		String path=getServletContext().getRealPath("/images/challengers/advertisement/");
		
		
		/* 저장할 파일의 크기를 설정한다 = (요청 정보를 받을때의 크기) */
		int maxSize = 1024*1024*10;
		
		
		/* 문자열에 대한 인코딩을 설정한다 */
		String encode="UTF-8";
		
		/* 셋팅 */
		MultipartRequest mr=new MultipartRequest(request,path,maxSize,
																							encode,new DefaultFileRenamePolicy());
		
		/* 등록할 데이터를 객체에 저장 */
		CH_Advertisement ad=CH_Advertisement.builder()
												.content(mr.getParameter("ad_content"))
												.address(mr.getParameter("ad_url"))
												.filepath(mr.getFilesystemName("ad_upfile"))
												.build();
		
		/* 등록!! */
		int result = new CH_AdvertisementService().insertAdvertisement(ad);
		
		
		String msg="";
		String loc="";
		if(result>0) {
			msg="관리자님! 광고등록이 정상적으로 완료되었습니다! :)";
			loc="/challengers/introduce.do";
		}else {
			msg="관리자님! 광고등록에 문제가 발생하였습니다 :(";
			loc="/challengers/advertisement_enroll.do";
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
