<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang&display=swap" rel="stylesheet">
<%@ page import="java.util.List,com.jm.market.model.vo.ProductBoard" %> 
<%
	List<ProductBoard> list=(List)request.getAttribute("list");

%>
<style> 
	
	*{
		list-style: none;
		text-decoration: none; 
		margin: 0px;
		padding: 0px;
		color: black;
		font-family: 'Gowun Batang', serif;
	}
	
	section>*{
		margin: 20px 200px 0px 500px;
    	text-de
	}
	section>h3{
		text-align: center;
		padding: 0%;
	}

     .dropdown{
		margin:0px;
		margin-left:0px;
		padding:0px;
	}  
	
	.dropdown-toggle{
		text-decoration: none;
		background-color: none;
		font-size: 20px;
		color: black;
		border: 0;	
	}
	
 	
	.card{
		margin-right: 0px;
		margin-bottom: 30px;
		 height:350px;
	}
	#icons{
		font-weight: bold;
		color: black; 
		text-decoration: none;
	}
	 
	 #productView{
	 	margin-right:20px;
	 	text-decoration: none;
	 }
 
	 .card-1>div{
	 	display: inline-block;
	 }

	.mainbox { 
		font-weight: bolder;
		background-color: white;
		width: 300px;
		height: 350px;
		border-radius: 10px;
		margin-bottom: 20px;
	    overflow: hidden;
	}

	.mainbox:hover {
		box-shadow: 0px 0px 10px rgba(143, 140, 140, 0.5);
	}
	
	.top{
		border-right:1px black;
	}
</style>

<section id="main"> 

<%if(loginMember==null) { %>
<div class="container">
	<div class="row" style="text-align: center;">
	  <div class="col">  
	  </div>
	  <div class="col" style="text-align: center; border-left: black 2px;">
		<h3>중고거래 최신매물</h3>
	  </div>
	  <div class="col">  
	  </div>  
	</div>
</div>
<%}else{ %>
<div class="container">
	<div class="row">
	  <div class="col-4"  >
	  			<div class="dropdown container">
				  <a class="dropdown-toggle"  role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="true">
				    카테고리
				  </a>
				   <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
				    <li><a class="dropdown-item" href="<%=request.getContextPath()%>/marketMainView.do">HOME</a></li> 
				    <li><a class="dropdown-item" href="<%=request.getContextPath()%>/categoryCheck.do?category=헬스의류">헬스의류</a></li>
				    <li><a class="dropdown-item" href="<%=request.getContextPath()%>/categoryCheck.do?category=헬스기구">헬스기구</a></li>
				    <li><a class="dropdown-item" href="<%=request.getContextPath()%>/categoryCheck.do?category=운동간식">운동간식</a></li>
				    <li><a class="dropdown-item" href="<%=request.getContextPath()%>/categoryCheck.do?category=기타용품">기타</a></li>
				  </ul>
			 	</div> 
 	  </div>
	  <div class="col-4" style="text-align: center;">
		<h3 style="font-weight:bolder;">중고거래 최신매물</h3>
	  </div>
	  <div class="col-4" > 
		 	<a id="icons" href="<%=request.getContextPath()%>/enrollproduct.do"><img src="<%=request.getContextPath()%>/images/market/money1.png" width="40px" height="40px" class="rounded top"> 판매하기</a>
			<span style="font-weight: bolder; color:gray;"> │ </span>
			<a id="icons" href="<%=request.getContextPath()%>/myStore.do?memberNo=<%=loginMember.getMemberNo()%>"><img src="<%=request.getContextPath()%>/images/market/store.png" width="45px" height="45px"  class="rounded" > 내상점</a>
		 	 
	  </div>
	</div>
</div>
<%} %>

 
  
<%-- 	<div class="dropdown container">
	  <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
	    CATEGORY
	  </a>
	   <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
	    <li><a class="dropdown-item" href="<%=request.getContextPath()%>/marketMainView.do">HOME</a></li> 
	    <li><a class="dropdown-item" href="<%=request.getContextPath()%>/categoryCheck.do?category=헬스의류">헬스의류</a></li>
	    <li><a class="dropdown-item" href="<%=request.getContextPath()%>/categoryCheck.do?category=헬스기구">헬스기구</a></li>
	    <li><a class="dropdown-item" href="<%=request.getContextPath()%>/categoryCheck.do?category=운동간식">운동간식</a></li>
	    <li><a class="dropdown-item" href="<%=request.getContextPath()%>/categoryCheck.do?category=기타용품">기타</a></li>
	  </ul>
 	</div> --%>
 	
 	<br><br>
 
	 
	 <%if(list!=null&&list.isEmpty()){%>
	  		<p>등록된 게시물이 없습니다</p>
	  <%}else{ %>         
	   <div class="d-flex flex-wrap container">
	     <%for(ProductBoard pb : list) {%>
	     	<%if(pb.getIsSale().equals("Y")) {%> 
	     	<a id="productView" href="<%=request.getContextPath()%>/productView.do?productNo=<%=pb.getProductNo()%>">
	     	
	          <div class="mainbox" style="display:inline-block"> 
			   <div class="card container" style="width: 19rem; padding:0px; margin-right:20px;">
			  	<%if(pb.getFileName().isEmpty()){ %>
			 	   <img src="<%=request.getContextPath()%>/images/market/camera.png" width="250px" height="230px" class="card-img-top">	
			 	<%}else{ %>
				  <img src="<%=request.getContextPath()%>/upload/market/<%=pb.getFileName().get(0).getFileName()%>" width="300px" height="230px" class="card-img-top">
			 	<%} %>   
			 	   <div class="card-body" style="height:50px;">
			   	        <h5 class="card-title"><%=pb.getTitle()%> </h5>
			     	    <p class="card-text" style="color:cornflowerblue;">#<%=pb.getCategory()%></p>
			     	    <div class="card-1">
			     	    	<div class="card-text" style="margin-right:120px; font-size:21px;"><%=pb.getMember_name()%></div>
			     	    	<div class="card-text" style="color:gray;"><%=pb.getEnrollDate()%></div>
			    		</div>
			    		<%-- <a href="<%=request.getContextPath()%>/productView.do?productNo=<%=pb.getProductNo()%>" class="btn btn-primary">보러가기</a> --%>
			  	   </div>
			   </div>            		
	         </div>
	         
	        </a>
	        <%} %>
	      <%} %>
	    </div>	       
	   <%} %> 

  
 


</section>

<script>

<%-- $("a[name=category]").click(e=>{
	$.ajax({
		url:"<%=request.getContextPath()%>/categoryCheck.do",
		dataType:"json",
		data:{category:$(e.target).text()},
		success:data=>{ 
 			for(let i=0; i<data.length;i++){
			console.log(data[i]);  
			}
		}
	})
 
}) --%>





</script>

<%@ include file="/views/common/footer.jsp"%>    
    