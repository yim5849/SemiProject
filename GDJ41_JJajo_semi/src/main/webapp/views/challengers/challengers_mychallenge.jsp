<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %>
<%@ page import="com.im.challengers.model.vo.CH_Challengers" %>
<%@ page import="com.im.challengers.model.vo.CH_MychallengeNotice" %>

<%

	List<CH_Challengers> dropList = (List)request.getAttribute("mychallengeDropList");
	List<CH_MychallengeNotice> noList = (List)request.getAttribute("mychallengeNoticeList");
	
%>


<%@ include file="/views/common/header.jsp"%>

<style>

  #my_ch_title{
        text-align: center;
        font-size: 50px;
        color: #01DFD7;
      }

      #my_ch_galary{
        text-align: center;
        font-size: 50px;
        color:coral;
      }

      #my_ch_introduce{
        text-align: center;
        font-size: 20px;
      }

      #guide_image, #success_rate_image, #challenge_date_image,
      #back_arrow_image, #forward_arrow_image{
        height: 39px;
        width: 39px;
      }

      #guide_title{
        text-align: center;
        padding-right: 0;
        color:slategray; 
      }

      #guide_click_button{
        padding-left: 0; 
        padding-top: 7px;
      }

      #list_drop{
        background-color:whitesmoke; 
        text-align: center;
        color:#848484;
      }

      .my-photo{
        height: 400px;
        width: 200px;
      }

</style>


    <section>

       <!-------------------------------- 마이챌린지 타이틀----------------------------------------->
      <div class="container" id="my_ch_title" >
       My Challenge
		 </div>
     <br>

      <!-------------------------------- 안내사항 ----------------------------------------->
      <div class="container">
        <div class="row">
          <div class="col-2" id="guide_title">
            <img src="<%=request.getContextPath()%>/images/challengers/mychallenge/user-guide.png" id="guide_image"> Challenge 안내사항
          </div>
          <div class="col-1" id="guide_click_button">
              <span class="badge bg-dark text-white" data-bs-toggle="modal" data-bs-target="#guide_text_modal">CLICK !</span>
          </div>
          <div class="col-7">
          
          <!-------------------------------- 리스트 드롭박스 ----------------------------------------->
          </div>
          <div class="col">
            <form>
              <select class="form-select" id="list_drop" aria-label="Default select example">
                <%if(dropList!=null && !(dropList.isEmpty())){
                		boolean flag=true;
                		for(CH_Challengers ch : dropList){%>
                	<option value="<%=ch.getChallengersNo()%>" <%=flag==true?"selected":""%>><%=ch.getTitle()%></option>
                <%flag=false;}
                }%>
              </select>
            </form>
          </div>
        </div>
      </div>
  
      <br>

      <!-------------------------------- 리스트 보기 ----------------------------------------->
      <div class="container">
        <div class="row">
          <div class="col-2" style="padding-left: 20px;">
            <button type="button" class="btn btn-warning btn-sm" onclick="location.assign('<%=request.getContextPath()%>/challengers/introduce.do')"><span style="color: white;">◁ 리스트 보기</span></button>
          </div>
          <div class="col-5">
    
          </div>
          <div class="col-5">

          </div>
        </div>
      </div>

      <br>
      <br>
      <br>

      <div class="container" style="text-align: center;">
        <div class="row">
          <div class="col-4">
          
          </div>
          <div class="col">
            <img src="<%=request.getContextPath()%>/images/challengers/mychallenge/back-arrow.png" id="back_arrow_image">
          </div>
          <div class="col" style="padding-top: 2px; font-size: 25px;">
            O 회차
          </div>
          <div class="col">
            <img src="<%=request.getContextPath()%>/images/challengers/mychallenge/forward-arrow.png" id="forward_arrow_image">
          </div>
          <div class="col-4">
          
          </div>
        </div>
      </div>

      <br>
      <br>

      <div class="container">
        <div class="row">
          <div class="col">
          
            <table class="table table-bordered border-info align-middle" style="text-align: center;">
              <thead>
                <tr>
                  <th scope="col">#</th>
                  <th scope="col">1일차</th>
                  <th scope="col">2일차</th>
                  <th scope="col">3일차</th>
                  <th scope="col">4일차</th>
                  <th scope="col">5일차</th>
                  <th scope="col">6일차</th>
                  <th scope="col">7일차</th>
                  <th scope="col">TOTAL</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <th scope="row"><br><br>1주차<br><br><br></th>
                  <td>@mdo</td>
                  <td>@mdo</td>
                  <td>@mdo</td>
                  <td>@mdo</td>
                  <td>@mdo</td>
                  <td>@mdo</td>
                  <td>@mdo</td>
                  <td>값/7</td>
                </tr>
                <tr>
                  <th scope="row"><br><br>2주차<br><br><br></th>
                  <td>@mdo</td>
                  <td>@mdo</td>
                  <td>@mdo</td>
                  <td>@mdo</td>
                  <td>@mdo</td>
                  <td>@mdo</td>
                  <td>@mdo</td>
                  <td>@mdo</td>
                </tr>
                <tr>
                  <th scope="row"><br><br>3주차<br><br><br></th>
                  <td>@mdo</td>
                  <td>@mdo</td>
                  <td>@mdo</td>
                  <td>@mdo</td>
                  <td>@mdo</td>
                  <td>@mdo</td>
                  <td>@mdo</td>
                  <td>@mdo</td>
                </tr>
                <tr>
                  <th scope="row"><br><br>4주차<br><br><br></th>
                  <td>@mdo</td>
                  <td>@mdo</td>
                  <td>@mdo</td>
                  <td>@mdo</td>
                  <td>@mdo</td>
                  <td>@mdo</td>
                  <td>@mdo</td>
                  <td>@mdo</td>
                </tr>
              </tbody>
            </table>

          </div>
        </div>
      </div>

      <br>

      <div class="container">
        <div class="row">
          <div class="col-3">
            
          </div>
          <div class="col-1" style="padding-left:0;">
            <img src="<%=request.getContextPath()%>/images/challengers/mychallenge/challenge-date.png" id="challenge_date_image">  기간
          </div>
          <div class="col-5" style="padding-top: 6px;">
            OOOO년 OO월 OO일 - OOOO년 OO월 OO일
          </div>
          <div class="col-3">
           
          </div>
        </div>
      </div>

      <br>

      <div class="container">
        <div class="row">
          <div class="col-3">
            
          </div>
          <div class="col-1" style="padding-left:0;">
            <img src="<%=request.getContextPath()%>/images/challengers/mychallenge/success.png" id="success_rate_image">성공률
          </div>
          <div class="col-5" style="padding-top: 12px;">
            <div class="progress">
              <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 75%;">75 %</div>
            </div>
          </div>
          <div class="col-3">
         
          </div>
        </div>
      </div>

      <br>
      <br>
      <br>

      <!------------------------------------------------------ 갤러리 ------------------------------------------------------>
      <div class="container" id="my_ch_galary" >
        Gallary <span class="badge bg-secondary" style="font-size: 20px;">Beta</span>
      </div>
      <br>

      <div class="container" id="my_ch_introduce" >
        <span style="color:lightseagreen">여러분들의 도전 기록을 사진으로 남겨보세요!</span> <span style="color: hotpink;">(※리스트-회차별, 최대 30장까지 등록가능합니다※)</span>
      </div>
      <br>

      <div class="container">
        <div class="row">
          <div class="col-2">
            <img src="<%=request.getContextPath()%>/images/challengers/mychallenge/add-image.PNG" class="img-thumbnail" alt="..." style="width: 200px; height: 200px;">
          </div>
          <div class="col-2">
            <img src="<%=request.getContextPath()%>/images/challengers/mychallenge/add-image.PNG" class="img-thumbnail" alt="..." style="width: 200px; height: 200px;">
          </div>
          <div class="col-2">
          	 <img src="<%=request.getContextPath()%>/images/challengers/mychallenge/add-image.PNG" class="img-thumbnail" alt="..." style="width: 200px; height: 200px;">
          </div>
          <div class="col-2">
            <img src="<%=request.getContextPath()%>/images/challengers/mychallenge/add-image.PNG" class="img-thumbnail" alt="..." style="width: 200px; height: 200px;">
          </div>
          <div class="col-2">
            <img src="<%=request.getContextPath()%>/images/challengers/mychallenge/add-image.PNG" class="img-thumbnail" alt="..." style="width: 200px; height: 200px;">
          </div>
          <div class="col-2">
            <img src="<%=request.getContextPath()%>/images/challengers/mychallenge/add-image.PNG" class="img-thumbnail" alt="..." style="width: 200px; height: 200px;">
          </div>
        </div>

        <br>

        <div class="row">
          <div class="col-2">
            <img src="<%=request.getContextPath()%>/images/challengers/mychallenge/add-image.PNG" class="img-thumbnail" alt="..." style="width: 200px; height: 200px;">
          </div>
          <div class="col-2">
            <img src="<%=request.getContextPath()%>/images/challengers/mychallenge/add-image.PNG" class="img-thumbnail" alt="..." style="width: 200px; height: 200px;">
          </div>
          <div class="col-2">
            <img src="<%=request.getContextPath()%>/images/challengers/mychallenge/add-image.PNG" class="img-thumbnail" alt="..." style="width: 200px; height: 200px;">
          </div>
          <div class="col-2">
            <img src="<%=request.getContextPath()%>/images/challengers/mychallenge/add-image.PNG" class="img-thumbnail" alt="..." style="width: 200px; height: 200px;">
          </div>
          <div class="col-2">
            <img src="<%=request.getContextPath()%>/images/challengers/mychallenge/add-image.PNG" class="img-thumbnail" alt="..." style="width: 200px; height: 200px;">
          </div>
          <div class="col-2">
            <img src="<%=request.getContextPath()%>/images/challengers/mychallenge/add-image.PNG" class="img-thumbnail" alt="..." style="width: 200px; height: 200px;">
          </div>
        </div>

        <br>

        <div class="row">
          <div class="col-2">
            <img src="<%=request.getContextPath()%>/images/challengers/mychallenge/add-image.PNG" class="img-thumbnail" alt="..." style="width: 200px; height: 200px;">
          </div>
          <div class="col-2">
            <img src="<%=request.getContextPath()%>/images/challengers/mychallenge/add-image.PNG" class="img-thumbnail" alt="..." style="width: 200px; height: 200px;">
          </div>
          <div class="col-2">
            <img src="<%=request.getContextPath()%>/images/challengers/mychallenge/add-image.PNG" class="img-thumbnail" alt="..." style="width: 200px; height: 200px;">
          </div>
          <div class="col-2">
            <img src="<%=request.getContextPath()%>/images/challengers/mychallenge/add-image.PNG" class="img-thumbnail" alt="..." style="width: 200px; height: 200px;">
          </div>
          <div class="col-2">
            <img src="<%=request.getContextPath()%>/images/challengers/mychallenge/add-image.PNG" class="img-thumbnail" alt="..." style="width: 200px; height: 200px;">
          </div>
          <div class="col-2">
            <img src="<%=request.getContextPath()%>/images/challengers/mychallenge/add-image.PNG" class="img-thumbnail" alt="..." style="width: 200px; height: 200px;">
          </div>
        </div>

        <br>

        <div class="row">
          <div class="col-2">
            <img src="<%=request.getContextPath()%>/images/challengers/mychallenge/add-image.PNG" class="img-thumbnail" alt="..." style="width: 200px; height: 200px;">
          </div>
          <div class="col-2">
            <img src="<%=request.getContextPath()%>/images/challengers/mychallenge/add-image.PNG" class="img-thumbnail" alt="..." style="width: 200px; height: 200px;">
          </div>
          <div class="col-2">
            <img src="<%=request.getContextPath()%>/images/challengers/mychallenge/add-image.PNG" class="img-thumbnail" alt="..." style="width: 200px; height: 200px;">
          </div>
          <div class="col-2">
            <img src="<%=request.getContextPath()%>/images/challengers/mychallenge/add-image.PNG" class="img-thumbnail" alt="..." style="width: 200px; height: 200px;">
          </div>
          <div class="col-2">
           	<img src="<%=request.getContextPath()%>/images/challengers/mychallenge/add-image.PNG" class="img-thumbnail" alt="..." style="width: 200px; height: 200px;">
          </div>
          <div class="col-2">
            <img src="<%=request.getContextPath()%>/images/challengers/mychallenge/add-image.PNG" class="img-thumbnail" alt="..." style="width: 200px; height: 200px;">
          </div>
        </div>

      </div>

      <br>
      <br>
      <br>

    <!--------------------------------------------------- 마이 챌린지 안내사항Modal ------------------------------------------------->
    
    <!-- 안내사항 출력 모달 -->
    <div class="modal fade" id="guide_text_modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">My Challenge 안내사항</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
          
            <%if(noList!=null && noList.isEmpty()){ %>
            		<p>등록된 안내사항이 없습니다.</p>
            <%}else{ 
            	int num=1;
            	for(CH_MychallengeNotice no : noList){%>
           <span style="color:#F7819F;">#안내사항 <%=num%>)
           		<%if(loginMember!=null && loginMember.getMemberId().equals("admin")){ %> 
	           		<%-- <span class="badge rounded-pill bg-success" data-bs-toggle="modal" data-bs-target="#exampleModalToggle<%=num%>" >수정</span> --%>
	           		<span class="badge rounded-pill bg-success" id="noticeupdateclick" data-bs-toggle="modal" data-bs-target="#guide_update_modal" 
	           		data-no="<%=no.getMychallengeNoticeNo()%>" data-content="<%=no.getContent()%>">수정</span>
	           		<span class="badge rounded-pill bg-danger"  id="noticedeleteclick" data-bs-toggle="modal" data-bs-target="#guide_delete_modal"
	           		data-no="<%=no.getMychallengeNoticeNo()%>">삭제</span>
           		<%} %>
           </span>
           <br>
           <%=no.getContent() %>
            <br>
          
            <br>
            <%num++;} 
            }%>
              
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-primary"  data-bs-dismiss="modal"  data-bs-toggle="modal" data-bs-target="#chNotice_enroll_modal">&ensp;등록&ensp;</button>
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          </div>
    	</div>
     </div>
   </div>


<!--------------------------------------------------------------------------------------------------------------------------->
														<!--=========================== modal / script ===========================-->
<!--------------------------------------------------------------------------------------------------------------------------->

	<!-- 안내사항 등록 모달 -->
	 <div class="modal fade" id="chNotice_enroll_modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">My Challenge 안내사항 등록</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
           
                 <div class="container">
					  <div class="row">
					    <div class="col-4" style="padding-top:150px;">
					      안내사항 내용
					    </div>
					    <div class="col-8">
					    <div class="form-floating">
			    	<form id="ch_noticeEnrollFrm" action="<%=request.getContextPath()%>/challengers/notice_submit.do" method="post">

			  		<textarea class="form-control"  name="chNotice_content"  placeholder="내용을 작성하세요" id="floatingTextarea2" 
			  							style="height: 300px; resize:none;"></textarea>
		
			  		</form>
				</div>
			    </div>
			  </div>
			</div>
           
          </div>
          <div class="modal-footer">
            <button class="btn btn-primary"  data-bs-toggle="modal"  onclick="document.getElementById('ch_noticeEnrollFrm').submit();">등록하기</button>
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          </div>
        </div>
      </div>
    </div>
    
    
    <script>
    
    // 수정 버튼 클릭 시, data-(변수) 형태로 저장된 값을 가져와서 다른 모달에 데이터를 val()을 사용하여 뿌려준다!
    
    $(document).on("click", "#noticeupdateclick", function () { 
    	let content = $(this).data('content');
    	let noticeNo=$(this).data('no');
    	$("#chNotice_content").val(content); 
    	$("#updatenoticeNo").val(noticeNo); 
    	   	 	
	});
    
    $(document).on("click", "#noticedeleteclick", function () { 
    	let noticeNo=$(this).data('no');
    	$("#deletenoticeNo").val(noticeNo); 
    	
	});
    
    </script>
    
    <!-- 안내사항 수정 모달 -->
     <div class="modal fade" id="guide_update_modal"  data-bs-backdrop="static" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">My Challenge 안내사항 수정</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
           
                 <div class="container">
					  <div class="row">
					    <div class="col-4" style="padding-top:150px;">
					      안내사항 내용
					    </div>
					    <div class="col-8">
					    <div class="form-floating">
			    	<form id="ch_noticeUpdateFrm" action="<%=request.getContextPath()%>/challengers/update_end.do" method="post">
					<input type="hidden" id="updatenoticeNo"  name="updatenoticeNo" value="">
			  		<textarea class="form-control"  name="chNotice_content"  placeholder="내용을 작성하세요" id="chNotice_content" 
			  							style="height: 300px; resize:none;"></textarea>
		
			  		</form>
				</div>
			    </div>
			  </div>
			</div>
           
          </div>
          <div class="modal-footer">
            <button class="btn btn-primary"  data-bs-toggle="modal"  onclick="document.getElementById('ch_noticeUpdateFrm').submit();">수정하기</button>
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          </div>
        </div>
      </div>
    </div> 
    
    
    <!-- 안내사항 삭제 모달 -->
     <div class="modal fade" id="guide_delete_modal"  data-bs-backdrop="static" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">My Challenge 안내사항 삭제</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
           		<p>해당 안내사항을 삭제하시겠습니까?</p>
			 <form id="ch_noticeDeleteFrm" action="<%=request.getContextPath()%>/challengers/deletenotice.do" method="post">
				<input type="hidden" id="deletenoticeNo"  name="deletenoticeNo" value="">
			  </form>
	
          </div>
          <div class="modal-footer">
            <button class="btn btn-primary"  data-bs-toggle="modal"  onclick="document.getElementById('ch_noticeDeleteFrm').submit();">삭제하기</button>
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          </div>
        </div>
      </div>
    </div> 
    
    
    

</section>

<%@ include file="/views/common/footer.jsp"%>