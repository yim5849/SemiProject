<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ include file="/views/common/header.jsp" %>
<style> 
	section>h3{
		text-align: center;
		padding: 0%;
	}

	.dropdown-toggle{
		background-color: #FBFBEF;
		font-size: 20px;
		margin-left: 30px;
		color: black;
		border: 0;	
	}
	
	.dropdown-toggle:hover{
		background-color: tan;
			
	}
	  

</style>
 <section id="main">
<!-- 카테고리, 상품 미리보기 출력 -->
<div class="container">
	<div class="row" style="text-align: center;">
	  <div class="col">
		<a href=""><img src="<%=request.getContextPath()%>/images/market/cash.png" width="50px" height="40px"   class="rounded" alt="..."></a>
	</div>
	  <div class="col" style="text-align: center;">
		<h3>중고거래 최신매물</h3>
	  </div>
	  <div class="col" style="text-align: center;">
		<a href=""><img src="<%=request.getContextPath()%>/images/market/store.png" width="50px" height="45px"  class="rounded" alt="..."></a>
	  </div>
	</div>
  </div>
  
<div class="dropdown">
  <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
    CATEGORY
  </a>
   <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
    <li><a class="dropdown-item" href="#">헬스의류</a></li>
    <li><a class="dropdown-item" href="#">헬스기구</a></li>
    <li><a class="dropdown-item" href="#">운동간식</a></li>
    <li><a class="dropdown-item" href="#">기타</a></li>
  </ul>
</div>






</section>


<%@ include file="/views/common/footer.jsp"%>    
    