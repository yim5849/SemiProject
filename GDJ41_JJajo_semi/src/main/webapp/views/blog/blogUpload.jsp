<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

<section>
	<div class="main">
	<h2>게시물 업로드</h2>
	<hr class="line_break">
		<form action="<%=request.getContextPath() %>/blog/uploadpostend.do" method="post"
	    enctype="multipart/form-data">
			<div class="container">
				 <div class="row">
				    <div class="col-5">
						<div class="row" id="required">
				    		* 필수항목
				    	</div>	
				    	<div class="row" style="margin: 0; padding: 0;">
				    		<h4>사진등록</h4>
				    		<div class="input-group mb-3">
							  <input type="file" class="form-control" id="post_img_upload" name="image">
							</div>
				    	</div>	
				    </div>
				    <div class="col-7">
				    	<div class="row">
				    		<div class="col-4">
				    			<h4>미리보기 제목</h4>
				    		</div>
				    		<div class="col-8" style="text-align: right;">
				    			<input class="form-control" id="post_title" name="title" type="text" placeholder="미리보기 제목을 입력해주세요" aria-label="default input example">
				    		</div>	
				    	</div>		
				    	<div class="row">
				    		<div class="col-4">
				    			<h4>태그</h4>
				    		</div>
				    		<div class="col-8" style="text-align: right;">
				    			<input class="form-control" id="post_tag" name="tag" type="text" placeholder="관련태그를 입력해주세요 (#으로 입력)" aria-label="default input example">
				    		</div>
				    	</div>			    	
				    </div>
				  </div>
			  </div>
			
			<div class="mb-3">
				<h4>내용</h4>
			  	<textarea class="form-control" id="post_description" name="content" rows="10" placeholder="내용을 입력해주세요" style="resize:none;"></textarea>
			</div>
			
			<hr class="line_break">
			<div id="upload_btn">
			<button type="button" class="btn btn-primary"  onclick="location.assign('<%=request.getContextPath()%>/blog/uploadpost.do')">등록하기</button>
			</div>
		</form>
	</div>
</section>

<script>
	$("#target").click(e=>{
		$("input[name=upFile]").click();
	})


</script>

<%@ include file="/views/common/footer.jsp"%>