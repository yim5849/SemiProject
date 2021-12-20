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
 	.wh-200{
		width:0px;
		height:200px;
	}
</style>

 	
<section>
	 
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
	  <div>
			<img id="target2" src="<%=request.getContextPath()%>/images/market/back-button.png" width="50px" height="50px">
			<input type="button" name="back"  style="display:none;"  onclick="javascript:history.back();">
	  </div>
 	  <div class="d-grid gap-2 d-md-flex justify-content-md-end">
  			<button class="btn btn-primary me-md-2" type="submit">채팅하기</button>	 
	  </div>
 	
	 
</form>
 
</section>


<script> 
	$("#target2").click(e=>{
		$("input[name=back]").click();
	})
</script>
 	

<%@ include file="/views/common/footer.jsp" %>