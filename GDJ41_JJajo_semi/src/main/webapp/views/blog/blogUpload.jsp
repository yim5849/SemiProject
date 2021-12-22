<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

<section>
	<div class="main">
	<h2>게시물 업로드</h2>
	<hr class="line_break">
		<form action="<%=request.getContextPath() %>/blog/uploadpostend.do?memberNo=<%=loginMember.getMemberNo()%>"  method="post"
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
							  <input type="file" class="form-control" id="post_img_upload" name="image" accept="img/*" required multiple>
							</div>
							<h5>이미지 미리보기</h5>
							<div id="imagePreview">
								<img id="img" />
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

	
	
	
/* 	//이미지 미리보기 
	function readInputFile(e){
    var sel_files = [];
    
    sel_files = [];
    $('#imagePreview').empty();
    
    var files = e.target.files;
    var fileArr = Array.prototype.slice.call(files);
    var index = 0;
    
    fileArr.forEach(function(f){
    	if(!f.type.match("image/.*")){
        	alert("이미지 확장자만 업로드 가능합니다.");
            return;
        };
        if(files.length < 4){
        	sel_files.push(f);
            var reader = new FileReader();
            reader.onload = function(e){
            	var html = `<a id=img_id_${index}><img src=${e.target.result} data-file=${f.name} /></a>`;
                $('imagePreview').append(html);
                index++;
            };
            reader.readAsDataURL(f);
        }
    })
    if(files.length > 4){
    	alert("최대 3장까지 업로드 할 수 있습니다.");
    }
}

$('#post_img_upload').on('change',readInputFile); */

</script>

<%@ include file="/views/common/footer.jsp"%>