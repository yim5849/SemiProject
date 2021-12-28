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
 
 	<div class="text-center container">
	  <img src="https://img3.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202105/25/sbsnoriter/20210525064846663ctyu.jpg" id="myImage" class="rounded-circle">
	  <br>
	  <span><%=memberName%></span> 
	</div>
	
	<br>
	
	<div class="btn-group  " role="group" aria-label="Basic example" style="margin-left: 960px;">
	  <button type="button" class="btn btn-primary">블로그</button>
	  <button type="button" class="btn btn-primary" onclick=location.assign("<%=request.getContextPath()%>/buyList.do")>구매내역</button>
	</div>
	<br>
  
	
	
	<div class="btn-group " role="group" aria-label="Basic outlined example" style="margin-bottom:0px; margin-left:410px;">
  	<button type="button" class="btn btn-outline-primary" onclick=location.assign("<%=request.getContextPath()%>/myStore.do?memberNo=<%=memberNo%>&&memberName=<%=memberName%>")>판매상품</button>
  	<button type="button" class="btn btn-outline-primary" onclick=location.assign("<%=request.getContextPath()%>/review.do?memberNo=<%=memberNo%>&&memberName=<%=memberName%>")>후기</button> 
	
	</div>
 
  	<div class="my-product container">
  	
  		 	<table class="product-table" style="margin:30px 0px 0px 30px;">
  		 	<%for(Comment c:list){ %>
				<tr>
					<td>
					<img src="https://img3.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202105/25/sbsnoriter/20210525064846663ctyu.jpg" id="myImage" class="rounded-circle">
					</td>
					<td rowspan="2" width="900px" border="1" style="padding-left: 30px;" >
						<div>
							<p><%=c.getCommentContent() %></p>
						</div> 
						<div style="text-align-last: right;">
							<p><%=c.getEnrollData() %></p>
						</div>
						<div>
							<p><%=c.getProductTitle()%></p>
						</div>
					</td>
				</tr>
				<tr>
					<td><%=c.getCommentWriter()%></td> 
				</tr>
			<%} %>	
 			</table> 
  	</div>
  	
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