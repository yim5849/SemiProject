package com.im.challengers.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.im.challengers.model.service.CH_MychallengeNoticeService;
import com.im.challengers.model.service.CH_MychallengeService;
import com.im.challengers.model.vo.CH_Challengers;
import com.im.challengers.model.vo.CH_Mychallenge;
import com.im.challengers.model.vo.CH_MychallengeImage;
import com.im.challengers.model.vo.CH_MychallengeNotice;
import com.jj.member.model.vo.Member;

/**
 * Servlet implementation class CH_MychallengeServlet
 */
@WebServlet("/challengers/mychallenge.do")
public class CH_MychallengeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CH_MychallengeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		/*===================================== 1. 사용자가 로그인 한 상태인지  체크 ============================================*/
		
		HttpSession session = request.getSession(false);
		
		Member m=null;
		
		if(session!=null) {
			if(session.getAttribute("loginMember")!=null) {
				m=(Member)session.getAttribute("loginMember");
			}
		}else if(session==null || m==null) {
			
			String msg="로그인 후, 이용해주세요! :(";
			String loc="/";
			
			request.setAttribute("msg",msg);
			request.setAttribute("loc", loc);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return; // 로그인한 상태가 아니기 때문에 로직 종료
		}
		
		/*============================================ IF (사용자가 로그인한 상태라면) ============================================*/
		/*================================= 2. 사용자가 진행했던 or 진행중인 챌린지 뽑아오기 (DropList) =================================*/
		
		int memberNo = m.getMemberNo(); // 로그인 한 유저의 유저번호를 추출
		
		// 로그인한 유저의 넘버를 사용하여 해당 유저가 진행중인 or 진행했던 챌린지들을 추출
		List<CH_Challengers> dropList = new CH_MychallengeService().searchChallengeListDrop(memberNo);
		
		// 드롭리스트가 없다는 것은 챌린지를 진행했던 적이 없다는 것 => 챌린지 신청을 하고 이용할 수 있도록 안내한다
		if(dropList==null || dropList.isEmpty()) {
			
			String msg="진행중인 챌린지가 없습니다. 챌린지 신청 후, 이용해주세요! :(";
			String loc="/challengers/introduce.do";
			
			request.setAttribute("msg",msg);
			request.setAttribute("loc", loc);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;  // dropList 가 없기에 로직 종료
		}
		
		
		/*============= 사용자가 진행중인 챌린지 중, 사용자가 선택한(DropList) 마이챌린지에 표시할 챌린지 데이터 (기록 및 갤러리) 가져오기 ===============*/
		
		/*=================== (사용자가 드롭리스트에서 챌린지를 선택하면 화면에 해당 챌린지의 기록들을 가져오는 것) / <페이징 처리> ====================*/
	
		int challengersNo;
		if(request.getParameter("challengersNo")!=null) {		// 챌린져스 번호 NULL값 처리!!
			challengersNo= Integer.parseInt(request.getParameter("challengersNo"));

			int cPage;
			
			try {
				cPage=Integer.parseInt(request.getParameter("cPage"));
			}catch(NumberFormatException e) {
				cPage=1;
			}
			int numPerPage=1;//페이지당 출력 데이터수
			
			// 해당 챌린지의 데이터들 가져오기
			List<CH_Mychallenge> chList = new CH_MychallengeService().searchAllChallenge(cPage,numPerPage,memberNo, challengersNo);
			System.out.println("전달받은 chList : "+chList);
			/* 페이지바 작성하기 */
			int totalData = new CH_MychallengeService().searchAllChallengeCount(memberNo,challengersNo);
			
			// 전체 페이지 수
			int totalPage=(int)Math.ceil((double)totalData/numPerPage); // 소수점이 있다면 올림처리!!
			
			// 페이지에 출력할 페이지 수의 갯수
			int pageBarSize=5;
			
			// 페이지 숫자의 시작값을 설정
			int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
			
			// 페이지 숫자의 끝 값을 설정
			int pageEnd= pageNo+pageBarSize-1;
			
			String pageBar="<nav aria-label=\"Page navigation example\"><ul class=\"pagination justify-content-center\"><li class=\"page-item\">";
			
			// 이전 버튼 만들기
			if(pageNo==1) {
				pageBar+="<a class=\"page-link\" aria-label=\"Previous\"><span aria-hidden=\"true\">&laquo;</span></a></li>";
			}else {
				pageBar+="<a class=\"page-link\" href=\""+request.getContextPath()+"/challengers/mychallenge.do?challengersNo="+challengersNo+"&cPage="+(pageNo-1)
									+"\" aria-label=\"Previous\"><span aria-hidden=\"true\">&laquo;</span></a></li>";
			}
			
			
			while(!(pageNo>pageEnd || pageNo>totalPage)) {
				if(cPage==pageNo) {
					pageBar+="<li class=\"page-item\"><a class=\"page-link\">"+pageNo+"</a></li>";
				}else {
					pageBar+="<li class=\"page-item\"><a class=\"page-link\" href=\""+request.getContextPath()+"/challengers/mychallenge.do?challengersNo="+challengersNo+"&cPage="+pageNo+"\"> "+pageNo+"</a></li>";
				}
				pageNo++;
			}
			
			pageBar+="<li class=\"page-item\">";
			
			if(pageNo>totalPage) {
				pageBar+="<a class=\"page-link\" aria-label=\"Next\"><span aria-hidden=\"true\">&raquo;</span></a></li></ul></nav>";
			}else {
				pageBar+="<a class=\"page-link\" href=\""+request.getContextPath()+"/challengers/mychallenge.do?challengersNo="+challengersNo+"&cPage="+pageNo+"\" aria-label=\"Next\"><span aria-hidden=\"true\">&raquo;</span></a></li></ul></nav>";
			}
			

			// 페이지 바 저장
			request.setAttribute("pageBar", pageBar);
			
			// 해당 챌린지의 데이터를 저장
			request.setAttribute("mychallengeList", chList);
			
			// 화면전환 후, 드롭리스트에서 해당 챌린지를 Selected 상태로 고정시키기 위한 값을 저장
			int chNum=0;
			if(chList!=null && !(chList.isEmpty())) {
				chNum=chList.get(0).getChallengersNo();
			}
			request.setAttribute("chNum", chNum);
			
			
			/*==================================== 갤러리 가져오기  ==================================*/
			
//			List<CH_MychallengeImage> imList = new CH_MychallengeService().earchAllImage(memberNo,chNum);
			
			// 이미지 리스트를 저장
		//	request.setAttribute("mychallengeImageList", imList);
			
	
		} // if(챌린져스 번호 null값처리 끝부분)


		
		
		
		/* 마이챌린지 안내사항 불러오기 */
		List<CH_MychallengeNotice> noList = new CH_MychallengeNoticeService().searchAllNotice();
		
		// 유저의 챌린지 DropList 저장
		request.setAttribute("mychallengeDropList", dropList);
		
		// 마이챌린지 안내사항 저장
		request.setAttribute("mychallengeNoticeList", noList);
		
		// 마이챌린지 페이지로 넘긴다
		request.getRequestDispatcher("/views/challengers/challengers_mychallenge.jsp")
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
