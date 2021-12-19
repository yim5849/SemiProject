<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>

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

   .dropdown{
		margin:0px;
	} 
	
	.dropdown-toggle{
		background-color: #FBFBEF;
		font-size: 20px;
		margin-left: 200px;
		color: black;
		border: 0;	
	}
	
	.dropdown-toggle:hover{
		background-color: tan;
			
	} 

 
</style>

<section>

	<div class="dropdown">
	  <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
	    CATEGORY
	  </a>
	   <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
	    <li><a class="dropdown-item" href="<%=request.getContextPath()%>/marketMainView.do">HOME</a></li>
	    <li><a class="dropdown-item" href="#">헬스의류</a></li>
	    <li><a class="dropdown-item" href="#">헬스기구</a></li>
	    <li><a class="dropdown-item" href="#">운동간식</a></li>
	    <li><a class="dropdown-item" href="#">기타</a></li>
	  </ul>
 	</div>

	<br>
 
	    <form> 
	      <div style="border-bottom: black solid 3px">
	       		 <label for="enrollTitle" class="enrollTitle">기본정보</label>
	      </div>
	      <br>
	      <div class="col-12">
		    	<label class="form-label" style="margin-right: 400px;">상품이미지</label>
		      	<img id="target" src="<%=request.getContextPath()%>/images/market/camera.png" width="100px" height="100px">
				<input type="file" name="upFile"  accept="image/*" style="display:none">
		  </div>	
			
	      <div class="col-12">
		      <label class="form-label">제목</label>
		      <input type="text" class="form-control" id="inputTitle" placeholder="상품제목을 입력해주세요.">
	      </div>
	      <br>
	      <div class="col-12" >
	      <label class="form-label">거래장소</label>
	      <input type="text" class="form-control" id="inputAddress" placeholder="원하는 거래장소를 입력해주세요.">
	      </div>
	      <br>
	      <div class="col-12">
	        <label class="form-label">가격</label>
	        <input style="display:inline-flex;" type="text" class="form-control" id="inputPrice" placeholder="숫자만 입력해주세요."> 
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
	      	<textarea rows="5" cols="100" class="form-control" placeholder="상품 설명을 입력해주세요."></textarea>
	      	<br>
	      </div>
	      
	      
	      <br>
	        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
  				<button class="btn btn-primary me-md-2" type="submit">등록</button>
  				<button class="btn btn-primary" type="reset">취소</button>
			</div>
	    </form>  
	
 
	




</section>


<script>
	$("#target").click(e=>{
		$("input[name=upFile]").click();
	})


</script>



<%@ include file="/views/common/footer.jsp" %>