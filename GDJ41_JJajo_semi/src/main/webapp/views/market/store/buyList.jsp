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

	#productView{
	
		text-decoration: none; 
	}
</style>

		
<section>

	<h2 style="text-align: center;">구매목록</h2>
	<br>
	
<div id="product-line" class="container" style="margin-left: 700px;">
	<%if(list.isEmpty()) { %>
		<div>구매한 상품이 없습니다</div>
	<%}else{ %>
	  <%for(ProductBoard pb : list) {%>
	  <a id="productView" href="<%=request.getContextPath()%>/productView.do?productNo=<%=pb.getProductNo()%>">
		<div class="card" style="width: 18rem; margin-bottom:30px; height:350px;">
			<%if(pb.getFileName().isEmpty()){ %>
				   <img src="<%=request.getContextPath()%>/images/market/camera.png" height="150px" class="card-img-top">	
		    <%}else{ %>
			   <img src="<%=request.getContextPath()%>/upload/market/<%=pb.getFileName().get(0).getFileName()%>" height="200px" class="card-img-top">
		     <%} %>   
			  <div class="card-body">
			    <h5 class="card-title"><%=pb.getTitle()%></h5>
			     <p class="card-text"><%=pb.getEnrollDate()%></p><br>
		</a>
			   	 <div class="btn-group" role="group" aria-label="Basic outlined example">
	  				<button type="button" class="btn btn-outline-primary" onclick=location.assign("<%=request.getContextPath()%>/reviewEnroll.do?productNo=<%=pb.getProductNo()%>")>거래후기남기기</button> 
			 	 </div>
		 	   </div>
		 </div>
	 <%}
	  }%>	 
		
		
</div>


</section>

 





<%@ include file="/views/common/footer.jsp" %>