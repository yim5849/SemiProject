<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang&display=swap" rel="stylesheet">
<%@ page import="com.jm.market.model.vo.ProductBoard" %>
<%
	ProductBoard pb=(ProductBoard)request.getAttribute("pb");
%>

<style>

	section{
		text-align: center;
		font-family: 'Gowun Batang', serif;
		margin: 50px 300px 20px 300px;
	}
	
 

</style>



<section>

		<h1>거래후기 등록하기</h1>
		<input type="text" value="<%=pb.getTitle()%>" readonly>
		<input type="text" value="<%=pb.getMember_name()%>님의 판매글" readonly>
		
		<br><br>
		
	    <div class="col-12 container"> 
		     <textarea rows="5" cols="100" class="form-control" id="content" placeholder="<%=pb.getMember_name()%>님과의 거래 후기를 남겨주세요 "></textarea>
	    <br>
	    </div>
	    
	    <div class="d-grid gap-2 col-6 mx-auto">
  			<button class="btn btn-primary" id="reviewEnroll">등록하기</button> 
		</div>
	    

</section>

<script>

$("#reviewEnroll").click(e=>{
		const frm=new FormData(); 
		frm.append("content",$("#content").val());
		frm.append("memberNo",<%=pb.getMemberNo()%>);
		frm.append("productNo",<%=pb.getProductNo()%>);
		frm.append("writer","<%=loginMember.getMemberName()%>");
		frm.append("title","<%=pb.getTitle()%>");
		
		 $.ajax({
			url:"<%=request.getContextPath()%>/reviewEnrollend.do",
			type:"post",
			data:frm,
			processData:false,
			contentType:false,
			success:data=>{
				alert(data["msg"]);
				location.replace("<%=request.getContextPath()%>"+data["loc"]);
			}
		}) 
	})



</script>
<%@ include file="/views/common/footer.jsp" %>