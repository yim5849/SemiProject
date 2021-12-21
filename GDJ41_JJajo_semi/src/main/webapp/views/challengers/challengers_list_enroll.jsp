<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp"%>
    
<section>
      <div style="text-align: center; font-size: 20px; color: lightsalmon;">챌린져스 등록 페이지입니다. 작성 후, 등록완료 부탁드립니다.</div>
      <br>
      <br>
    <form action='<%=request.getContextPath()%>/challengers/ch_submit.do'
		method="post" enctype="multipart/form-data"  id="chFrm">
      <div class="container">
        <div class="row row-cols-2">
          <div class="col" style="text-align: center; font-size: 20px; color: lightseagreen;">제목(TITLE)</div>
          <div class="col-4">
            <div class="mb-3">
              <input type="text" class="form-control" id="ch_title_"  name="ch_title" placeholder="챌린져스 제목을 입력하세요(10글자 미만 입력(공백포함))">
            </div>
          </div>
          <div class="col" style="text-align: center; font-size: 20px; color: lightseagreen;">챌린져스 이미지 등록</div>
          <div class="col-4">
            <div class="mb-3">
              <input class="form-control"  name="ch_upfile" type="file" id="formFile">
            </div>
          </div>
        </div>
      </div>

      <div class="container">
        <div class="row row-cols-2">
          <div class="col" style="text-align: center; font-size: 20px; color: lightseagreen; padding-top: 50px;">챌린져스 소개글</div>
          <div class="col-4">
            <div class="mb-3">
              <textarea class="form-control" id="ch_content_"  name="ch_content" rows="5" style="resize:none;" 
              	placeholder="** 해당 챌린지를 소개하는 글을 작성해주세요! (82글자 미만 입력(공백포함))**" ></textarea>
            </div>
          </div>
          <div class="col"></div>
          <div class="col"></div>
        </div>
      </div>

      <br>
      <br>

      <div class="container">
        <div class="row" style="text-align: center;">
          <div class="col">
        
          </div>
          <div class="col">
            <button type="button" class="btn btn-outline-success" onclick="return ChValidation();">등록</button> 
            <button type="button" class="btn btn-outline-danger" onclick="history.go(-1)">취소</button>
          </div>
          <div class="col">

          </div>
        </div>
      </div>

    </form>

</section>
    
  <script>
  
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
  
  
  </script> 
    
<%@ include file="/views/common/footer.jsp"%>