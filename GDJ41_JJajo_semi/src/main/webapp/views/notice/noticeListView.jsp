<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="com.notice.model.vo.Notice,java.util.List"%>
<%
	List<Notice> nList= (List)request.getAttribute("noticeList");
	String pageBar = (String)request.getAttribute("pageBar");
%>


<section class="container">
	
	<div class="row ">
		<div class="col-xl-12 d-flex flex-column">
				
			<h3>공지사항</h1>
			
			<div id="listRoot" class="list-group">
				<% if(nList!=null&&nList.size()>0){
					for(Notice n : nList){ %>
					
					<a href="#" class="list-group-item list-group-item-action"><%=n.getNoticeTiltle() %></a>
				<%
					}
				}else{
				%>
					공지사항없음
				<%} %>
			</div>
			<div id="pageBar">
				<%=pageBar %>
			</div>
		</div>
		
	</div>
	
	  
</section>

<script>


	
</script>
<%@ include file="/views/common/footer.jsp"%>