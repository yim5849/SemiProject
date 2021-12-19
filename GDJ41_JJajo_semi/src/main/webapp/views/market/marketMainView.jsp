<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ include file="/views/common/header.jsp" %>
<style> 
	section>*{
		margin: 0px 300px 20px 300px;
    
	}
	section>h3{
		text-align: center;
		padding: 0%;
	}

   .dropdown{
		margin:0px;
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
	.card{
		margin-right: 80px;
	}
 
 

</style>

<section id="main"> 

<div class="container">
	<div class="row" style="text-align: center;">
	  <div class="col">
		<a href="<%=request.getContextPath()%>/enrollproduct.do"><img src="<%=request.getContextPath()%>/images/market/cash.png" width="50px" height="40px"   class="rounded" alt="..."></a>
	</div>
	  <div class="col" style="text-align: center;">
		<h3>중고거래 최신매물</h3>
	  </div>
	  <div class="col" style="text-align: center;">
		<a href="<%=request.getContextPath()%>/myStore.do"><img src="<%=request.getContextPath()%>/images/market/store.png" width="50px" height="45px"  class="rounded" ></a>
	  </div>
	</div>
  </div>
  
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

	<div id="product-line" style="display:inline-flex">
		<div class="card" style="width: 18rem;">
		  <img src="<%=request.getContextPath()%>/images/market/camera.png" height="150px" class="card-img-top" alt="...">
		  <div class="card-body">
		    <h5 class="card-title">Card title</h5>
		     <p class="card-text">2021-12-19</p>
		    <a href="<%=request.getContextPath()%>/productView.do" class="btn btn-primary">보러가기</a>
		  </div>
		</div>
		
		<div class="card" style="width: 18rem;">
		  <img src="<%=request.getContextPath()%>/images/market/camera.png" height="150px" class="card-img-top" alt="...">
		  <div class="card-body">
		    <h5 class="card-title">Card title</h5>
		     <p class="card-text">2021-12-19</p>
		    <a href="<%=request.getContextPath()%>/productView.do" class="btn btn-primary">보러가기</a>
		  </div>
		</div>
		
		<div class="card" style="width: 18rem;">
		  <img src="<%=request.getContextPath()%>/images/market/camera.png" height="150px" class="card-img-top" alt="...">
		  <div class="card-body">
		    <h5 class="card-title">Card title</h5>
		     <p class="card-text">2021-12-19</p>
		    <a href="<%=request.getContextPath()%>/productView.do" class="btn btn-primary">보러가기</a>
		  </div>
		</div>
	</div>



</section>


<%@ include file="/views/common/footer.jsp"%>    
    