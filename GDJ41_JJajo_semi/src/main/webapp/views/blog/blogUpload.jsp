<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<link href="https://transloadit.edgly.net/releases/uppy/v1.6.0/uppy.min.css" rel="stylesheet">

<script src="https://unpkg.com/@yaireo/tagify"></script>
<script src="https://unpkg.com/@yaireo/tagify/dist/tagify.polyfills.min.js"></script>
<link href="https://unpkg.com/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css" />


<style>
	#imagePreview{
   width: 300px;
   height: 169px;
   border: 1px solid black;
   background-position: center;
   background-size: cover;
   }
   
     #drag-drop-area{
   	
   }
	
	.uppy-Dashboard-inner{
		min-height: 300px;
	}
</style>

<section>
	<div class="main">
	<h2>게시물 업로드</h2>
	<hr class="line_break">
		<div class="container">
			 <div class="row">
			    <div class="col-5">
					<div class="row" id="required">
			    		* 필수항목
			    	</div>	
			    	<div class="row" style="margin: 0; padding: 0;">
			    		<h4>사진등록</h4>
			    		<div class="col";">
			    			<input type="file" name="upfile" multiple>
			    		</div>
			    		<!-- 
			    			<div class="col-md" id="drag-drop-area">
		    		
		    				</div> -->
			    		
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
			    			<input class="form-control" id="post_tag" name="tag" data-role="tagsinput" type="text" placeholder="관련태그를 입력해주세요 (#으로 입력)" aria-label="default input example">
			    		</div>
			    	</div>			    	
			    </div>
			  </div>
		  </div>
		
		<div class="mb-3">
			<h4>내용</h4>
		  	<textarea class="form-control" id="post_description" name="content" rows="10" placeholder="내용을 입력해주세요" style="resize:none;"></textarea>
		</div>
		<input class="form-control" type="hidden" id="post_memberNo" name="memberNo" value="<%=loginMember.getMemberNo()%>">
		<hr class="line_break">
		<div id="upload_btn">
		<button type="button" class="btn btn-primary" id="upload">등록하기</button>
		</div>
	</div>
</section>



<script src="https://transloadit.edgly.net/releases/uppy/v1.6.0/uppy.min.js"></script>




<script>
	/* $("#target").click(e=>{
		$("input[name=upFile]").click();
	})
 */
 
	//The DOM element you wish to replace with Tagify
	 var input = document.querySelector('input[name=tag]');

	 // initialize Tagify on the above input node reference
	 new Tagify(input)

	//multifile upload
	$("#upload").click(e=>{
		const frm=new FormData();
		const fileInput=$("input[name=upfile]");
		const num = $("input[name=memberNo]").val(); 

		for(let i=0;i<fileInput[0].files.length;i++){
			
			frm.append("upfile"+i,fileInput[0].files[i]);

		}	 
		frm.append("memberNo", num);
		frm.append("title", $("#post_title").val());
		frm.append("tag", $("#post_tag").val());
		frm.append("content", $("#post_description").val());
		$.ajax({
			url:"<%=request.getContextPath()%>/blog/uploadpostend.do",
			type:"post",
			data:frm,
			processData:false,
			contentType:false,
			success:data=>{
				alert(data["msg"]);
				location.replace("<%=request.getContextPath()%>"+data["loc"]);
			}
		});
	
	});

	


	
	
	

</script>

<%@ include file="/views/common/footer.jsp"%>