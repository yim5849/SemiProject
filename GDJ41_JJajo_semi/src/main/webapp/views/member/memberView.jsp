<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%
	Member m=(Member)request.getAttribute("member");
	/* 서블릿이 보낸 데이터를 보내주는 모습, 밑에 include가 하고 있어서 import따로 안해도 됨 */

%>    
<%@ include file="/views/common/header.jsp"%>
<!-- 파일을 가져와야 하니까 -->
<section id=enroll-container>
		<h2>회원 정보 수정</h2>
		<form id="memberFrm" method="post" >
			<table>
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" name="memberId" id="memberId_" value="<%=m.getMemberId()%>" readonly>
			
					</td>
				</tr>	
				<tr>
					<th>이름</th>
					<td>	
					<input type="text"  name="memberName" id="memberName" required
					value="<%=m.getMemberName()%>"><br>
					</td>
				</tr>
				
				<tr>
					<th>이메일</th>
					<td>	
						<input type="email" placeholder="아이디@이메일" name="email" id="email"
						value="<%=m.getEmail()%>"><br>
					</td>
				</tr>
				<tr>
					<th>휴대폰</th>
					<td>	
						<input type="tel" placeholder="(-없이 11자리)01012345678" name="phone" id="phone" maxlength="11"
						value="<%=m.getPhone()%>"><br>
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>	
						<input type="text" placeholder="" name="address" id="address" 
						value="<%=m.getAddress()%>"><br>
					</td>
				</tr>
				<tr>
					<th>성별 </th>
					<td>
						<%if(m.getGender().equals("M")){ %>
							<input type="radio" name="gender" id="gender0" value="M" checked >
							<label for="gender0">남</label>
							<input type="radio" name="gender" id="gender1" value="F">
							<label for="gender1">여</label>
						<%}else{ %>
							<input type="radio" name="gender" id="gender0" value="M" >
							<label for="gender0">남</label>
							<input type="radio" name="gender" id="gender1" value="F" checked>
							<label for="gender1">여</label>
						<%} %>
					</td>
				</tr>
				
			</table>
			<input type="button" value="정보수정" onclick="memberUpdate();"/>
			<input type="button" value="비밀번호 변경" onclick="passwordUpdate();"/>
			<input type="button" value="탈퇴"/>
		</form>
	</section>
	<script>
		const passwordUpdate=()=>{
			const url="<%=request.getContextPath()%>/member/passwordUpdate.do?userId=<%=m.getMemberId()%>";
			const style="width=400,height=210,top=200,left=500";
			open(url,"_blank",style);			
			
		}
	
	
		const memberUpdate=()=>{
			//form전송하기
			const url="<%=request.getContextPath()%>/member/memberUpdate.do";
			$("#memberFrm").attr("action",url);
			const password=$("#password_").val().trim();
			if(password.length!=0){
				$("#memberFrm").submit();
			}else{
				alert("패스워드는 반드시 입력하셔야합니다.");
				$("#password_").focus();
			}
		}
		
		
	</script>







<%@ include file="/views/common/footer.jsp"%>