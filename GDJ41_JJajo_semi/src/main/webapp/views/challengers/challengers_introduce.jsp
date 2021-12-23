<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ page import="java.util.*" %>
<%@ page import="com.im.challengers.model.vo.CH_Advertisement" %>
<%@ page import="com.im.challengers.model.vo.CH_Challengers" %>
<%@ page import="com.im.challengers.model.vo.CH_Mychallenge" %>

<%

	List<CH_Advertisement> adList = (List)request.getAttribute("advertisementList");
	List<CH_Challengers> chList = (List)request.getAttribute("challengersList");
	List<CH_Mychallenge> myList = (List)request.getAttribute("mychallengeList");
	
	
%>



<%@ include file="/views/common/header.jsp"%>       
    
    
   <section>
   	<!-- 타이틀 제목 -->
      <div class="container"  style="text-align: center; font-size: 50px; color: #01DFD7;" >
        Challenge List
	  </div>
      <br>
     
     <!-- 로그인된 유저가 관리자일 경우에만 광고등록 버튼이 생성된다 -->
     <%if(loginMember!=null && loginMember.getMemberId().equals("admin")){ %>
     <div class="container" style="text-align: center;">
     <button type="button" class="btn btn-outline-dark"  data-bs-toggle="modal" data-bs-target="#advertisement_enroll">광고등록</button>
     </div>
     <br>
     <%}%>
     
     <!-- 광고 제공 안내문구 부분 -->
     <div class="container">
      <div class="row">
        <div class="col-1">
        <!-- 좌측으로부터 col-1만큼의 공간확보 -->
        </div>
        <div class="col" style="color:grey">
          <span class="image blinking" >  ※ 해당 페이지는 광고를 제공하고 있습니다 ※</span>
        </div>
      </div>
   </div>
 
   	<!-- 광고 표시되는 부분 -->
      <div class="container">
        <div class="row">
	        <div class="col-1" >
	           <!-- 좌측으로부터 col-1만큼의 공간확보 -->
	        </div>
	        <div class="col">
		        <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel" style="border: 10px solid #A4A4A4;">
		          <div class="carousel-inner">
					<%if(adList!=null && !(adList.isEmpty())){
						int count=1;
					for(CH_Advertisement ad : adList){
					/*첫번째 캐러셀에만 active속성이 적용되야함으로 다음과 같이 로직을 작성하였음*/
					if(count==1){  %>
					 <div class="carousel-item active">
					<%count++;}else{ %>
		           	 <div class="carousel-item">
		          	<%} %>
		              <a href="<%=ad.getAddress() %>" target="_blank"><img src="<%=request.getContextPath()%>/images/challengers/advertisement/<%=ad.getFilepath()%>" class="d-block w-100" id="challengeListAdvertisement" alt="..."></a>
		              <div class="carousel-caption d-none d-md-block">
		                <h5><%=ad.getContent() %></h5>
		                 <%if(loginMember!=null && loginMember.getMemberId().equals("admin")){ %>
			                <button type="button"  id="adUpdate" class="btn btn-success"  data-bs-toggle="modal" data-bs-target="#advertisement_update"
			                data-address="<%=ad.getAddress()%>" data-img="<%=ad.getFilepath()%>" data-content="<%=ad.getContent() %>"  data-no="<%=ad.getAdvertisementNo()%>">수정하기</button>
			                <button type="button"   id="adDelete"  class="btn btn-danger"  data-bs-toggle="modal" data-bs-target="#advertisement_delete"  data-no="<%=ad.getAdvertisementNo()%>">삭제하기</button>
		                <%} %>
		              </div>
		            </div>
		            <%} 
		        	} %>      
		          </div>
		          	<!-- 광고 좌/우로 움직이는 버튼 -->
					  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
			            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			            <span class="visually-hidden">Previous</span>
			         </button>
			         <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
			            <span class="carousel-control-next-icon" aria-hidden="true"></span>
			            <span class="visually-hidden">Next</span>
			         </button>    
		          
		        </div>
	      	</div>
		<!--</div> if/else로 인해 div태그가 2개라서 </div>가 부족하다고 뜨는데 로직상 이거는 없어야 하는거니까 없애도 정상작동-->
	      <div class="col-1">
	           <!-- 좌측으로부터 col-1만큼의 공간확보 -->
	      </div>
    	</div>
      </div>
      <br>
      <br>

	<!-- 로그인된 유저가 관리자일 경우에만 챌린지 리스트등록 버튼이 생성된다 -->
	 <%if(loginMember!=null && loginMember.getMemberId().equals("admin")){ %>
     <div class="container" style="text-align: center;">
     <button type="button" class="btn btn-outline-dark" data-bs-toggle="modal" data-bs-target="#challengersList_enroll" >List 등록</button>
     </div>
     <br>
     <%} %>
	
	<!-- 챌린지 리스트 출력되는 부분 -->
      <div class="container">
        <div class="row" style="padding-left: 100px;">

          <%if(chList!=null && !(chList.isEmpty())){
        	  /* 각 챌린지마다 서로다른 form태그의 id값을 갖게 해줄 변수 
        	  ID값 뒤에 붙혀줌으로써 for문을 돌면서 서로 다른 id값을 갖게해준다*/
        	  	int count=0; 
          			for(CH_Challengers ch : chList){%>
          <div class="col-4">
            <div class="card" style="width: 18rem; border: 5px solid #81F7BE" >
              <img src="<%=request.getContextPath()%>/images/challengers/<%=ch.getFilepath()%>" class="card-img-top" alt="..." style="height:190px;">
              <div class="card-body">
                <h5 class="card-title" style="text-align: center; color: #BCA9F5"><%=ch.getTitle() %></h5>
                <p class="card-text" style="height: 110px;"><%=ch.getContent() %></p>
       		    <%if(loginMember!=null && loginMember.getMemberId().equals("admin")){ %>
       		    <br>
       		    <br>
			      <div style="text-align:center">
			      <button type="button"  id="chUpdate" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#challengersList_update" 
			      data-title="<%=ch.getTitle() %>" data-img="<%=ch.getFilepath()%>"  data-content="<%=ch.getContent() %>" data-no="<%=ch.getChallengersNo()%>">수정하기</button>
			      <button type="button"  id="chDelete" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#challengersList_delete"  data-no="<%=ch.getChallengersNo()%>">삭제하기</button>
		        </div>
		        <br>
		        <%} %>
		        <!-- 챌린지 마다 서로 다른 form태그의 아이디를 가져야 한다 => 모달창의 확인버튼으로 submit을 발동시키는데 form태그의 아이디값이 같다면 어떤 챌린지의 form태그를 실행시킬 지 알 수 없기 때문이다 -->
		        <!-- form태그가 발동되면 get방식으로 로그인한 회원의 memberNo와 해당 challengersNo를 넘긴다 -->
		        <form id="ch_startFrm<%=count%>" action="<%=request.getContextPath()%>/challengers/ch_start.do?memberNo=<%=loginMember.getMemberNo()%>&challengersNo=<%=ch.getChallengersNo()%>"
		        method="post">
		        <!-- 해당 멤버가 진행중인 chNo를 담은 리스트를 불러와 각 챌린져스 chNo를 비교하여 같으면 진행중인 상태를 표시하는 버튼을 생성한다 -->
		        <%if(myList!=null){
		        			boolean flag1=true;
		        		
		        			for(CH_Mychallenge my : myList){
		        					if(my.getChallengersNo()==ch.getChallengersNo()){	%>
		        					<div style="text-align: center;"><a class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#mychallenge-doing-alert" >진행중</a></div>
		        			<% flag1=false;}
		        			}		
		        			if(flag1==true){%>
		        				<div style="text-align: center;"><a class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#mychallenge-do-check<%=count%>" >도전하기</a></div>
		        			<%}
                				 
                			}%>
                <!------------------------ 도전하기 여부 확인 모달 ------------------------->	
			     <div class="modal fade" id="mychallenge-do-check<%=count%>" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
				  <div class="modal-dialog modal-dialog-centered">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="staticBackdropLabel" >챌린지 도전 여부 확인</h5>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body">
				        해당 챌린지를 도전 하시겠습니까?
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">아니오</button>
				        <!-- 모달 확인 버튼을 통해 submit을 발동시키기 위해 form의 id값을 가져와 submit을 발동하였으나 생성된 챌린지 마다 모두 동일한 아이디의 form태그가 생성되게 된다면 문제가 발생한다 -->
				        <!-- 따라서, 다음과 같이 form태그 내부에 같이 모달 코드가 존재하면서 기존 아이디값에 변화되는 값을 붙혀주면서 챌린지 마다 각기 다른 form아이디값을 가지게하며 이를 모달도 같으 공유해야한다.(모달이 해당 챌린지의 form을 submit하기 위해)  -->
				        <button type="button" class="btn btn-primary"  data-bs-dismiss="modal" onclick="document.getElementById('ch_startFrm<%=count%>').submit();">&ensp;네&ensp;</button>
				      </div>
				    </div>
				  </div>
				</div>  
                	
                </form>  
              </div>
            </div>
          </div>
		<!-- for문 마지막에 count를 증가시켜준다!! -->
          <%count++; } 
          }%>
 
        </div>
      </div>
      
      <br>
     
       <%=request.getAttribute("pageBar") %>
 
      <br>


      <div class="container" style="text-align: center;">
        <button type="button" class="btn btn-outline-info" data-bs-toggle="modal" data-bs-target="#mychallenge-go-check" style="font-size:20px;">My Challenge</button>
      </div>
      <br>

     

    </section>
    
<!------------------------------------------------------------------------------------------------------------------------------------------>
																							<!--=========== modal / script ===========-->
<!------------------------------------------------------------------------------------------------------------------------------------------>

	<!-- 광고 등록 모달 -->
	<div class="modal fade" id="advertisement_enroll" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="staticBackdropLabel" >광고 등록</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	
		<div style="text-align: center; font-size: 17px; color: lightsalmon;">광고 등록 페이지입니다. 작성 후, 등록완료 부탁드립니다.</div>
	      <br>
	      <br>
	    <form action='<%=request.getContextPath()%>/challengers/advertisement_submit.do'
			method="post" enctype="multipart/form-data"  id="adFrm">
		    <div>광고 주소</div>
		     <input type="text" class="form-control" id="formGroupExampleInput"  name="ad_url" placeholder="상품페이지 URL을 입력하세요">
		    <br>
		    <div>광고 이미지</div>
		    <input class="form-control"  name="ad_upfile" type="file" id="formFile">
		    <br>
		    <div>광고 안내글</div>
		     <textarea class="form-control" id="adv_content"  name="ad_content" rows="5" style="resize:none;" 
		              	placeholder="※이미지 클릭시, 해당 상품 사이트로 이동합니다※" ></textarea>
	              	
	 	</form>
	
	      </div>
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-primary"  data-bs-dismiss="modal" onclick="AdValidation();">&ensp;등록&ensp;</button>
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">아니오</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	
	<!-- 광고 수정 모달 -->
	<div class="modal fade" id="advertisement_update" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="staticBackdropLabel" >광고 수정</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	
		<div style="text-align: center; font-size: 17px; color: lightsalmon;">광고 수정 페이지입니다. 수정 후, 수정완료 부탁드립니다.</div>
	      <br>
	      <br>
	    <form action='<%=request.getContextPath()%>/challengers/advertisement_update_end.do'
			method="post" enctype="multipart/form-data"  id="adEnrollFrm">
		    <div>광고 주소</div>
		     <input type="text" class="form-control" id="up_ad_url"  name="ad_url" placeholder="상품페이지 URL을 입력하세요" value="">
		    <br>
		    <div>광고 이미지</div>
		    <input class="form-control"  name="ad_upfile" type="file" id="ad_upfile">
		    <input class="form-control form-control-sm" type="text" id="adImg" placeholder="이전에 등록된 이미지가 없습니다!" aria-label=".form-control-sm example" value="" readonly>
		     <input type="hidden"  id="up_ad_orifile" name="ad_orifile" value="">
		    <br>
		    <div>광고 안내글</div>
		     <textarea class="form-control"  id="adv1_content"  name="ad_content" rows="5" style="resize:none;" 
		              	placeholder="※이미지 클릭시, 해당 상품 사이트로 이동합니다※" ></textarea>
		     <input type="hidden" id="up_ad_advertisementNo" name="ad_advertisementNo" value="">       
	 	</form>
	
	      </div>
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-primary"  data-bs-dismiss="modal" onclick="AdEnrollValidation();">&ensp;수정&ensp;</button>
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">아니오</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	
	<!-- 광고 삭제 모달 -->
	<div class="modal fade" id="advertisement_delete" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="staticBackdropLabel" >광고 삭제</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	
		<div style="text-align: center; font-size: 17px; color: lightsalmon;">광고 삭제 페이지입니다</div>
	      <br>
	    <form action='<%=request.getContextPath()%>/challengers/advertisement_delete.do'
			method="post"  id="chDeleteFrm">
			<div style="text-align:center;">해당 광고를 삭제하시겠습니까?</div>
			<br>
			<input type="hidden"  id="de_av_no" name="advertisementNo" value="">     
	 	</form>
	
	      </div>
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-primary"  data-bs-dismiss="modal" onclick="document.getElementById('chDeleteFrm').submit();">&ensp;삭제&ensp;</button>
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">아니오</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	
	<!-- 챌린져스 리스트 등록 모달 -->
	<div class="modal fade" id="challengersList_enroll" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="staticBackdropLabel" >챌린져스 등록</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	
		<div style="text-align: center; font-size: 15px; color: lightsalmon;">챌린져스 등록 페이지입니다. 작성 후, 등록완료 부탁드립니다.</div>
	      <br>
	      <br>
	    <form action='<%=request.getContextPath()%>/challengers/ch_submit.do'
			method="post" enctype="multipart/form-data"  id="chFrm">
		    <div>제목(TITLE)</div>
		    <input type="text" class="form-control" id="ch_title_"  name="ch_title" placeholder="챌린져스 제목을 입력하세요(10글자 미만 입력(공백포함))">
		    <br>
		    <div>챌린져스 이미지</div>
		   <input class="form-control"  name="ch_upfile" type="file" id="formFile">
		    <br>
		    <div>챌린져스 소개글</div>
	         <textarea class="form-control" id="ch_content_"  name="ch_content" rows="5" style="resize:none;" 
              	placeholder="** 해당 챌린지를 소개하는 글을 작성해주세요! (82글자 미만 입력(공백포함))**" ></textarea>
	              	
	 	</form>
	
	      </div>
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-primary"  data-bs-dismiss="modal" onclick="return ChValidation();">&ensp;등록&ensp;</button>
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">아니오</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	
	<!-- 챌린져스 리스트 수정 모달 -->
	<div class="modal fade" id="challengersList_update" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="staticBackdropLabel" >챌린져스 수정</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	
		<div style="text-align: center; font-size: 15px; color: lightsalmon;">챌린져스 수정 페이지입니다. 수정 후, 수정완료 부탁드립니다.</div>
	      <br>
	      <br>
	    <form action='<%=request.getContextPath()%>/challengers/ch_update_end.do'
			method="post" enctype="multipart/form-data"  id="up_chFrm">
		    <div>제목(TITLE)</div>
		    <input type="text" class="form-control" id="up_ch_title_"  name="ch_title" placeholder="챌린져스 제목을 입력하세요(10글자 미만 입력(공백포함))" value="">
		    <br>
		    <div>챌린져스 이미지</div>
		   <input class="form-control"  name="ch_upfile" type="file" id="up_formFile">
		    <input class="form-control form-control-sm" type="text" id="chImg" placeholder="이전에 등록된 이미지가 없습니다!" aria-label=".form-control-sm example" value="" readonly>
		    <input type="hidden"  id="up_ch_orifile" name="ch_orifile" value="">
		    <br>
		    <div>챌린져스 소개글</div>
	         <textarea class="form-control" id="up_ch_content_"  name="ch_content" rows="5" style="resize:none;" 
              	placeholder="** 해당 챌린지를 소개하는 글을 작성해주세요! (82글자 미만 입력(공백포함))**" ></textarea>
	         <input type="hidden"  id="up_ch_no" name="challengersNo" value="">    	
	 	</form>
	
	      </div>
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-primary"  data-bs-dismiss="modal" onclick="return ChUpValidation();">&ensp;수정&ensp;</button>
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">아니오</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	
	<!-- 챌린져스 리스트 삭제 모달 -->
	<div class="modal fade" id="challengersList_delete" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="staticBackdropLabel" >챌린져스 삭제</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	
		<div style="text-align: center; font-size: 15px; color: lightsalmon;">챌린져스 삭제 페이지입니다.</div>
	      <br>
	      <br>
	    <form action='<%=request.getContextPath()%>/challengers/ch_delete.do'
			method="post"  id="de_chFrm">
			<div style="text-align:center;">해당 챌린지를 삭제하시겠습니까?</div>
	        <input type="hidden"  id="de_ch_no" name="challengersNo" value="">
	 	</form>
	
	      </div>
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-primary"  data-bs-dismiss="modal" onclick="document.getElementById('de_chFrm').submit();">&ensp;삭제&ensp;</button>
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">아니오</button>
	      </div>
	    </div>
	  </div>
	</div>
	


	<!-- 마이 챌린지 페이지 이동 여부 체크 모달 -->
	<div class="modal fade" id="mychallenge-go-check" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="staticBackdropLabel" >페이지 이동 확인</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        MyChallenge로 이동하시겠습니까?
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">아니오</button>
	        <button type="button" class="btn btn-primary"  data-bs-dismiss="modal" onclick="location.assign('<%=request.getContextPath()%>/challengers/mychallenge.do')">&ensp;네&ensp;</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- 진행중인 챌린지 재신청 경고 모달 -->
	<div class="modal fade" id="mychallenge-doing-alert" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="staticBackdropLabel" >챌린지 진행중</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        해당 챌린지는 현재 진행중입니다. 다른 챌린지를 선택해주세요!
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">&ensp;네&ensp;</button>
	      </div>
	    </div>
	  </div>
	</div>  
	
	
  <script>
  
  const AdValidation= ()=>{
	  
	  const content = $("#adv_content").val().trim();
	  if(content.length==0){
		  $("#adv_content").val('※이미지 클릭시, 해당 상품 사이트로 이동합니다※');
	  }
	  $("#adFrm").submit();
	  
  }
  
  const AdEnrollValidation= ()=>{
	  
	  const content = $("#adv1_content").val().trim();
	  if(content.length==0){
		  $("#adv1_content").val('※이미지 클릭시, 해당 상품 사이트로 이동합니다※');
	  }
	  $("#adEnrollFrm").submit();
	  
  }
  
  
  $(document).on("click", "#adUpdate", function () { 
  	let address = $(this).data('address');
  	let img=$(this).data('img');
  	let content=$(this).data('content');
  	let no=$(this).data('no');

  	$("#up_ad_url").val(address); 
  	$("#adImg").val(img); 
  	$("#up_ad_orifile").val(img); 
  	$("#adv1_content").val(content); 
  	$("#up_ad_advertisementNo").val(no); 
  	   	 	
	});
  
  $(document).on("click", "#adDelete", function () { 
  	let deno=$(this).data('no');
  	$("#de_av_no").val(deno); 
  	
	});
  
  
  
  $(document).on("click", "#chUpdate", function () { 
	  	let title = $(this).data('title');
	  	let img=$(this).data('img');
	  	let content=$(this).data('content');
	  	let no=$(this).data('no');
	  	
	  	$("#up_ch_title_").val(title); 
	  	$("#chImg").val(img); 
	  	$("#up_ch_orifile_").val(img); 
	  	$("#up_ch_content_").val(content); 
	  	$("#up_ch_no").val(no); 
	  	   	 	
		});
	  
	  $(document).on("click", "#chDelete", function () { 
	  	let no=$(this).data('no');
	  	$("#de_ch_no").val(no); 
	  	
		});
  
  
  const ChValidation= ()=>{
	  
	  const content = $("#ch_content_").val();
	  if(content.length>82){
		  alert("내용은 82글자 이상 입력 불가합니다.. :( ");
			$("#ch_content_").focus();
			return false;
	  }
	  
	  const title = $("#ch_title_").val();
	  if(title.length>10){
		  alert("제목은 10글자 이상 입력 불가합니다.. :( ");
		  $("ch_title_").focus();
		  return false;
	  }
	  
	  $("#chFrm").submit();
	  
  }
  
  
  const ChUpValidation= ()=>{
	  
	  const content = $("#up_ch_content_").val();
	  if(content.length>82){
		  alert("내용은 82글자 이상 입력 불가합니다.. :( ");
			$("#up_ch_content_").focus();
			return false;
	  }
	  
	  const title = $("#up_ch_title_").val();
	  if(title.length>10){
		  alert("제목은 10글자 이상 입력 불가합니다.. :( ");
		  $("up_ch_title_").focus();
		  return false;
	  }
	  
	  $("#up_chFrm").submit();
	  
  }
  
  
  
  
  </script> 
	
	
	
	
    
<%@ include file="/views/common/footer.jsp"%>    