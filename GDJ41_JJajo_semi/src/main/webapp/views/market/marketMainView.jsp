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
		margin: 0px 200px 20px 500px;
    	text-de
	}
	section>h3{
		text-align: center;
		padding: 0%;
	}

   .dropdown{
		margin:0px;
		margin-left:30px;
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
		margin-bottom: 30px;
	}
	#icons{
		font-weight: bold;
		color: black; 
		text-decoration: none;
	}
	 
	 #productView{
	 	text-decoration: none;
	 }
 
	 #productView:hover{
	 	
	 }

</style>

<section id="main"> 

<%if(loginMember==null) { %>
<div class="container">
	<div class="row" style="text-align: center;">
	  <div class="col">  
	  </div>
	  <div class="col" style="text-align: center;">
		<h3>중고거래 최신매물</h3>
	  </div>
	  <div class="col">  
	  </div>  
	</div>
</div>
<%}else{ %>
<div class="container">
	<div class="row" style="text-align: center;">
	  <div class="col">
		<a id="icons" href="<%=request.getContextPath()%>/enrollproduct.do"><img src="<%=request.getContextPath()%>/images/market/money1.png" width="50px" height="40px" class="rounded"> 판매하기</a>
	  </div>
	  <div class="col" style="text-align: center;">
		<h3>중고거래 최신매물</h3>
	  </div>
	  <div class="col" style="text-align: center;">
		<a id="icons" href="<%=request.getContextPath()%>/myStore.do?memberNo=<%=loginMember.getMemberNo()%>"><img src="<%=request.getContextPath()%>/images/market/store.png" width="50px" height="45px"  class="rounded" > 내상점</a>
	  </div>
	</div>
</div>
<%} %>

 
  
	<div class="dropdown">
	  <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
	    CATEGORY
	  </a>
	   <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
	    <li><a class="dropdown-item" href="<%=request.getContextPath()%>/marketMainView.do">HOME</a></li>
<!-- 	    <li><a class="dropdown-item" name="category" id="drop-cloth" href="javascript:void(0)">헬스의류</a></li> -->
	    <li><a class="dropdown-item" href="<%=request.getContextPath()%>/categoryCheck.do?category=헬스의류">헬스의류</a></li>
	    <li><a class="dropdown-item" href="<%=request.getContextPath()%>/categoryCheck.do?category=헬스기구">헬스기구</a></li>
	    <li><a class="dropdown-item" href="<%=request.getContextPath()%>/categoryCheck.do?category=운동간식">운동간식</a></li>
	    <li><a class="dropdown-item" href="<%=request.getContextPath()%>/categoryCheck.do?category=기타용품">기타</a></li>
	  </ul>
 	</div>
 
	 
	 <%if(list!=null&&list.isEmpty()){%>
	  		<p>등록된 게시물이 없습니다</p>
	  <%}else{ %>         
	   <div class="d-flex flex-wrap">
	     <%for(ProductBoard pb : list) {%>
	     	<%if(pb.getIsSale().equals("Y")) {%> 
	     	<a id="productView" href="<%=request.getContextPath()%>/productView.do?productNo=<%=pb.getProductNo()%>">
	        <div style="display:inline-block"> 
			  <div class="card" style="width: 18rem;">
			  	<%if(pb.getFileName().isEmpty()){ %>
			 	   <img src="<%=request.getContextPath()%>/images/market/camera.png" height="150px" class="card-img-top">	
			 	<%}else{ %>
				  <img src="<%=request.getContextPath()%>/upload/market/<%=pb.getFileName().get(0).getFileName()%>" height="150px" class="card-img-top">
			 	<%} %>   
			 	   <div class="card-body">
			   	        <h5 class="card-title"><%=pb.getTitle()%> </h5>
			     	    <p class="card-text" style="color:cornflowerblue;">#<%=pb.getCategory()%></p>
			     	    <p class="card-text"><%=pb.getMember_name()%></p>
			     	    <p class="card-text"><%=pb.getEnrollDate()%></p>
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
    