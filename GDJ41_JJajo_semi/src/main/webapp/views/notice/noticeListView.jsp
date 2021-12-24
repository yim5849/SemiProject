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
		<div class="col-xl-12">
				
			<h3>&nbsp;공지사항</h1>
			
			<div id="listRoot" class="list-group">
				<% if(nList!=null&&nList.size()>0){
					for(Notice n : nList){ %>
						<div class="list-group-item list-group-item-action d-flex justify-content-between">
							<div>
								<span><%=n.getNoticeNo()%></span>
								<a href="javascript:fn_noticeDetail(<%=n.getNoticeNo() %>);" ><%=n.getNoticeTitle() %></a>
							</div>
							<div>
								<span>관리자</span>&nbsp;
							<%if(n.getFilePath()!=null&&n.getFilePath().length()>0){ %>
								<img src="<%=request.getContextPath() %>/images/attfile.png" width="18px" height="18px">
							<%} %>
								<span><%=n.getNoticeDate()%></span>
							</div>
						</div>
				<%
					}
				}else{
				%>
					공지사항없음
				<%} %>
			</div>
			<div id="pageBar" style="display:flex; justify-content:center;">
				<%=pageBar %>
			</div>
		</div>
		
	</div>
	
	  
</section>
	
<script>
	function fn_noticepage(pageNo,numPerPage){
		$.ajax({
			url:"<%=request.getContextPath()%>/notice/noticeListAjax.do",
			data:{pageNo:pageNo,numPerPage:numPerPage},
			success:data=>{
				console.log("도착");
				console.log(data);
				$("#listRoot").html("");
				let listData = data["list"];
				console.log(listData);
				for(let i=0; i<listData.length;i++){
					let listItem = $("<div>").addClass("list-group-item list-group-item-action d-flex justify-content-between");

					let firDiv = $("<div>").append($("<span>").html(listData[i]["noticeNo"])).append($("<a>").attr({href:"javascript:fn_noticeDetail("+listData[i]["noticeNo"]+");"}).html(listData[i]["noticeTitle"]));
					//let secDiv = $("<div>").append($("<span>").html("관리자")).append($("<img>").attr({src:"",width:"18px",height:"18px"})).append($("<span>").html("날짜"));
					let secDiv = $("<div>").append($("<span>").html("관리자"));

					if(!listData["filePath"]){
						let fileImg = $("<img>").attr({src:"<%=request.getContextPath() %>/images/attfile.png",width:"18px",height:"18px"});
						secDiv.append(fileImg);
					}
					secDiv.append($("<span>").html(listData[i]["noticeDate"]));
					listItem.append(firDiv).append(secDiv);
					$("#listRoot").append(listItem);
				}
				$("#pageBar").html("").html(data["pageBar"]);
				
				//$("#listRoot").html(data);
			}
		});
	}

	
	
	function fn_noticeDetail(noticeNo){
		$.ajax({
			url:"<%=request.getContextPath()%>/notice/noticeDetailAjax.do",
			data:{noticeNo:noticeNo},
			success:data=>{
				console.log(data);
				$("#listRoot").html("");

				let noticeBox = $("<div>");
				let noticeNo = $("<span>").html(data["noticeNo"]);
				let date =$("<span>").html(data["noticeDate"]);
				let title = $("<span>").html(data["noticeTitle"]);
				let content = $("<p>").html(data["noticeContent"]);
				let fileImg = $("<a>").attr({href:"<%=request.getContextPath() %>/notice/noticeFileDown.do?fileName="+data["filePath"]}).append($("<img>").attr({src:"<%=request.getContextPath() %>/images/attfile.png",width:"18px",height:"18px"}));
				let writer = $("<span>").html("관리자");
				let readCount = $("<span>").html("조회수 : "+ data["readCount"]);
				noticeBox.append(noticeNo).append(date).append(date).append(title).append(content).append(fileImg).append(writer).append(readCount);
				$("#listRoot").append(noticeBox);

			}

		});
	}

	





	
</script>
<%@ include file="/views/common/footer.jsp"%>