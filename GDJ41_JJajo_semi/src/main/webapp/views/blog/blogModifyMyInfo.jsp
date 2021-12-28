<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

<section>
	<div class="main">
	
	<h2>자기소개 수정</h2>
		<hr class="line_break">
		<div class="mb-3">
		  <label for="exampleFormControlTextarea1" class="form-label">자기소개</label>
		  <textarea class="form-control" id="exampleFormControlTextarea1" name="myInfo" rows="8" placeholder="내용을 입력해주세요"></textarea>
		</div>
		<hr class="line_break">
		<div id="upload_btn">
			<button type="submit" class="btn btn-primary" id="myinfo_upload" <%--  onclick="location.assign('<%=request.getContextPath()%>/blog/uploadpost.do')" --%>>수정하기</button>
		</div>
	</div>
	<input type="hidden" name="memberNo" value="<%=loginMember.getMemberNo()%>">
</section>


<%@ include file="/views/common/footer.jsp"%>

<script>
	
	$("#myinfo_upload").click(e=>{
		const frm=new FormData();
		const num=$("input[name=memberNo]").val();
		
		frm.append("memberNo",num);
		frm.append("myInfo", $("#exampleFormControlTextarea1").val());
		
		$.ajax({
			url:"<%=request.getContextPath()%>/blog/myinfoend.do",
			type: "post",
			data: frm,
			processData:false,
			contentType:false,
			success:data=>{
				alert(data["msg"]);
				location.replace("<%=request.getContextPath()%>"+data["loc"]);
			}
		});
	});
	
	
	
	
</script>