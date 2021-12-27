<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang&display=swap" rel="stylesheet">
<style>
	section>*{
			margin: 0px 300px 20px 300px;
	    	font-family: 'Gowun Batang', serif;
		}
	#myImage{
		height:100px;
		width:100px; 
	}
	
	.my-product{
  		height: 300px;
		margin-top: 0px;
 		 border: 2px solid black;
	}
	
	.btn btn-light{
		border:1px blue;
	}
	
 
	.card{
		margin:30px;
	}
</style>

 
	
	
<section> 
 
 	<div class="text-center">
	  <img src="https://img3.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202105/25/sbsnoriter/20210525064846663ctyu.jpg" id="myImage" class="rounded-circle">
	  <br>
	  <span>user_id</span> 
	</div>
	
	<br>
	
	<div class="btn-group" role="group" aria-label="Basic example" style="margin-left: 970px;">
	  <button type="button" class="btn btn-primary">블로그</button>
	  <button type="button" class="btn btn-primary" onclick=location.assign("<%=request.getContextPath()%>/buyList.do")>구매내역</button>
	</div>
	<br>
  
	
	
	<div class="btn-group" role="group" aria-label="Basic outlined example" style="margin-bottom:0px;">
  	<button type="button" class="btn btn-outline-primary" onclick=location.assign("<%=request.getContextPath()%>/myStore.do")>판매상품</button>
  	<button type="button" class="btn btn-outline-primary" onclick=location.assign("<%=request.getContextPath()%>/review.do")>후기</button> 
	</div>
 
  	<div class="my-product">
  	
  		 	<table class="product-table" style="margin:30px 0px 0px 30px;">
				<tr>
					<td>
					<img src="https://img3.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202105/25/sbsnoriter/20210525064846663ctyu.jpg" id="myImage" class="rounded-circle">
					</td>
					<td rowspan="2" width="900px" border="1" style="padding-left: 30px;" >
						<div>
							<p>내용</p>
						</div> 
						<div style="text-align-last: right;">
							<p>2021-12-20</p>
						</div>
					</td>
				</tr>
				<tr>
					<td>USER_NAME</td> 
				</tr>
 			</table> 
  	</div>
  	
  	<div>
		<img id="target2" src="<%=request.getContextPath()%>/images/market/back-button.png" width="50px" height="50px">
		<input type="button" name="back"  style="display:none;"  onclick="javascript:history.back();">
	</div>
	
	

</section>


<script> 
	$("#target2").click(e=>{
		$("input[name=back]").click();
	})
</script>


<%@ include file="/views/common/footer.jsp" %>