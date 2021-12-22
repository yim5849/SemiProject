<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.db.main.model.vo.MainBoard,java.util.List"%>
<%
List<MainBoard> mbList = (List) request.getAttribute("mainBoardList");
%>
<%
	if (mbList != null && mbList.size() > 0) {
		for (MainBoard mb : mbList) {
	%>
	<div class="mainbox">
		<%
		int idx = mb.getAttachedFile().getImgNoList().indexOf("1");
		
		if(idx>=0){
		%>
		<img src="<%=request.getContextPath() %>/upload/attachedimg/<%=mb.getAttachedFile().getImgNameList().get(idx) %>" width="100%" height="150px" />
		<%
		}
		%>
		<div>
			<span><strong><%=mb.getBoardTitle() %></strong></span><br> 
			<span>#태그#태그#태그#태그#태그</span>
			<div style="height: 100px;">
				<p><%=mb.getBoardContent() %></p>
			</div>
			<small>6일전</small>
			<small>17개의 댓글</small>
			<hr>
			<div class="d-flex justify-content-between">
				<div>
					<img src="" width="30px" height="30px">
					 <small>by</small> 
					 <span><%=mb.getMemberNo() %></span>
				</div>
				<div>
					<img src="images/heart.png" width="24px" height="24px"> <small>82</small>
				</div>
			</div>
		</div>
	</div>

	<%
	}

	} else {
	%>
	error!!!
	<%
	}
	%>   