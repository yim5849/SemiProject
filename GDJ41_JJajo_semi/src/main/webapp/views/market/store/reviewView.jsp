<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang&display=swap" rel="stylesheet">
<%@ page import="java.util.List,com.jm.market.model.vo.Comment" %>
<%
	List<Comment> list=(List)request.getAttribute("list");
	String memberName = (String)request.getAttribute("memberName"); 
	String memberNo = (String)request.getAttribute("memberNo"); 
%>
<style>
	section>*{
			margin: 0px 300px 20px 300px;
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
		margin:30px;
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
			  <span style="font-size: 20px;"><%=memberName%>님의 상점</span><br><br> 
			  <% if(loginMember!=null&&loginMember.getMemberName().equals(memberName)) { %>
	 		 	<button type="button" class="btn btn-outline-dark" onclick=location.assign("<%=request.getContextPath()%>/buyList.do?memberNo=<%=loginMember.getMemberNo()%>")>구매내역</button>
	 		  <%} %>
			</div>  
		  </div>
	    </div>
	    <div class="col-8">
	    <br><br>
	    	<div style="margin-bottom:30px;"> 
	    		<img src="<%=request.getContextPath()%>/images/market/shop.png" width="50px" height="50px" >
	        	<span style="font-size: 30px; font-weight: bolder;"> <%=memberName%>님의 상점</span>
	    	</div>
	    	<div>
	    	<span>상점오픈일 : 2021-02-28  </span> <br>
	    	<span>판매중인 상품수 : 4개 상품판매 : 3회</span> 
	    	</div> 
	    </div>
	  </div>
	</div>
 	 
 	<br><br>
 
 
 
<%--  
 	<div class="text-center container">
	  <img src="https://img3.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202105/25/sbsnoriter/20210525064846663ctyu.jpg" id="myImage" class="rounded-circle">
	  <br>
	  <span><%=memberName%></span> 
	</div>
	
	<br>
	
	<div class="btn-group  " role="group" aria-label="Basic example" style="margin-left: 960px;">
	  <button type="button" class="btn btn-primary">블로그</button>
	 	<% if(loginMember!=null&&loginMember.getMemberName()==memberName) { %>
	  	<button type="button" class="btn btn-primary" onclick=location.assign("<%=request.getContextPath()%>/buyList.do?memberNo=<%=loginMember.getMemberNo()%>")>구매내역</button>
	  	<%} %>
	</div>
	<br> --%>
  
	
	
	<div class="btn-group " role="group" aria-label="Basic outlined example" style="margin-bottom:0px; margin-left:410px;">
  	<button type="button" class="btn btn-outline-dark" onclick=location.assign("<%=request.getContextPath()%>/myStore.do?memberNo=<%=memberNo%>&&memberName=<%=memberName%>")>판매상품</button>
  	<button type="button" class="btn btn-outline-dark" onclick=location.assign("<%=request.getContextPath()%>/review.do?memberNo=<%=memberNo%>&&memberName=<%=memberName%>")>후기</button> 
	
	</div>
 
  	<div class="my-product container">
  		 	<table class="product-table" style="margin:30px 0px 0px 30px;">
  	   <div> 
  		 	<%for(Comment c:list){ %>
				<tr>
					<td>
					<img src="<%=request.getContextPath()%>/images/market/myprofile1.png" id="myImage" style="width:60px; height:60px;" class="rounded-circle">
					</td>
					<td rowspan="2" width="900px" border="1" style="padding-left: 30px;" >
						<div>
							<p style="font-size:22px;"><%=c.getCommentContent() %></p>
						</div> 
						<div style="text-align-last: right;">
							<p><%=c.getEnrollData() %></p>
						</div>
						<div>
							<div style="border:1px gray solid; width:150px;">
								<p style="color:gray"><%=c.getProductTitle()%></p>
							</div>
						</div>
					</td>
				</tr>
				<tr style="border-bottom:1px gray solid; margin-bottom:10px;">
					<td><h5> <%=c.getCommentWriter()%> </h5></td> 
				</tr>
			<%} %>	
 		</div>	
 			</table> 
  	</div>
  	
  	<div class="container">
		<img id="target2" src="<%=request.getContextPath()%>/images/market/back-button.png" width="40px" height="40px">
		<input type="button" name="back"  style="display:none;"  onclick="javascript:history.back();">
	</div>
	
	

</section>


<script> 
	$("#target2").click(e=>{
		$("input[name=back]").click();
	})
</script>


<%@ include file="/views/common/footer.jsp" %>