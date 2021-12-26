<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<style> 
	section>*{
				margin: 0px 300px 20px 300px;
		    
			}
</style>

		
<section>

	<h2 style="text-align: center;">판매목록</h2>
	<br>
	
	<div id="product-line" style="margin-left: 700px;">
		<div class="card" style="width: 18rem;">
		<a href="<%=request.getContextPath()%>/productView.do" ><img src="<%=request.getContextPath()%>/images/market/camera.png" height="150px" class="card-img-top"></a> 
		  <div class="card-body">
		    <h5 class="card-title">Card title</h5>
		     <p class="card-text">2021-12-19</p>
		     
		   	 <div class="btn-group" role="group" aria-label="Basic outlined example">
  				<button type="button" class="btn btn-outline-primary">수정</button>
  				<button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#product-delete">삭제</button>
  				<button type="button" class="btn btn-outline-primary">거래완료</button>
			 </div>
		  </div>
		</div>
		<br>
		<div class="card" style="width: 18rem;">
		  <img src="<%=request.getContextPath()%>/images/market/camera.png" height="150px" class="card-img-top" alt="...">
		  <div class="card-body">
		    <h5 class="card-title">Card title</h5>
		     <p class="card-text">2021-12-19</p>
		     <div class="btn-group" role="group" aria-label="Basic outlined example">
  				<button type="button" class="btn btn-outline-primary">수정</button>
  				<button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#product-delete">삭제</button>
  				<button type="button" class="btn btn-outline-primary">거래완료</button>
			 </div>
		  </div>
		</div>
		<br>
		<div class="card" style="width: 18rem;">
		  <img src="<%=request.getContextPath()%>/images/market/camera.png" height="150px" class="card-img-top" alt="...">
		  <div class="card-body">
		    <h5 class="card-title">Card title</h5>
		     <p class="card-text">2021-12-19</p>
		     <div class="btn-group" role="group" aria-label="Basic outlined example">
  				<button type="button" class="btn btn-outline-primary">수정</button>
  				<button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#product-delete">삭제</button>
  				<button type="button" class="btn btn-outline-primary">거래완료</button>
			 </div>
		  </div>
		</div>
	</div>

 
<!-- Button trigger modal -->
 
<!-- update Modal -->
<div class="modal fade" id="product-delete" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">삭제</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        게시글을 정말 삭제하시겠어요?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">아니요</button>
        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">네</button>
      </div>
    </div>
  </div>
</div>






</section>






<%@ include file="/views/common/footer.jsp" %>