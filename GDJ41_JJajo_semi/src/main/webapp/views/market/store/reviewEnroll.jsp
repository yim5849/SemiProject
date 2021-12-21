<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

<style>

	section{
		text-align: center;
		 
		margin: 50px 300px 20px 300px;
	}
	
 

</style>



<section>

		<h1>거래후기 등록하기</h1>
		<input type="text" value="boadr_title" readonly>
		<input type="text" value="user_id님의 판매글" readonly>
		
		<br><br>
		
	    <div class="col-12"> 
		     <textarea rows="5" cols="100" class="form-control" placeholder="user_id님과의 거래 후기를 남겨주세요 "></textarea>
	    <br>
	    </div>
	    
	    <div class="d-grid gap-2 col-6 mx-auto">
  			<button class="btn btn-primary" type="button">등록하기</button> 
		</div>
	    

</section>

<%@ include file="/views/common/footer.jsp" %>