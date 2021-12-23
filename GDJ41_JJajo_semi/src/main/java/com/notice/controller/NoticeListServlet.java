package com.notice.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.notice.model.service.NoticeService;
import com.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeListServlet
 */
@WebServlet("/notice/noticeList.do")
public class NoticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int curPage;
		
		try {
			curPage = Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			curPage=1;
		}
		
		int numPerPage = 5;
		
		List<Notice> noticeList = new NoticeService().searchNoticeByPaging(curPage, numPerPage);
		
		int totalDataCount = new NoticeService().searchNoticeAllCount();
		
		int totalPage= (int)Math.ceil(totalDataCount/(double)numPerPage);
		
		int pageBarSize=5;
		int pageStart=((curPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageStart+pageBarSize-1;
		
		String pageBar = "";
		
		if(pageStart==1) {
			pageBar="<span>[이전]</span>";
		}else {
			pageBar="<a href='"+request.getContextPath()+"/notice/noticeList.do?cPage="+(pageStart-1)+"'>[이전]</a>";
		}
		
		while(!(pageStart>pageEnd||pageStart>totalPage)) {
			if(curPage==pageStart) {
				pageBar+="<span>"+pageStart+"</sapn>";
			}else {
				pageBar+="<a href='"+request.getContextPath()+"/notice/noticeList.do?cPage="+pageStart+"'>"+pageStart+"</a>";
			}
			pageStart++;	
		}
		
		if(pageStart>totalPage) {
			pageBar+="<span>[다음]</span>";
		}else {
			pageBar+="<a href='"+request.getContextPath()+"/notice/noticeList.do?cPage="+pageStart+"'>[다음]</a>";
		}
		
		
		request.setAttribute("pageBar", pageBar);
		
		
		request.setAttribute("noticeList", noticeList);
		
		request.getRequestDispatcher("/views/notice/noticeListView.jsp").forward(request, response);
		
	
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
