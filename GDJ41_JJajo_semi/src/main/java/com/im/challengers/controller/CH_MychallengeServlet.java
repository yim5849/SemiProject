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

		/* 사용자가 로그인 한 상태인지  체크 */
		
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
			return;
		}
		
		
		/* 사용자가 진행했던 or 진행중인 챌린지 뽑아오기 (DropList) */
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
			return;
		}
		
		/* 사용자가 진행중인 챌린지 중, 사용자가 선택한(DropList) 마이챌린지에 표시할 챌린지 데이터 가져오기 */
		int challengersNo;
		if(request.getParameter("challengersNo")!=null) {		
			challengersNo= Integer.parseInt(request.getParameter("challengersNo"));
			
			// 해당 챌린지의 데이터들 가져오기
			List<CH_Mychallenge> chList = new CH_MychallengeService().searchChallenge(memberNo, challengersNo);
			
			// 해당 챌린지의 데이터를 저장
			request.setAttribute("mychallengeList", chList);
			
			
			int chNum=0;
			if(chList!=null && !(chList.isEmpty())) {
				chNum=chList.get(0).getChallengersNo();
			}
			request.setAttribute("chNum", chNum);
			
		}

		//System.out.println("이거 불러올 수 있어? : "+request.getParameter("challengersNo"));
		
		
		
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
