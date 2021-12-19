<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<style> 

	 section>*{
		margin: 0px 300px 20px 300px;
	 }
	 
	 #myImage{
		height:100px;
		width:100px; 
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

	.wh-200{
		width:0px;
		height:200px;
	}
	
 
 
</style>

 	
<section>
	<div class="dropdown" >
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
 	
<form> 
 	<div class="container">
  		<div class="row" style="margin-left:200px">
  		  <div class="col" style="align-self: center; row:0px width:0px">
   			   <img src="<%=request.getContextPath()%>/images/market/leftArrow.png" height=50px class="rounded"  >
   		  </div>
		  <div class="col">
			  <img src="<%=request.getContextPath()%>/images/market/camera.png" height=150px class="rounded"  >
		  </div>
    	  <div class="col" style="align-self:center;"">
      		   <img src="<%=request.getContextPath()%>/images/market/rightArrow.png" height=50px class="rounded"  >
    	  </div>
  	  	</div>
	</div> 
 
	 
	<br><br>	
		
 	<table class="product-table" style="margin-left: 30px;">
		<tr>
			<td>
				<img src="https://img3.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202105/25/sbsnoriter/20210525064846663ctyu.jpg" id="myImage" class="rounded-circle">
			</td>
			<td rowspan="2" width="300px" border="1" style="padding-left: 30px;" >
				<div>
					<h3>타이틀</h3>
				</div>
				<div>
					<p>내용</p>
				</div>
				<div>
					거래장소
				</div> 
				<div>
					#카테고리
				</div>
			</td>
		</tr>
		<tr>
			<td>USER_NAME</td> 
		</tr>
 
 	</table>
 	
 		<br>
 	
 	
 	  <div class="col-12" style="border-bottom: black solid 3px"> 
	      	<textarea rows="5" cols="50" style="width:1100px;" class="form-control" ></textarea>
	      	<br>
	  </div>
	  <br>
 	  <div class="d-grid gap-2 d-md-flex justify-content-md-end">
  			<button class="btn btn-primary me-md-2" type="submit">채팅하기</button>	 
	  </div>
 	
 	
 	
 	
</form>



</section>

<%@ include file="/views/common/footer.jsp" %>