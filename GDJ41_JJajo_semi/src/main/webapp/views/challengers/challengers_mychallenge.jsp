<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %>
<%@ page import="com.im.challengers.model.vo.CH_Challengers" %>
<%@ page import="com.im.challengers.model.vo.CH_MychallengeNotice" %>
<%@ page import="com.im.challengers.model.vo.CH_Mychallenge" %>

<%

	List<CH_Challengers> dropList = (List)request.getAttribute("mychallengeDropList");
	List<CH_MychallengeNotice> noList = (List)request.getAttribute("mychallengeNoticeList");
	List<CH_Mychallenge> myList = (List)request.getAttribute("mychallengeList");
	
   	int chNum=0;
	if(request.getAttribute("chNum")!=null) chNum = (Integer)request.getAttribute("chNum");
	
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
      
      #mychallenge-table>tbody>tr>td>img{
	width:50px; 
	height:50px;
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
              <select class="form-select" id="doing_ch_list" aria-label="Default select example">
                <%if(dropList!=null && !(dropList.isEmpty())){%>
                	<option value="0">-- 리스트 선택 --</option>
                <%for(CH_Challengers ch : dropList){%>
                	<option value="<%=ch.getChallengersNo()%>"><%=ch.getTitle()%></option>
                <%}
                }%>
              </select>
            </form>
          </div>
        </div>
      </div>
      
      <br>

		<script>

    	// 드롭 리스트에서 목록 선택 후, 화면 전환 시 선택했던 리스트를 selected로 고정해 주는 로직
    	$(()=>{
    		
	    	$('#doing_ch_list').val(<%=chNum%>).attr("selected","selected");
    
		
		})
    	
    	// 리스트 드롭 선택 시, 해당 챌린지 데이터를 가져오기 위해 서블릿으로 전송
        $("#doing_ch_list").change(function(){
        
        	let chNo=$(this).val();
        	
        	location.href="<%=request.getContextPath()%>/challengers/mychallenge.do?challengersNo="+chNo
        
        });
		
		
		</script>


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
      
      

<%if(myList!=null){ 
 					for(CH_Mychallenge my : myList){%> 
      <div class="container" style="text-align: center;">
        <div class="row">
          <div class="col-4">
          
          </div>
          <div class="col">
            <img src="<%=request.getContextPath()%>/images/challengers/mychallenge/back-arrow.png" id="back_arrow_image">
          </div>
          <div class="col" style="padding-top: 2px; font-size: 25px;">
            <%=my.getCount() %> 회차
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
          
            <table class="table table-bordered border-info align-middle"  id="mychallenge-table" style="text-align: center;">
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
          		  <td><img src="<%=request.getContextPath()%>/images/challengers/mychallenge/<%=my.getDay1().equals("Y")?"pass.png": my.getDay1().equals("N")?"fail.png":"noresult.png"%>"  id="1day" data-day="MY_1DAY" data-count="<%=my.getCount()%>"></td> 
                  <td><img src="<%=request.getContextPath()%>/images/challengers/mychallenge/<%=my.getDay2().equals("Y")?"pass.png": my.getDay2().equals("N")?"fail.png":"noresult.png"%>" id="2day" data-day="MY_2DAY" data-count="<%=my.getCount()%>"></td> 
                  <td><img src="<%=request.getContextPath()%>/images/challengers/mychallenge/<%=my.getDay3().equals("Y")?"pass.png": my.getDay3().equals("N")?"fail.png":"noresult.png"%>" id="3day" data-day="MY_3DAY" data-count="<%=my.getCount()%>"></td> 
                  <td><img src="<%=request.getContextPath()%>/images/challengers/mychallenge/<%=my.getDay4().equals("Y")?"pass.png": my.getDay4().equals("N")?"fail.png":"noresult.png"%>" id="4day" data-day="MY_4DAY" data-count="<%=my.getCount()%>" ></td> 
                  <td><img src="<%=request.getContextPath()%>/images/challengers/mychallenge/<%=my.getDay5().equals("Y")?"pass.png": my.getDay5().equals("N")?"fail.png":"noresult.png"%>" id="5day" data-day="MY_5DAY" data-count="<%=my.getCount()%>"></td> 
                  <td><img src="<%=request.getContextPath()%>/images/challengers/mychallenge/<%=my.getDay6().equals("Y")?"pass.png": my.getDay6().equals("N")?"fail.png":"noresult.png"%>" id="6day" data-day="MY_6DAY" data-count="<%=my.getCount()%>"></td> 
                  <td><img src="<%=request.getContextPath()%>/images/challengers/mychallenge/<%=my.getDay7().equals("Y")?"pass.png": my.getDay7().equals("N")?"fail.png":"noresult.png"%>" id="7day" data-day="MY_7DAY" data-count="<%=my.getCount()%>"></td> 
                  <td>7</td>
                </tr>
 
              <tr>
              <th scope="row"><br><br>2주차<br><br><br></th>
          		  <td><img src="<%=request.getContextPath()%>/images/challengers/mychallenge/<%=my.getDay8().equals("Y")?"pass.png": my.getDay8().equals("N")?"fail.png":"noresult.png"%>"    id="8day" data-day="MY_8DAY" data-count="<%=my.getCount()%>" ></td> 
                  <td><img src="<%=request.getContextPath()%>/images/challengers/mychallenge/<%=my.getDay9().equals("Y")?"pass.png": my.getDay9().equals("N")?"fail.png":"noresult.png"%>"    id="9day" data-day="MY_9DAY" data-count="<%=my.getCount()%>"></td> 
                  <td><img src="<%=request.getContextPath()%>/images/challengers/mychallenge/<%=my.getDay10().equals("Y")?"pass.png": my.getDay10().equals("N")?"fail.png":"noresult.png"%>" id="10day" data-day="MY_10DAY" data-count="<%=my.getCount()%>" ></td> 
                  <td><img src="<%=request.getContextPath()%>/images/challengers/mychallenge/<%=my.getDay11().equals("Y")?"pass.png": my.getDay11().equals("N")?"fail.png":"noresult.png"%>"   id="11day" data-day="MY_11DAY" data-count="<%=my.getCount()%>" ></td> 
                  <td><img src="<%=request.getContextPath()%>/images/challengers/mychallenge/<%=my.getDay12().equals("Y")?"pass.png": my.getDay12().equals("N")?"fail.png":"noresult.png"%>"  id="12day" data-day="MY_12DAY" data-count="<%=my.getCount()%>"></td> 
                  <td><img src="<%=request.getContextPath()%>/images/challengers/mychallenge/<%=my.getDay13().equals("Y")?"pass.png": my.getDay13().equals("N")?"fail.png":"noresult.png"%>"  id="13day" data-day="MY_13DAY" data-count="<%=my.getCount()%>"></td> 
                  <td><img src="<%=request.getContextPath()%>/images/challengers/mychallenge/<%=my.getDay14().equals("Y")?"pass.png": my.getDay14().equals("N")?"fail.png":"noresult.png"%>"  id="14day" data-day="MY_14DAY" data-count="<%=my.getCount()%>"></td> 
                  <td>7</td>
                </tr>
                
                <tr>
                  <th scope="row"><br><br>3주차<br><br><br></th>
              	  <td><img src="<%=request.getContextPath()%>/images/challengers/mychallenge/<%=my.getDay15().equals("Y")?"pass.png": my.getDay15().equals("N")?"fail.png":"noresult.png"%>"  id="15day" data-day="MY_15DAY" data-count="<%=my.getCount()%>"></td> 
                  <td><img src="<%=request.getContextPath()%>/images/challengers/mychallenge/<%=my.getDay16().equals("Y")?"pass.png": my.getDay16().equals("N")?"fail.png":"noresult.png"%>"  id="16day" data-day="MY_16DAY" data-count="<%=my.getCount()%>"></td> 
                  <td><img src="<%=request.getContextPath()%>/images/challengers/mychallenge/<%=my.getDay17().equals("Y")?"pass.png": my.getDay17().equals("N")?"fail.png":"noresult.png"%>"  id="17day" data-day="MY_17DAY" data-count="<%=my.getCount()%>"></td> 
                  <td><img src="<%=request.getContextPath()%>/images/challengers/mychallenge/<%=my.getDay18().equals("Y")?"pass.png": my.getDay18().equals("N")?"fail.png":"noresult.png"%>"  id="18day" data-day="MY_18DAY" data-count="<%=my.getCount()%>"></td> 
                  <td><img src="<%=request.getContextPath()%>/images/challengers/mychallenge/<%=my.getDay19().equals("Y")?"pass.png": my.getDay19().equals("N")?"fail.png":"noresult.png"%>"  id="19day" data-day="MY_19DAY" data-count="<%=my.getCount()%>"></td> 
                  <td><img src="<%=request.getContextPath()%>/images/challengers/mychallenge/<%=my.getDay20().equals("Y")?"pass.png": my.getDay20().equals("N")?"fail.png":"noresult.png"%>"  id="20day" data-day="MY_20DAY" data-count="<%=my.getCount()%>"></td> 
                  <td><img src="<%=request.getContextPath()%>/images/challengers/mychallenge/<%=my.getDay21().equals("Y")?"pass.png": my.getDay21().equals("N")?"fail.png":"noresult.png"%>"  id="21day" data-day="MY_21DAY" data-count="<%=my.getCount()%>"></td> 
                  <td>7</td>
                </tr>
                
                <tr>
                  <th scope="row"><br><br>4주차<br><br><br></th>
                  <td><img src="<%=request.getContextPath()%>/images/challengers/mychallenge/<%=my.getDay22().equals("Y")?"pass.png": my.getDay22().equals("N")?"fail.png":"noresult.png"%>"  id="22day" data-day="MY_22DAY" data-count="<%=my.getCount()%>"></td> 
                  <td><img src="<%=request.getContextPath()%>/images/challengers/mychallenge/<%=my.getDay23().equals("Y")?"pass.png": my.getDay23().equals("N")?"fail.png":"noresult.png"%>"  id="23day" data-day="MY_23DAY" data-count="<%=my.getCount()%>"></td> 
                  <td><img src="<%=request.getContextPath()%>/images/challengers/mychallenge/<%=my.getDay24().equals("Y")?"pass.png": my.getDay24().equals("N")?"fail.png":"noresult.png"%>"  id="24day" data-day="MY_24DAY" data-count="<%=my.getCount()%>"></td> 
                  <td><img src="<%=request.getContextPath()%>/images/challengers/mychallenge/<%=my.getDay25().equals("Y")?"pass.png": my.getDay25().equals("N")?"fail.png":"noresult.png"%>"  id="25day" data-day="MY_25DAY" data-count="<%=my.getCount()%>"></td> 
                  <td><img src="<%=request.getContextPath()%>/images/challengers/mychallenge/<%=my.getDay26().equals("Y")?"pass.png": my.getDay26().equals("N")?"fail.png":"noresult.png"%>"  id="26day" data-day="MY_26DAY" data-count="<%=my.getCount()%>"></td> 
                  <td><img src="<%=request.getContextPath()%>/images/challengers/mychallenge/<%=my.getDay27().equals("Y")?"pass.png": my.getDay27().equals("N")?"fail.png":"noresult.png"%>"  id="27day" data-day="MY_27DAY" data-count="<%=my.getCount()%>"></td> 
                  <td><img src="<%=request.getContextPath()%>/images/challengers/mychallenge/<%=my.getDay28().equals("Y")?"pass.png": my.getDay28().equals("N")?"fail.png":"noresult.png"%>"  id="28day" data-day="MY_28DAY" data-count="<%=my.getCount()%>"></td> 
                  <td>7</td>
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

  		<%} 
 		}%> 
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

 <!--------------------------------------------------------------------------------------------------------------------------->
														<!--=========================== modal / script ===========================-->
<!--------------------------------------------------------------------------------------------------------------------------->
    
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
		  <form id="ch_noticeDeleteFrm"  action="<%=request.getContextPath()%>/challengers/deletenotice.do" method="post">
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
    
    
    
    <!-- 챌린지 성공 여부 안내 모달 -->
     <div class="modal fade" id="mychallenge_result_enroll"  data-bs-backdrop="static" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">챌린지 결과 등록</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
           		<p style="text-align:center;">도전에 성공 하셨습니까?<br><span style="color:red;">※한번 등록한 결과는 변경할 수 없으니 주의 바랍니다※</span></p>
		  <!-- 성공시, 전달할 폼 태그 -->
		  <form id="ch_resultSubmitFrm"  action="<%=request.getContextPath()%>/challengers/result_enroll.do" method="post">		  
				<input type="hidden" id="ch_result_submit_button"  name="chResult" value="">
				<input type="hidden" name="member_No" value="<%=loginMember.getMemberNo()%>">
				<input type="hidden" name="challengers_No" value="<%=chNum%>">
				<input type="hidden"  id="select_day" name="ch_Day" value="">
				<input type="hidden"  id="challenge_count" name="ch_Count" value="">
	
		  </form> 
		  <!-- 실패시, 전달할 폼태그 -->
		   <form id="ch_failFrm"  action="<%=request.getContextPath()%>/challengers/mychallenge_submit.do" method="post">
				<input type="hidden" id="deletenoticeNo"  name="chResult" value="N">
		  </form> 
	
          </div>
          <div class="modal-footer">
            <button class="btn btn-primary"  id="ch_success_submit_button"  data-check="Y" data-bs-toggle="modal" >&ensp;&ensp;네&ensp;&ensp;</button>
            <button type="button" class="btn btn-secondary"   id="ch_fail_submit_button"  data-check="N" data-bs-toggle="modal"  >아니오</button>
          </div>
        </div>
      </div>
    </div> 
    
    
    
<script>

	$(document).on("click", "#mychallenge-table>tbody>tr>td>img", function () { 
	  	
		let day = $(this).data('day');
		let count = $(this).data('count');
		
		$("#select_day").val(day); 
		$("#challenge_count").val(count); 
		
	  	   	 	
		});
	
	// 챌린지 성공 버튼 시, 실행 되는 로직
	$(document).on("click", "#ch_success_submit_button", function () { 
	  	
		let check = $(this).data('check');

		$("#ch_result_submit_button").val(check); 
		
		document.getElementById('ch_resultSubmitFrm').submit();
	  	   	 	
		});
	
	// 챌린지 실패 버튼 클릭 시, 실행되는 로직
	$(document).on("click", "#ch_fail_submit_button", function () { 
	  	
		let check = $(this).data('check');

		$("#ch_result_submit_button").val(check); 
		
		document.getElementById('ch_resultSubmitFrm').submit();
	  	   	 	
		});

    
    // 수정 버튼 클릭 시, data-(변수) 형태로 저장된 값을 가져와서 다른 모달에 데이터를 val()을 사용하여 뿌려준다!
    $(document).on("click", "#noticeupdateclick", function () { 
    	let content = $(this).data('content');
    	let noticeNo=$(this).data('no');
    	$("#chNotice_content").val(content); 
    	$("#updatenoticeNo").val(noticeNo); 
    	   	 	
	});
    
 // 삭제 버튼 클릭 시, data-(변수) 형태로 저장된 값을 가져와서 다른 모달에 데이터를 val()을 사용하여 뿌려준다!
    $(document).on("click", "#noticedeleteclick", function () { 
    	let noticeNo=$(this).data('no');
    	$("#deletenoticeNo").val(noticeNo); 
    	
	});
    
    // 마이챌린지 테이블 이미지에 모달 속성을 전체적으로 부여
    $(()=>{
 
    let attrObj={
    			"data-bs-toggle": "modal",
    			"data-bs-target":"#mychallenge_result_enroll"
    	};
    	
    	$("#mychallenge-table>tbody>tr>td>img").attr(attrObj);
    	
    });
    
    // 드롭 리스트에서 목록 선택 후, 화면 전환 시 선택했던 리스트를 selected로 고정해 주는 로직
    $(()=>{
    		
	    	$('#doing_ch_list').val(<%=chNum%>).attr("selected","selected");
    	
	});
    	
    // 리스트 드롭 선택 시, 해당 챌린지 데이터를 가져오기 위해 서블릿으로 전송
    $("#doing_ch_list").change(function(){
        
       	let chNo=$(this).val();
       	
       	location.href="<%=request.getContextPath()%>/challengers/mychallenge.do?challengersNo="+chNo
        
     });
    
    const successFunction=()=>{
    	
    	
    	
    }
   
    

    
    
</script>
    

</section>

<%@ include file="/views/common/footer.jsp"%>