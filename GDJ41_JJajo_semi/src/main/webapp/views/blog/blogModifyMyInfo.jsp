<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<section>
	<div class="main">
	<h2>자기소개 수정</h2>
		<hr class="line_break">
		
		<div class="mb-3">
		  <label for="exampleFormControlTextarea1" class="form-label">자기소개</label>
		  <textarea class="form-control" id="exampleFormControlTextarea1" rows="8" placeholder="내용을 입력해주세요"></textarea>
		</div>
		
		
		
		
		<hr class="line_break">
		<div id="upload_btn">
			<button type="button" class="btn btn-primary"  onclick="location.assign('<%=request.getContextPath()%>/blog/uploadpost.do')">수정하기</button>
		</div>
	</div>
</section>
<%@ include file="/views/common/footer.jsp"%>