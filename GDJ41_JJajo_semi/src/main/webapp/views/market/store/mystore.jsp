<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<%@ page import="java.util.List,com.jm.market.model.vo.ProductBoard" %>
<%
	List<ProductBoard> list=(List)request.getAttribute("list");

%>
<style>
	section>*{
			margin: 0px 300px 0px 300px;
	    
		}
	#myImage{
		height:100px;
		width:100px; 
	}
	
	.my-product{
  		height: auto;
		margin-top: 0px;
 		border: 2px solid black;
	}
	
	.btn btn-light{
		border:1px blue;
	}
	
	.card{
		margin:30px;
	}

 
</style>

  
<section>  
 	<div class="text-center">
	  <img src="https://img3.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202105/25/sbsnoriter/20210525064846663ctyu.jpg" id="myImage" class="rounded-circle">
	  <br>
	  <span>user_id</span> 
	</div>
	<br>
	<%if(loginMember==null){ %>
	<div class="btn-group" role="group" aria-label="Basic example" style="margin-left: 810px;">
	  <button type="button" class="btn btn-primary">블로그</button> 
	</div>
	<%}else { %>
	<div class="btn-group" role="group" aria-label="Basic example" style="margin-left: 720px;">
	  <button type="button" class="btn btn-primary">블로그</button>
	  <button type="button" class="btn btn-primary" onclick=location.assign("<%=request.getContextPath()%>/sellList.do")>판매내역</button>
	  <button type="button" class="btn btn-primary" onclick=location.assign("<%=request.getContextPath()%>/buyList.do")>구매내역</button>
	</div>
	
	<%} %>
	<br>
  
	
	
	<div class="btn-group" role="group" aria-label="Basic outlined example" style="margin-bottom:0px;">
  	<button type="button" class="btn btn-outline-primary"  >판매상품</button>
  	<button type="button" class="btn btn-outline-primary" onclick=location.assign("<%=request.getContextPath()%>/review.do")>후기</button> 
	</div>
 
	<div class="my-product">
		 	 <%if(list!=null&&list.isEmpty()){%>
			  		<p>등록된 게시물이 없습니다</p>
			  <%}else{ %>        
			   <div class="d-flex flex-wrap">
			     <%for(ProductBoard pb : list) {%> 
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
					    		<a href="<%=request.getContextPath()%>/productView.do?productNo=<%=pb.getProductNo()%>" class="btn btn-primary">보러가기</a>
					  	   </div>
					   </div>            		
			        </div>
			      <%} %>
			    </div>	       
			   <%} %> 
 	</div>
 	<br>
 	
 	<div>
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