<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang&display=swap" rel="stylesheet">
<%@ page import="java.util.List,com.jm.market.model.vo.ProductBoard" %>
<%
	List<ProductBoard> list=(List)request.getAttribute("list"); 
	Member m=(Member)request.getAttribute("member");
%>
<style>
	section>*{
	  margin: 0px 300px 0px 300px;
	  font-family: 'Gowun Batang', serif;
   }
	#myImage{
		height:100px;
		width:100px; 
	} 
	.my-product{
  		height: auto;
		margin-top: 0px;
 		border-top: 2px solid gray;
	} 
	.btn btn-light{
		border:1px blue;
	} 
	.card{
		margin-right: 0px;
		margin-bottom: 30px;
		 height:350px;
	}
	
	 #pView{
	 	color:black; 
	 	text-decoration: none;
	 }

 	.mainbox { 
		font-weight: bolder;
		background-color: white;
		width: 300px;
		height: 380px;
		border-radius: 10px;
		margin-bottom: 20px;
		margin-right:20px;
	    overflow: hidden;
	}

	.mainbox:hover {
		box-shadow: 0px 0px 10px rgba(143, 140, 140, 0.5);
	}
	.card-1>div{
	 	display: inline-block;
	 }
	 
  .nav-item.show .nav-link {
    text-decoration: none
  }
  
  .store1{
  	padding-top:50px; 
  	text-align:center; 
  	background: url("./images/market/gray.jpg");
    background-size: 100% 100%;
    margin:0px;
  }
	
</style>

  
<section>  

	<div class="container">
	  <div class="row" style="border:1px darkgrey solid; padding:0px;">
	    <div class="col-4" style="padding:0px;">
	      <div class="text-center container store1" style="height:300px; width:400px;">
	      	<div style="display:inline-block;">
			  <img src="<%=request.getContextPath()%>/images/market/myprofile1.png" id="myImage" class="rounded-circle">
			  <br><br>
			  <span style="font-size: 20px; font-weight: bolder;"><%=m.getMemberName()%></span><br><br>
			  <% if(loginMember!=null&&loginMember.getMemberNo()==m.getMemberNo()) { %>
	 		 	<button type="button" class="btn btn-outline-dark" onclick=location.assign("<%=request.getContextPath()%>/buyList.do?memberNo=<%=loginMember.getMemberNo()%>")>구매내역</button>
	 		  <%} %>
			</div>  
		  </div>
	    </div>
	    <div class="col-8">
	    <br><br>
	    	<img src="<%=request.getContextPath()%>/images/market/shop.png" width="50px" height="50px" >
	       <span style="font-size: 30px; font-weight: bolder;"> <%=m.getMemberName()%>님의 상점</span><br><br>
	       <span>상점 오픈일:<%=m.getEnrollDate()%></span>
	    </div>
	  </div>
	</div>
	
	<br><br>
	
	
 <%-- 	<div class="text-center container">
	  <img src="https://img3.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202105/25/sbsnoriter/20210525064846663ctyu.jpg" id="myImage" class="rounded-circle">
	  <br>
	  <span><%=m.getMemberName()%></span>
	</div>
	<br>
	<%if(loginMember==null){ %>
	<div class="btn-group" role="group" aria-label="Basic example" style="margin-left: 970px;">
	  <button type="button" class="btn btn-primary">블로그</button> 
	</div>
	<%}else { %>
	<div class="btn-group" role="group" aria-label="Basic example" style="margin-left: 970px;">
	  <button type="button" class="btn btn-primary">블로그</button> 
	  <% if(loginMember!=null&&loginMember.getMemberNo()==m.getMemberNo()) { %>
	  	<button type="button" class="btn btn-primary" onclick=location.assign("<%=request.getContextPath()%>/buyList.do?memberNo=<%=loginMember.getMemberNo()%>")>구매내역</button>
	  <%} %>
	</div>
	
	<%} %> --%>
	<br>
  
	 
	<div class="btn-group" role="group" aria-label="Basic outlined example" style="margin-left:400px;">
  	<button type="button" class="btn btn-outline-dark"  >판매상품</button> 
  	<button type="button" class="btn btn-outline-dark" onclick=location.assign("<%=request.getContextPath()%>/review.do?memberNo=<%=m.getMemberNo()%>&&memberName=<%=m.getMemberName()%>")>후기</button> 
	</div>
 
 	
 	
	<div class="my-product container">
		 	 <%if(list!=null&&list.isEmpty()){%>
			  		<p>등록된 게시물이 없습니다</p>
			  <%}else{ %>        
			   <div class="d-flex flex-wrap" style="margin-top:20px;">
			     <%for(ProductBoard pb : list) {%> 
			        <div class="mainbox"style="display:inline-block"> 
					  <div class="card container"  style="width: 19rem;   padding:0px; margin-right:20px;"> 
					  	<a id="pView" href="<%=request.getContextPath()%>/productView.do?productNo=<%=pb.getProductNo()%>">
						  	<%if(pb.getFileName().isEmpty()){ %>
						 	   <img src="<%=request.getContextPath()%>/images/market/camera.png" height="150px" class="card-img-top">	
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
						 </a>
					     	  <%--   <%if(pb.getIsSale().equals("Y")){ %>
					    			<a href="<%=request.getContextPath()%>/productView.do?productNo=<%=pb.getProductNo()%>" class="btn btn-primary">보러가기</a> 
					    		<%}else{ %>
					    			<a href="<%=request.getContextPath()%>/productView.do?productNo=<%=pb.getProductNo()%>" class="btn btn-primary">보러가기</a> 
					    			<button type="button" class="btn btn btn-danger">거래완료</button> 
					    		<%} %> --%>
					    		
					    		<!-- 내상점일때만 보이는 추가버튼 -->  
					    		<% if(loginMember!=null&&loginMember.getMemberNo()==pb.getMemberNo()) { %>
						     	  <div class="btn-group" role="group" aria-label="Basic outlined example">
					    		<%if(pb.getIsSale().equals("Y")){ %>
					  				<button type="button" class="btn btn-outline-dark" onclick="location.assign('<%=request.getContextPath()%>/updateProduct.do?productNo=<%=pb.getProductNo()%>')">수정</button>
					  			    <%-- <button type="button" class="btn btn-outline-primary" onclick="location.replace('<%=request.getContextPath()%>/deleteProduct.do?productNo=<%=pb.getProductNo()%>&&memberNo=<%=pb.getMemberNo()%>')">삭제</button>
					  		        <button type="button" class="btn btn-outline-primary" onclick="location.assign('<%=request.getContextPath()%>/dealProduct.do?productNo=<%=pb.getProductNo()%>&&memberNo=<%=pb.getMemberNo()%>')">거래완료</button> --%>
					  			 <%-- <%} %> --%>
					  			 
 				  				<!-- 삭제 모달 Button trigger modal -->
								<button type="button" class="btn btn-outline-dark" data-bs-toggle="modal" data-bs-target="#staticBackdrop">삭제</button> 
								<!-- 삭제하기 Modal -->
								<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
								  <div class="modal-dialog">
								    <div class="modal-content">
								      <div class="modal-header">
								        <h5 class="modal-title" id="staticBackdropLabel">게시글 삭제</h5>
								        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								      </div>
								      <div class="modal-body">
								        정말 게시글을 삭제하시겠습니까?
								      </div>
								      <div class="modal-footer">
								        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">아니요</button>
								        <button type="button" class="btn btn-primary" onclick="location.replace('<%=request.getContextPath()%>/deleteProduct.do?productNo=<%=pb.getProductNo()%>&&memberNo=<%=pb.getMemberNo()%>')">네</button>
								      </div>
								    </div>
								  </div>
								</div>
								
								<!-- 거래완료 Button trigger modal -->
								<button type="button" class="btn btn-outline-dark" data-bs-toggle="modal" data-bs-target="#exampleModal">거래완료</button>
										
								<!-- 거래완료 Modal -->
								<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
								  <div class="modal-dialog">
									 <div class="modal-content">
										 <div class="modal-header">
										    <h5 class="modal-title" id="exampleModalLabel">거래완료</h5>
										       <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
										  </div>
										  <div class="modal-body">
									      정말 거래완료로 변경하시겠습니까? <br>
									      한번 완료하면 다시 판매중으로 변경할 수 없습니다
										  </div>
										  <div class="modal-footer">
											     <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">아니오</button>
										     <button type="button" class="btn btn-primary" onclick="location.assign('<%=request.getContextPath()%>/dealProduct.do?productNo=<%=pb.getProductNo()%>&&memberNo=<%=pb.getMemberNo()%>')">네</button>
										   </div>
									  </div>
								  </div>
						       	</div>
								 <%}else{ %> 
								 	<!-- 삭제 모달 Button trigger modal -->
									<button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">삭제</button>
									<button type="button" class="btn btn btn-danger">거래완료</button>  
									<!-- 삭제하기 Modal -->
									<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
									  <div class="modal-dialog">
									    <div class="modal-content">
									      <div class="modal-header">
									        <h5 class="modal-title" id="staticBackdropLabel">게시글 삭제</h5>
									        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									      </div>
									      <div class="modal-body">
									        정말 게시글을 삭제하시겠습니까?
									      </div>
									      <div class="modal-footer">
									        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">아니요</button>
									        <button type="button" class="btn btn-primary" onclick="location.replace('<%=request.getContextPath()%>/deleteProduct.do?productNo=<%=pb.getProductNo()%>&&memberNo=<%=pb.getMemberNo()%>')">네</button>
									      </div>
									    </div>
									  </div>
									</div>

								 <%} %>

								 
							 </div>
							<%} %> 
					  	   </div>
					   </div>            		
			        </div>
			      <%} %>
			    </div>	       
			   <%} %> 
 	</div>
 	<br>
 	
 	<div class="container">
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