<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang&display=swap" rel="stylesheet">
<%@ page import="com.jm.market.model.vo.ProductBoard" %> 
<%
	ProductBoard pb=(ProductBoard)request.getAttribute("productBoard"); 
 
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
	 
	.content{
		height:400px;
		background: none;
	}
	 
</style> 
 	
<section>
	 
<form style="margin-left:500px;"> 
 
		<div id="carouselExampleDark" class="carousel carousel-dark slide container" data-bs-ride="carousel">
		  <div class="carousel-indicators">
		    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
		     <%for(int i=1; i<pb.getFileName().size();i++) { %>  
			    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to=<%=i%> aria-label="Slide"+<%=i+1%>></button> 
		      <%} %>
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
			<td rowspan="2" width="400px" border="1" style="padding-left: 30px;" >
				<div>
					<h1><%=pb.getMember_name()%></h1>
					<%-- <h1><%=pb.getTitle()%></h1> --%>
				</div>
				<%-- <div>
					<p style="margin-bottom: 0px; font-size:30px; font-weight: bolder; "><%=pb.getPrice()원</p>
				</div>  --%>
				<div>
					<p><%=pb.getAddress()%></p>
				</div> 
			<%--	<div>
					<p style="color: cornflowerblue;">#<%=pb.getCategory()%></p>
				</div>--%>
			</td>
		</tr>
		<tr>
			<%-- <td style="text-align:center;"><%=pb.getMember_name()%> </td> --%>
		</tr>
 
 	</table>
 	
 		<br>
 	 	 <div style="border-top: gray 1px solid; padding-top:20px;">
			 <h1 style="font-weight: 700;"><%=pb.getTitle()%></h1>
		 </div>
		 <div>
					<p style="color: cornflowerblue;">#<%=pb.getCategory()%></p>
		</div>
	     <div>
		     <p style="margin-bottom: 0px; font-size:30px; font-weight: bolder; "><%=pb.getPrice()%>원</p>
		 </div>	
 	<br>
 	  <div class="col-12 content" style="border-bottom: black solid 3px;   font-size:25px; padding:0px;"> 
 	  	  <%=pb.getContent()%>
	      <%-- 	<textarea rows="5" cols="50" style="width:1100px;" class="form-control" readonly ><%=pb.getContent()%></textarea> --%>
	      	<br>
	  </div>
	  
	 
		
		
	  <br>
	  <div>
			<img id="target2" src="<%=request.getContextPath()%>/images/market/back-button.png" width="50px" height="50px">
			<input type="button" name="back"  style="display:none;"  onclick="javascript:history.back();">
	  </div>
 	  <div class="d-grid gap-2 d-md-flex justify-content-md-end">
 	   <%if(pb.getMemberNo()!=loginMember.getMemberNo()&&pb.getIsDelete().equals("N")){ %>
			 <!-- Button trigger modal -->
			<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
			 	구매하기
			</button>
			
			<!-- Modal -->
			<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="staticBackdropLabel">상품구매</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        해당상품을 정말로 구입하시겠습니까? 
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">아니오</button>
			        <button type="button" class="btn btn-primary" onclick="location.assign('<%=request.getContextPath()%>/buyProduct.do?productNo=<%=pb.getProductNo()%>&&memberNo=<%=loginMember.getMemberNo()%>')">네</button>
			      </div>
			    </div>
			  </div>
			</div>  
		<%}else if(pb.getMemberNo()!=loginMember.getMemberNo()&&pb.getIsDelete().equals("Y")){ %>
		<button type="button" class="btn btn btn-danger">거래 진행중</button>
		<%}else{ %>
		<button type="button" class="btn btn-outline-primary" onclick="location.assign('<%=request.getContextPath()%>/updateProduct.do?productNo=<%=pb.getProductNo()%>')">수정하기</button>
		<%} %>	
	  </div>
 	
	 
</form>
 
</section>


<script> 
	$("#target2").click(e=>{
		$("input[name=back]").click();
	})
</script>
 	

<%@ include file="/views/common/footer.jsp" %>