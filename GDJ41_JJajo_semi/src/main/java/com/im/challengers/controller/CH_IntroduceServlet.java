package com.im.challengers.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.im.challengers.model.service.CH_AdvertisementService;
import com.im.challengers.model.service.CH_ChallengersService;
import com.im.challengers.model.vo.CH_Advertisement;
import com.im.challengers.model.vo.CH_Challengers;

/**
 * Servlet implementation class CH_IntroduceServlet
 */
@WebServlet("/challengers/introduce.do")
public class CH_IntroduceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CH_IntroduceServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		/* 광고 */
		List<CH_Advertisement> adlist = new CH_AdvertisementService().searchAllAdvertisement();
		
		/* 챌린져스 */
		
		int cPage;
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		int numPerPage=3;//페이지당 출력 데이터수
		
		List<CH_Challengers> chlist=new CH_ChallengersService().searchAllChallengers(cPage,numPerPage);
	
		
		// 페이지 Bar 작성하기
		int totalData = new CH_ChallengersService().searchAllChallengersCount();
		
		// 전체 페이지 수
		int totalPage=(int)Math.ceil((double)totalData/numPerPage); // 소수점이 있다면 올림처리!!
		
		// 페이지에 출력할 페이지 수의 갯수
		int pageBarSize=5;
		
		// 페이지 숫자의 시작값을 설정
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		
		// 페이지 숫자의 끝 값을 설정
		int pageEnd= pageNo+pageBarSize-1;
		
		String pageBar="";
		
		// 이전 버튼 만들기
		if(pageNo==1) {
			pageBar="<span>[이전]</span>";
		}else {
			pageBar="<a href=' "+request.getContextPath()+"/challengers/introduce.do?cPage="+(pageNo-1)+" '>[이전]</a>";
		}
		
		
		while(!(pageNo>pageEnd || pageNo>totalPage)) {
			if(cPage==pageNo) {
				pageBar+="<span>"+pageNo+"</span>";
			}else {
				pageBar+="<a href=' "+request.getContextPath()+"/challengers/introduce.do?cPage="+pageNo+" '> "+pageNo+"</a>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<span>[다음]</span>";
		}else {
			pageBar+="<a href= ' "+request.getContextPath()+"/challengers/introduce.do?cPage="+pageNo+" '>[다음]</a> ";
		}

		
		
		
		request.setAttribute("advertisementList", adlist);
		
		request.setAttribute("challengersList", chlist);
		
		request.setAttribute("pageBar", pageBar);
		
		request.getRequestDispatcher("/views/challengers/challengers_introduce.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
