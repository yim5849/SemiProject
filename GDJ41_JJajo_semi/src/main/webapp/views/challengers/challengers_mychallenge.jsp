<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



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
                <option selected>물 1L 마시기</option>
                <option value="1">헬스장 가기</option>
                <option value="2">밥대신 샐러드</option>
                <option value="3">1만보 걷기</option>
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
            <button type="button" class="btn btn-warning btn-sm"><span style="color: white;">◁ 리스트 보기</span></button>
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
    <div class="modal fade" id="guide_text_modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">My Challenge 안내사항</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            
            1. ㅎㅇ
            <br>
            <br>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          </div>
        </div>
      </div>
    </div>


</section>

<%@ include file="/views/common/footer.jsp"%>