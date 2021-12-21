<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.im.challengers.model.vo.CH_Advertisement" %>

<%

CH_Advertisement ad =(CH_Advertisement)request.getAttribute("advertisement");

%>


<%@ include file="/views/common/header.jsp"%>


<section>
      <div style="text-align: center; font-size: 20px; color: lightsalmon;">광고 등록 페이지입니다. 작성 후, 등록완료 부탁드립니다.</div>
      <br>
      <br>
    <form action='<%=request.getContextPath()%>/challengers/advertisement_update_end.do'
		method="post" enctype="multipart/form-data"  id="adFrm">
      <div class="container">
        <div class="row row-cols-2">
          <div class="col" style="text-align: center; font-size: 20px; color: lightseagreen;">상품 판매 URL</div>
          <div class="col-4">
            <div class="mb-3">
              <input type="text" class="form-control" id="formGroupExampleInput"  name="ad_url"  value="<%=ad.getAddress()%>">
            </div>
          </div>
          <div class="col" style="text-align: center; font-size: 20px; color: lightseagreen;">광고 이미지 등록</div>
          <div class="col-4">
            <div class="mb-3">
              <input class="form-control"  name="ad_upfile" type="file" id="formFile"><span><%=ad.getFilepath()%></span>
              <input type="hidden" name="ad_orifile" value="<%=ad.getFilepath()%>">
            </div>
          </div>
        </div>
      </div>

      <div class="container">
        <div class="row row-cols-2">
          <div class="col" style="text-align: center; font-size: 20px; color: lightseagreen; padding-top: 50px;">광고 안내글</div>
          <div class="col-4">
            <div class="mb-3">
              <textarea class="form-control" id="adv_content"  name="ad_content" rows="5" style="resize:none;" ><%=ad.getContent() %></textarea>
            </div>
          </div>
          <div class="col"></div>
          <div class="col"></div>
          <input type="hidden" name="ad_advertisementNo" value="<%=ad.getAdvertisementNo()%>">
        </div>
      </div>

      <br>
      <br>

      <div class="container">
        <div class="row" style="text-align: center;">
          <div class="col">
        
          </div>
          <div class="col">
            <button type="submit" class="btn btn-outline-success" onclick="AdValidation();">등록</button> 
            <button type="button" class="btn btn-outline-danger">취소</button>
          </div>
          <div class="col">

          </div>
        </div>
      </div>

    </form>

</section>
    
  <script>
  
  const AdValidation= ()=>{
	  
	  const content = $("#adv_content").val().trim();
	  if(content.length==0){
		  $("#adv_content").val('※이미지 클릭시, 해당 상품 사이트로 이동합니다※');
	  }
	  $("#adFrm").submit();
	  
  }
  
  
  </script> 





<%@ include file="/views/common/footer.jsp"%>
    
    