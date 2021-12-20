<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

<style>
	section>*{
			margin: 0px 300px 0px 300px;
	    
		}
	#myImage{
		height:100px;
		width:100px; 
	}
	
	.my-product{
  		height: 300px;
		margin-top: 0px;
 		border: 2px solid black;
	}
	
	.btn btn-light{
		border:1px blue;
	}
	
	.card{
		margin:30px;
	}

 
</style>

  
<section>  
 	<div class="text-center">
	  <img src="https://img3.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202105/25/sbsnoriter/20210525064846663ctyu.jpg" id="myImage" class="rounded-circle">
	  <br>
	  <span>user_id</span> 
	</div>
	<br>
	
	<div class="btn-group" role="group" aria-label="Basic example" style="margin-left: 720px;">
	  <button type="button" class="btn btn-primary">블로그</button>
	  <button type="button" class="btn btn-primary" onclick=location.assign("<%=request.getContextPath()%>/sellList.do")>판매내역</button>
	  <button type="button" class="btn btn-primary" onclick=location.assign("<%=request.getContextPath()%>/buyList.do")>구매내역</button>
	</div>
	<br>
  
	
	
	<div class="btn-group" role="group" aria-label="Basic outlined example" style="margin-bottom:0px;">
  	<button type="button" class="btn btn-outline-primary"  >판매상품</button>
  	<button type="button" class="btn btn-outline-primary" onclick=location.assign("<%=request.getContextPath()%>/review.do")>후기</button> 
	</div>
 
	<div class="my-product">
		<div id="product-line" style="display:inline-flex">
			<div class="card" style="width: 18rem;">
				 <img src="<%=request.getContextPath()%>/images/market/camera.png" height="150px" class="card-img-top"  >
				 <div class="card-body">
				    <h5 class="card-title">Card title</h5>
				    <a href="<%=request.getContextPath()%>/productView.do" class="btn btn-primary">보러가기</a>
				 </div>
			</div>
				
			<div class="card" style="width: 18rem;">
				 <img src="<%=request.getContextPath()%>/images/market/camera.png" height="150px" class="card-img-top"  >
				 <div class="card-body">
				    <h5 class="card-title">Card title</h5>
				    <a href="<%=request.getContextPath()%>/productView.do" class="btn btn-primary">보러가기</a>
				 </div>
			</div>
			
			<div class="card" style="width: 18rem;">
				 <img src="<%=request.getContextPath()%>/images/market/camera.png" height="150px" class="card-img-top"  >
				 <div class="card-body">
				    <h5 class="card-title">Card title</h5>
				    <a href="<%=request.getContextPath()%>/productView.do" class="btn btn-primary">보러가기</a>
				 </div>
			</div>
	 	</div>
 	</div>
 	<br>
 	<div>
		<img id="target2" src="<%=request.getContextPath()%>/images/market/back-button.png" width="50px" height="50px">
		<input type="button" name="back"  style="display:none;"  onclick="javascript:history.back();">
	</div>
	
	
	

</section>



<script> 
	$("#target2").click(e=>{
		$("input[name=back]").click();
	})
</script>


<%@ include file="/views/common/footer.jsp" %>