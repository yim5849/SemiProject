<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
/* 오휴해결 */
/* 오휴해결 */
/* 오휴해결 */
/* 오휴해결 */
/* 오휴해결 */
   section>*{
		margin: 0px 300px 20px 300px;
	}

  select>div{
    display:inline;
  }
  

   .enrollTitle{
    font-size: 30px; 
  }
	  
	#inputPrice{
		width:300px;
	}
	
	#category{
	font-size:10px;
	}
	 
</style>

<section> 
	<%--  <form action='<%=request.getContextPath()%>/enrollProductEnd.do' method="post" enctype="multipart/form-data">  --%>
	      <div style="border-bottom: black solid 3px">
	       		 <label for="enrollTitle" class="enrollTitle">기본정보</label>
	      </div>
	      <br>
	      <div class="col-12">
		    	<label class="form-label" style="margin-right: 300px;">상품이미지</label>
		      	<img id="target" src="<%=request.getContextPath()%>/images/market/camera.png" width="100px" height="100px">
				<input type="file" name="upFile"  accept="image/*" multiple style="display:none">
				<span id="imageContainer"></span>
		  </div>	
			
	      <div class="col-12">
		      <label class="form-label">제목</label>
		      <input type="text" class="form-control" name="boardTitle" id="inputTitle" placeholder="상품제목을 입력해주세요.">
	      </div>
	      <br>
	      <div class="col-12" >
	     	  <label class="form-label">거래장소</label>
	     	  <input type="text" class="form-control" name="address" id="inputAddress" placeholder="원하는 거래장소를 입력해주세요.">
	      </div>
	      <br>
	      <div class="col-12">
	         <label class="form-label">가격</label>
	         <input style="display:inline-flex;" type="text" name="price" class="form-control" id="inputPrice" placeholder="숫자만 입력해주세요."> 
	         <span>원</span> 
	      </div>
	      <br>
	      <div id="select-category">
	          <label class="form-label" style="margin-right:30px">카테고리</label> 
	          <label><input type="radio" id="category" name="category" value="헬스의류" >헬스의류</label>
	          <label><input type="radio" id="category" name="category" value="헬스기구" >헬스기구</label>
	          <label><input type="radio" id="category" name="category" value="운동간식" >운동간식</label>
	          <label><input type="radio" id="category" name="category" value="기타용품" >기타용품</label>           
	      </div>
	      
	      <div class="col-12" style="border-bottom: black solid 3px">
	      	<label class="form-label">설명</label>
	      	<textarea rows="5" cols="100" id="boardContent" class="form-control" placeholder="상품 설명을 입력해주세요."></textarea>
	      	<br>
	      </div>
	       <br>
	      
	    <!-- 뒤로가기버튼 -->
		 <div>
		    <img id="target2" src="<%=request.getContextPath()%>/images/market/back-button.png" width="50px" height="50px">
		    <input type="button" name="back"  style="display:none;"  onclick="javascript:history.back();">
		 </div>
		 
		 <div>
		 	<input type="hidden" id="memberNo" value=<%=loginMember.getMemberNo()%>>

		 </div>
		<!-- 버튼 --> 
	    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
  			<!-- <input type="submit" class="btn btn-primary me-md-2" value="등록"> -->
  			<button id="upload" class="btn btn-primary me-md-2">등록</button> 	  			
  			<!-- <input type="reset" class="btn btn-primary me-md-2" value="취소"> --> 			
		</div>
		
		 	
<!--     </form> -->  
	
 
	 




</section>


<script>
	$("#target").click(e=>{
		$("input[name=upFile]").click();
	})


	$("#target2").click(e=>{
		$("input[name=back]").click();
	})

	
	
	$("input[name=upFile]").change(e=>{
		if(e.target.files[0].type.includes("image")){
			let reader=new FileReader();
			reader.onload=(e)=>{
				const img=$("<img>").attr({
					src:e.target.result,
					width:"100px",
					height:"100px"
				});
				$("#imageContainer").append(img); 
			}
			reader.readAsDataURL(e.target.files[0]);
		}	
		
	});
	
	//다중파일 업로드하기
 	$("#upload").click(e=>{
 		const frm=new FormData();
 		const fileInput=$("input[name=upFile]");
 		console.log(fileInput);
 		for(let i=0;i<fileInput[0].files.length;i++){
 			frm.append("upfile"+i,fileInput[0].files[i]);
 		}
 		frm.append("title",$("#inputTitle").val());
 		frm.append("address",$("#inputAddress").val());
 		frm.append("price",$("#inputPrice").val());
 		frm.append("category",$("#category").val());
 		frm.append("content",$("#boardContent").val());
 		frm.append("memberNo",$("#memberNo").val());
 		
 		$.ajax({
 			url:"<%=request.getContextPath()%>/enrollProductEnd.do",
 			type:"post",
 			data:frm,
 			processData:false,
 			contentType:false,
 			success:data=>{
 				alert("상품등록에 성공하였습니다");
 				location.replace("<%=request.getContextPath()%>/marketMainView.do");
 			}
 		})
 	})
	
 
	
	
	
	 
	
	
</script>



<%@ include file="/views/common/footer.jsp" %>