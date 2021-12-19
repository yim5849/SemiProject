<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<style> 
	 

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




</section>

<%@ include file="/views/common/footer.jsp" %>