<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

<style>
	section>*{
			margin: 0px 300px 20px 300px;
	    
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
	
	.dropdown-toggle{
		background-color: #FBFBEF;
		font-size: 20px;
		margin-left: 200px;
		color: black;
		border: 0;	
	}
	
	.dropdown-toggle:hover{
		background-color: tan;
			
	}
	
	.dropdown{
		margin:0px;
	} 

	.card{
		margin:30px;
	}
</style>

 
	
	
<section> 
	<div class="dropdown">
	  <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
	    CATEGORY
	  </a>
	   <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
	    <li><a class="dropdown-item" href="<%=request.getContextPath()%>/marketMainView.do">HOME</a></li>
	    <li><a class="dropdown-item" href="#">헬스의류</a></li>
	    <li><a class="dropdown-item" href="#">헬스기구</a></li>
	    <li><a class="dropdown-item" href="#">운동간식</a></li>
	    <li><a class="dropdown-item" href="#">기타</a></li>
	  </ul>
 	</div>
 	<div class="text-center">
	  <img src="https://img3.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202105/25/sbsnoriter/20210525064846663ctyu.jpg" id="myImage" class="rounded-circle">
	</div>
	<br>
	
	<div class="btn-group" role="group" aria-label="Basic example"  style="margin-left: 700px;">
	  <button type="button" class="btn btn-primary" onclick=location.assign("<%=request.getContextPath()%>/sellList.do")>판매내역</button>
	  <button type="button" class="btn btn-primary" onclick=location.assign("<%=request.getContextPath()%>/buyList.do")>구매내역</button>
	  <button type="button" class="btn btn-primary">관심상품</button>
	  <button type="button" class="btn btn-primary">블로그</button>
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
	
	
	

</section>


<%@ include file="/views/common/footer.jsp" %>