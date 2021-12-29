<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%
	Member m=(Member)request.getAttribute("member");
/* 서블릿이 보낸 데이터를 보내주는 모습, 밑에 include가 하고 있어서 import따로 안해도 됨 */

%>    
<%@ include file="/views/common/header.jsp"%>
<!-- 파일을 가져와야 하니까 -->
<style>
	section.container{
		display:flex;
		flex-direction:column;
		justify-content:center;
		align-items:center;
	}
	section.container>form{
		width:60%;
	}
	section.container>form>div[class^=form]{
		margin-bottom:5%;		
	}
	section.container div.form-group>label,label[class^="form"]>span{
		font-size:20px;
		font-weight:bolder;
	}
	.idform>input{
		display:inline-block;
	}
</style>
<section class="container">
		<!-- 텍스트는 text align으로 맞추기 힘듬 -->
        <h2>회원정보 수정</h2>
        <form id="memberFrm" method="post" >
        <div class="form-group">
        	<label for="memberId_">아이디</label>
        	<div class="idform" style="display:flex;"> 
        		<input class="form-control" type="text" value="<%=m.getMemberId()%>" placeholder="4글자이상" name="memberId" id="memberId_" style="margin-right:5%">
				<input class="btn btn-outline-info" type="button" value="중복검사" id="idDuplicateBtn">
      		</div>
        </div>
        <div class="form-group">
        	<label for="password_">패스워드</label>
        	<input class="form-control" type="password" name="memberPwd" id="password_" >
        											<!-- name 속성이 참 중요하다 -->
        	<label for="password_">패스워드확인</label>
        	<input class="form-control" type="password" id="password_2" ><br>
			<span id="pwresult"></span>
        </div>
        <div class="form-group">
        	<label for="userName">이름</label>
        	<input class="form-control" type="text"  name="memberName" id="userName" value="<%=m.getMemberName()%>">
        </div>
		<div class="form-group">
        	<label for="email">이메일</label>
        	<input class="form-control" type="email" placeholder="abc@xyz.com" name="email" id="email" value="<%=m.getEmail()%>">
        </div>	 
		<div class="form-group">
        	<label for="birthday">생년월일</label>
        	<input class="form-control" type="date" name="birthday" id="birthday" value="<%=m.getBirthday().split(" ")[0]%>">
        </div>
        <div class="form-group">
        	<label for="birthday">전화번호</label>
			<input class="form-control" type="tel" value="<%=m.getPhone()%>" placeholder="(-없이)01012345678" name="phone" id="phone" maxlength="11" required>
		</div>	
		<div class="form-group">
        	<label for="address">주소</label>
			<input class="form-control" type="text" value="<%=m.getAddress()%>"	 placeholder="" name="address" id="address" value="<%=m.getAddress()%>">
		</div>
		<div class="form-group">	
			<label style="display:block">성별</label>
			<div class="form-check-inline">
	        	<label class="form-check-label">
	        		<input class="form-check-input" type="radio" 
	        		<%=m.getGender().contains("M")?"checked":""%> name="gender" id="gender0" value="M" >
	        		<span>남</span>
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label">
					<input class="form-check-input" type="radio" 
					<%=m.getGender().contains("F")?"checked":""%> name="gender" id="gender1" value="F">
					<span>여</span>
				</label>	
			</div>
		</div>
			
			<!-- 밑에 버튼 부분들 -->
			<div class="form-group" style="display:flex; justify-content:center"> 
			<input class="btn btn-outline-info" type="button" value="정보수정" onclick="memberUpdate();" style="margin-right:15px"/>
			<!-- <input type="button" value="비밀번호 변경" onclick="passwordUpdate();"/> -->
			<input class="btn btn-outline-info"type="button" value="취소" onclick="history.go(-1)" style="margin-right:15px">
			<input class="btn btn-outline-danger" type="button" value="탈퇴" onclick="location.assign('<%=request.getContextPath()%>/member/memberDelete.do?memberId=<%=m.getMemberId()%>')" style="margin-right:15px">
		
		</form>
	</section>
	<script>
	// 회원 정보 수정 
	
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
			
		const passwordUpdate=()=>{
			const url="<%=request.getContextPath()%>/member/passwordUpdate.do?userId=<%=m.getMemberId()%>";
			const style="width=400,height=210,top=200,left=500";
			open(url,"_blank",style);			
			
		}
		
		// 회원 탈퇴
		const memberDelete=()=>{
			const url="<%=request.getContextPath()%>/member/memberDelete.do?memberId=<%=m.getMemberId()%>"
		}
	}
		
		
	</script>







<%@ include file="/views/common/footer.jsp"%>