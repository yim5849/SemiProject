<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<style> 
	section>*{
				margin: 0px 300px 20px 300px;
		    
			}
</style>

		
<section>

	<h2 style="text-align: center;">구매목록</h2>
	<br>
	
	<div id="product-line" style="margin-left: 700px;">
		<div class="card" style="width: 18rem;">
		<a href="<%=request.getContextPath()%>/productView.do" ><img src="<%=request.getContextPath()%>/images/market/camera.png" height="150px" class="card-img-top"></a> 
		  <div class="card-body">
		    <h5 class="card-title">Card title</h5>
		     <p class="card-text">2021-12-19</p>
		   	 <div class="btn-group" role="group" aria-label="Basic outlined example">
  				<button type="button" class="btn btn-outline-primary">거래후기남기기</button> 
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
  				<button type="button" class="btn btn-outline-primary">거래후기남기기</button>
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
  				<button type="button" class="btn btn-outline-primary">거래후기남기기</button>
			 </div>
		  </div>
		</div>
	</div>




</section>






<%@ include file="/views/common/footer.jsp" %>