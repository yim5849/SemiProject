<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
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
		<!-- 부트스트랩을 이용한 화면 구현을 함(jsp) -->
		<!-- 텍스트는 text align으로 맞추기 힘듬 -->
        <h2>회원가입</h2>
        <form name="enrollMemberFrm" action="<%=request.getContextPath() %>/member/enrollMemberEnd.do" method="post" onsubmit="return memberEnrollValidate();" >
        <div class="form-group">
        	<label for="memberId_">아이디</label>
        	<div class="idform" style="display:flex;"> 
        		<input class="form-control" type="text" placeholder="4글자이상" name="memberId" id="memberId_" style="margin-right:5%">
				<input class="btn btn-outline-info" type="button" value="중복검사" id="idDuplicateBtn">
			</div>		
        </div>
        <div class="form-group">
        	<label for="password_">패스워드</label>
        	<input class="form-control" type="password" name="memberPwd" id="password_" >
        	<label for="password_">패스워드확인</label>
        	<input class="form-control" type="password" id="password_2" ><br>
			<span id="pwresult"></span>
        </div>
        <div class="form-group">
        	<label for="userName">이름</label>
        	<input class="form-control" type="text"  name="memberName" id="userName" >
        </div>
		<div class="form-group">
        	<label for="email">이메일</label>
        	<input class="form-control" type="email" placeholder="abc@xyz.com" name="email" id="email">
        </div>	 
		<div class="form-group">
        	<label for="birthday">생년월일</label>
        	<input class="form-control" type="date" name="birthday" id="birthday">
        </div>
        <div class="form-group">
        	<label for="birthday">전화번호</label>
			<input class="form-control" type="tel" placeholder="(-없이)01012345678" name="phone" id="phone" maxlength="11" required>
		</div>	
		<div class="form-group">
        	<label for="address">주소</label>
			<input class="form-control" type="text" placeholder="" name="address" id="address">
		</div>
		<div class="form-group">	
			<label style="display:block">성별</label>
			<div class="form-check-inline">
	        	<label class="form-check-label">
	        		<input class="form-check-input" type="radio" name="gender" id="gender0" value="M" >
	        		<span>남</span>
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label">
					<input class="form-check-input" type="radio" name="gender" id="gender1" value="F">
					<span>여</span>
				</label>	
			</div>
		</div>
		
		<!-- 밑에 버튼 부분 -->
		<div class="form-group" style="display:flex;justify-content:right">	
			<input class="btn btn-outline-success" type="submit" value="회원가입" style="margin-right:15px">
			<input class="btn btn-outline-danger" type="reset" value="취소" onclick="history.go(-1)" >
		</div>	
			
        </form>
        <form name="idDuplicateFrm">
        	<input type="hidden" name="memberId">
        </form>
        
    </section>
    <script>
    	$(()=>{
    		$("#password_2").keyup(e=>{
    			if($(e.target).val().trim().length>3){
    				if($(e.target).val()==$("#password_").val()){
    					$("#pwresult").text("비밀번호가 일치합니다.").css({"color":"green"});
    				}else{
    					$("#pwresult").text("비밀번호가 불일치합니다.").css({"color":"red"});
    				}
    			}
    		});
    	});
    
    
    	const memberEnrollValidate=()=>{
    		const memberId=$("#memberId_").val().trim();//공백을 빼고 처리
    		if(userId.length<4){
    			alert("아이디는 4글자 이상입력하세요!");
    			$("#memberId_").focus();
    			return false;
    		}
    		const password=$("#password_").val().trim();
    		if(password.length<4){
    			alert("패스워드는 5글자 이상 입력하세요!");
    			$("#password_").focus();
    			return false;
    		}
    		
    	}
    
    	//아이디 중복확인하기
    	$(()=>{
    		$("#idDuplicateBtn").click(e=>{
    			const memberId=$("#memberId_").val().trim();
    			if(memberId.length>=4){
    				const url="<%=request.getContextPath()%>/member/idDuplicate.do";
    				const title="idDuplcate";
    				const style="width=300,height=200";
    				open("",title,style);
	   				console.log(idDuplicateFrm);//form태그
	   				console.log(idDuplicateFrm.memberId);//form내부 input
	   				idDuplicateFrm.memberId.value=memberId;
	   				idDuplicateFrm.action=url;
	   				idDuplicateFrm.method="post";
	   				idDuplicateFrm.target=title;
	   				
	   				idDuplicateFrm.submit();//form전송
	   				
	   				
    				
    			}else{
    				alert("아이디는 4글자 이상 작성해야합니다.");
    				$("#memberId_").focus();
    			}
    		});
    	});
    	
    	
    	
    </script>
    
    
    
    
    
    
    
    
    
    
<%@ include file="/views/common/footer.jsp"%>