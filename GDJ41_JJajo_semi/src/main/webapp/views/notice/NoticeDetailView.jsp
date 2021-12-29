<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="com.notice.model.vo.Notice,java.util.List"%>
<%
	List<Notice> nList= (List)request.getAttribute("noticeList");
%>


<section class="container">
	
	<div class="row ">
		<div class="col-xl-1"></div>
		<div class="col-xl-12">
				<div >
					<span style="margin:auto;">공지사항번호</span>
					<span>작성자</span>
					<h4>제목</h4>
					<span>작성일</span>
					<a href=""><img src="<%=request.getContextPath() %>/images/attfile.png" width="18px" height="18px"></a>
					<hr>
				</div>
				<div>
					<p>
						내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용
					</p>
				</div>
		</div>
		<div class="col-xl-1"></div>
	</div>
	  
</section>

<%@ include file="/views/common/footer.jsp"%>