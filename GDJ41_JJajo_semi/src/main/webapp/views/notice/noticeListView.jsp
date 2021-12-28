<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="com.notice.model.vo.Notice,java.util.List"%>
<%
	List<Notice> nList= (List)request.getAttribute("noticeList");
	String pageBar = (String)request.getAttribute("pageBar");
%>


<section class="container" style="position: relative;">
	<% if(loginMember!=null&&loginMember.getMemberNo()==1){ %>
	<button type="button" onclick="writeNotice();" class="btn btn-primary position-absolute top-0 end-0" >글쓰기</button>
	<%} %>
	<div class="row ">
		<div class="col-xl-12">
				
			<h3>공지사항</h3>
			
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
	function submitWriteForm(){
		const frm = new FormData();
		const fileInput = $("input[name=fileInput]");

	
		for(let i=0; i<fileInput[0].files.length;i++){
			frm.append("upfile"+i, fileInput[0].files[i]);
		}
		

		

		frm.append("title",$("input[name=title]").val());
		frm.append("content",$("textarea[name=content]").val());
		
		
		$.ajax({
			url:"<%=request.getContextPath()%>/notice/noticeFileUpload.do",
			type:"post",
			data:frm,
			processData:false,
			contentType:false,
			success:data=>{
				
				console.log("입력 "+ data);
			}
		});
	}


	function writeNotice(){
		$("section>div.row>div").html("");
		$("section>div.row>div").append($("<h3>").html("공지사항입력"));
		let inputBox=$("<div>");
		
		


		let inputTitle = $("<input>").attr({type:"text",name:"title",placeholder:"제목",required:true});
		let inputContent = $("<textarea>").attr({rows:"5", cols:"47",name:"content",style:{resize:"none"}});
		let inputFile = $("<input>").attr({type:"file",name:"fileInput",multiple:true})
		let writeButton = $("<button>").attr({type:"button",onclick:"submitWriteForm();"}).html("입력");

		let table = $("<table>");
		let tr1 = $("<tr>");
		let titleTextTd = $("<td>").html("제목");
		let titleContentTd = $("<td>").append(inputTitle);
		tr1.append(titleTextTd).append(titleContentTd);
		
		let tr2=$("<tr>");
		let contentTextTd = $("<td>").html("내용");
		let contentContentTd = $("<td>").append(inputContent);
		tr2.append(contentTextTd).append(contentContentTd);

		let tr3=$("<tr>");
		let fileTextTd = $("<td>").html("첨부파일");
		let fileContentTdd = $("<td>").append(inputFile);
		tr3.append(fileTextTd).append(fileContentTdd);

		let btnTr = $("<tr>").append($("<td>")).append($("<td>").append(writeButton));
		table.append(tr1).append(tr2).append(tr3).append(btnTr);


		$("section>div.row>div").append(table);

	}

	function fn_noticepage(pageNo,numPerPage){
		$.ajax({
			url:"<%=request.getContextPath()%>/notice/noticeListAjax.do",
			data:{pageNo:pageNo,numPerPage:numPerPage},
			success:data=>{
			
				$("section>div.row>div").html("");

				let listGroup = $("<div>").attr({id:"listRoot",class:"list-group"});
				
				let listData = data["list"];
				for(let i=0; i<listData.length;i++){
					let listItem = $("<div>").addClass("list-group-item list-group-item-action d-flex justify-content-between");

					let firDiv = $("<div>").append($("<span>").html(listData[i]["noticeNo"])).append($("<a>").attr({href:"javascript:fn_noticeDetail("+listData[i]["noticeNo"]+");"}).html(listData[i]["noticeTitle"]));
					
					let secDiv = $("<div>").append($("<span>").html("관리자"));

					if(!listData["filePath"]){
						let fileImg = $("<img>").attr({src:"<%=request.getContextPath() %>/images/attfile.png",width:"18px",height:"18px"});
						secDiv.append(fileImg);
					}
					secDiv.append($("<span>").html(listData[i]["noticeDate"]));
					listItem.append(firDiv).append(secDiv);
					listGroup.append(listItem);
				}
				$("section>div.row>div").append($("<h3>").html("공지사항"));
				$("section>div.row>div").append(listGroup);
				
				$("section>div.row>div").append($("<div>").attr({id:"pageBar"}).css("display","flex").css("justify-content","center"));


				$("#pageBar").html("").html(data["pageBar"]);
				
			}
		});
	}

	
	
	function fn_noticeDetail(noticeNo){
		$.ajax({
			url:"<%=request.getContextPath()%>/notice/noticeDetailAjax.do",
			data:{noticeNo:noticeNo},
			success:data=>{
				$("section>div.row>div").html("").append($("<h4>").html("공지사항"));

				let noticeBox = $("<div>").addClass("card").css("width","100%");

				

				let noticeNo = $("<div>").html(data["noticeNo"]);

				
				let date =$("<span>").html(data["noticeDate"]);

				let div1 = $("<div>").addClass("card-header d-flex justify-content-between").append(noticeNo).append(date);

				let title = $("<span>").html(data["noticeTitle"]).addClass("card-title");

				let content = $("<p>").html(data["noticeContent"]).addClass("card-text");

				let fileImg = $("<a>").attr({href:"<%=request.getContextPath() %>/notice/noticeFileDown.do?fileName="+data["filePath"]}).append($("<img>").attr({src:"<%=request.getContextPath() %>/images/attfile.png",width:"18px",height:"18px"}));
				
				let div2 =$("<div>").addClass("card-body").append(title.append(fileImg)).append(content);
				
				
				
				let writer = $("<span>").html("관리자");
				let readCount = $("<span>").html("조회수 : "+ data["readCount"]);
				
				let div3 = $("<div>").addClass("card-footer d-flex justify-content-between").append(writer).append(readCount);
				
				
				noticeBox.append(div1).append(div2).append(div3);
				$("section>div.row>div").append(noticeBox);

			}

		});
	}


	





	
</script>
<%@ include file="/views/common/footer.jsp"%>