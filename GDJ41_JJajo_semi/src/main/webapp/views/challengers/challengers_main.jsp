<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp"%>


<section>

     <div class="container" >
      
	      <div class="loading"  style="text-align: center;">
			  <span>C</span>
			  <span>h</span>
			  <span>a</span>
			  <span>l</span>
			  <span>l</span>
			  <span>e</span>
			  <span>n</span>
			  <span>g</span>
			  <span>e</span>
			  <span>r</span>
			  <span>s</span>
		 </div>
      
      <div>
        <br>
       <h3 style="text-align: center; color:#DA81F5">저희 GOODEE HEALTH 운영진은 아름다운 당신의 도전을 응원합니다!</h3>
       <br>
       <div>
         <div class="challengers_main">
           <img
             src="https://lh3.googleusercontent.com/ogw/ADea4I4I1OSLjtyN06upPEzZxkSoQdD2K06pCxUsbT72_Q=s83-c-mo"
             alt="People"
             class="challengers_main_avatar"
           />
         
           <div class="challengers_main_speech-bubble">
             <p>
               여러분은 살면서 얼마나 많은 도전을 해오셨나요? 혹시, 도전은 수없이 해왔지만 본인이 만족할만한 결과를 얻으신 적이 있으신가요? 도전이라는 것은 처음이 어렵고 하다보면 아무렇지 않게 할 수 있는 것입니다!
               저희 GOODEE HEALTH는 여러분들에게 다양한 도전 목표를 제시함으로써 저희 커뮤니티 유저분들께서 도전 달성을 통한 성취감을 얻으실 수 있도록 최선을 다해 해당 서비스를 제공할 계획입니다. 많은 이용 부탁드리며 성공을 응원합니다!
             </p>
             <p class="name"><span style="color:#fe918d;">양인모</span> / GOODEE HEALTH 운영진 대표</p>
           </div>
         </div>
         <br>
         <br>
         <div class="challengers_main">
           <div class="challengers_main_speech-bubble">
             <p>
              저는 고등학교때 처음 허리 통증으로 쓰러졌을때부터 쭉 척추측만증을 가지고 있었습니다. 이런 허리를 가지고 현재의 몸을 가지고 있죠! 본인의 의지가 약한 사람들이 온갖 핑계를 대며 무엇인가에 도전하지 않고 편하게 쉴때
              저는 이 악물고 꾸준한 도전과 노력의 결실로 현재의 삶을 살 수 있게되었죠. 지금이라도 이 글을 보고 있는 당신이라면 본인은 못할거라고 생각하던 그 도전..! 지금이라도 시작해보세요. 본인의 목표달성을 통해 느낄 수 있는 성취감..! 
              한번 도전해보시죠! 하하!!!!
             </p>
             <p class="name"><span style="color:#fe918d;">김종국</span> / 연예인,  헬스 유튜버</p>
           </div>
           <img
           src="https://img4.yna.co.kr/photo/cms/2021/05/20/99/PCM20210520000099505_P4.jpg"
           alt="People"
           class="challengers_main_avatar"
         />
         </div>
       </div>
      </div>
    </div>
    
    <br>
    <br>
    <div class="container">
	  <div class="row">
	    <div class="col"></div>
	    <div class="col" style="text-align:center; ">
	    	<button type="button" class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#challenge-do-check" style="font-size:20px;">Start Challenge</button>
	    </div>
	    
	    <div class="col" style="text-align:center;">
	    	<button type="button" class="btn btn-outline-info" data-bs-toggle="modal" data-bs-target="#mychallenge-go-check" style="font-size:20px;">My Challenge</button>
	    </div>
	    <div class="col"></div>
	  </div>
  </div>
  <br>
  <br>

</section>


<!---------------------------------------------------------- Modal ----------------------------------------------------------------------------->

<div class="modal fade" id="challenge-do-check" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel" >도전여부 확인</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        Challenge List페이지로 이동하시겠습니까?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">아니오</button>
        <button type="button" class="btn btn-primary" onclick="location.href='<%=request.getContextPath() %>/challengers/introduce.do'">&ensp;네&ensp;</button>
      </div>
    </div>
  </div>
</div>


<div class="modal fade" id="mychallenge-go-check" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel" >이동여부 확인</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        MyChallenge로 이동하시겠습니까?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">아니오</button>
        <button type="button" class="btn btn-primary" onclick="location.href='<%=request.getContextPath() %>/challengers/mychallenge.do'">&ensp;네&ensp;</button>
      </div>
    </div>
  </div>
</div>


<%@ include file="/views/common/footer.jsp"%>