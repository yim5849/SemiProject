<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jj.member.model.vo.Member" %>    
<%
	Member m=(Member)request.getAttribute("member");
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div#checkId-container{
		text-align:center;
		padding-top:50px;
	}
	span#duplicated{
		color:red;
		font-weight:bolder;
	}
</style>
</head>

<body>
<div id="checkId-container">
	<%if(m==null){ %>
			[<span><%=request.getParameter("memberId") %></span>]는 사용가능합니다.	
			<br><br>
			<button type="button" id="btn">닫기</button>
	<%}else{ %>
			[<span id="duplicated"><%=m.getMemberId()%></span>]는 사용중입니다.
			<br><br>
			<!-- 아이디 재입력창 구성 -->
			<form action="<%=request.getContextPath() %>/member/idDuplicate.do" 
			method="post">
				<input type="text" name="memberId" id="memberId">
				<input type="submit" value="중복검사">
			</form>
	<%} %>
	</div>
	<script>
		const el=document.querySelector("#btn").addEventListener("click",e=>{
			const memberId='<%=request.getParameter("memberId")%>';
			opener.document.enrollMemberFrm.memberId.value=memberId;
			opener.document.enrollMemberFrm.memberPwd.focus();
			// opener.document.enrollMemberFrm.memberPwd(이부분이 password로 되어있어서 안되었음)
			// 닫기 버튼 되게 만듬
			close();
		});
	</script>
</body>
</html>





