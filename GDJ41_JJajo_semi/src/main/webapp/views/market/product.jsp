<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<%@ page import="com.jm.market.model.vo.ProductBoard" %> 
<%
	ProductBoard pb=(ProductBoard)request.getAttribute("productBoard"); 
 
 %>
<style> 

	 section>*{
		margin: 0px 300px 200px 300px;
	 }
	 #myImage{
		height:100px;
		width:100px; 
	}
	
 	.w-100{
		width:0px;
		height:400px;
	}
	.carousel-item{
		margin-right:500px;
	}
	.carousel-inner{
		height:400px;
	}
	 
</style> 
 	
<section>
	 
<form style="margin-left:500px;"> 


<%--  	<div class="container">
  		<div class="row" style="margin-left:200px">
  		  <div class="col" style="align-self: center; row:0px width:0px">
   			   <img src="<%=request.getContextPath()%>/images/market/leftArrow.png" height=50px class="rounded"  >
   		  </div>
		  <div class="col">
			  <img src="<%=request.getContextPath()%>/images/market/camera.png" height=150px class="rounded"  >
		  </div>
    	  <div class="col" style="align-self:center;"">
      		   <img src="<%=request.getContextPath()%>/images/market/rightArrow.png" height=50px class="rounded"  >
    	  </div>
  	  	</div>
	</div>  --%> 
 

		 
<%-- 	 ------------------------------------------------------------------------------------------------------------------------------------------ --%>
		
		<div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
		  <div class="carousel-indicators">
		    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
		    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
		    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
		  </div>
		  <div class="carousel-inner">
		    <div class="carousel-item active" data-bs-interval="10000">
		      <img src="<%=request.getContextPath()%>/upload/market/<%=pb.getFileName().get(0).getFileName()%>"  class="d-block w-100"    >
		    </div>
		  <%for(int i=1; i<pb.getFileName().size();i++) { %>  
		    <div class="carousel-item" data-bs-interval="2000">
		      <img src="<%=request.getContextPath()%>/upload/market/<%=pb.getFileName().get(i).getFileName()%>" class="d-block w-100"  >
		    </div>
		  <%} %>   
		  </div>
		  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Previous</span>
		  </button>
		  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Next</span>
		  </button>
		</div>
	 
	 
	<br><br>	
		
 	<table class="product-table" style="margin-left: 30px;">
		<tr>
			<td>
				<a href="<%=request.getContextPath()%>/myStore.do?memberNo=<%=pb.getMemberNo()%>"><img src="https://img3.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202105/25/sbsnoriter/20210525064846663ctyu.jpg" id="myImage" class="rounded-circle"></a>
			</td>
			<td rowspan="2" width="300px" border="1" style="padding-left: 30px;" >
				<div>
					<h3><%=pb.getTitle()%></h3>
				</div>
				<div>
					<p style="margin-bottom: 0px;"><%=pb.getPrice()%>원</p>
				</div>
				<div>
					<p><%=pb.getAddress()%></p>
				</div> 
				<div>
					<p style="color: cornflowerblue;">#<%=pb.getCategory()%></p>
				</div>
			</td>
		</tr>
		<tr>
			<td style="text-align:center;"><%=pb.getMember_name()%> </td> 
		</tr>
 
 	</table>
 	
 		<br>
 	
 	
 	  <div class="col-12" style="border-bottom: black solid 3px"> 
	      	<textarea rows="5" cols="50" style="width:1100px;" class="form-control" readonly ><%=pb.getContent()%></textarea>
	      	<br>
	  </div>
	  <br>
	  <div>
			<img id="target2" src="<%=request.getContextPath()%>/images/market/back-button.png" width="50px" height="50px">
			<input type="button" name="back"  style="display:none;"  onclick="javascript:history.back();">
	  </div>
 	  <div class="d-grid gap-2 d-md-flex justify-content-md-end">
  			<button class="btn btn-primary me-md-2" type="submit">채팅하기</button>	 
	  </div>
 	
	 
</form>
 
</section>


<script> 
	$("#target2").click(e=>{
		$("input[name=back]").click();
	})
</script>
 	

<%@ include file="/views/common/footer.jsp" %>