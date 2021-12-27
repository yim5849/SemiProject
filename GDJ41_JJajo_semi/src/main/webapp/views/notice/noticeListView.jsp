<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="com.notice.model.vo.Notice,java.util.List"%>
<%
	List<Notice> nList= (List)request.getAttribute("noticeList");
	String pageBar = (String)request.getAttribute("pageBar");
%>
<style>
	.margin-10{
		margin-left: 10px;
	}
	.margin-30{
		margin-left: 30px;
		text-decoration: none;
		color: black;
	}
	.rightbox{
		width: 200px;
	}

</style>

<section class="container">
	
	<div class="row">
		<div class="col-xl-12 d-flex justify-content-between">
			<h3>공지사항</h3>
			<% if(loginMember!=null&&loginMember.getMemberNo()==1){ %>
			<button type="button" onclick="writeNotice();" class="btn btn-primary" >글쓰기</button>
			<%}else{ %>
				<span></span>
			<%}%>
		</div>
	</div>
	
	<div class="row ">
		<div class="col-xl-12">
				
		
			
			<div id="listRoot" class="list-group">
				<% if(nList!=null&&nList.size()>0){
					for(Notice n : nList){ %>
						<div class="list-group-item list-group-item-action d-flex justify-content-between">
							<div>
								<span class="margin-10"><%=n.getNoticeNo()%></span>
								<a href="javascript:fn_noticeDetail(<%=n.getNoticeNo() %>);" class="margin-30" ><%=n.getNoticeTitle() %></a>
							</div>
							<div class="rightbox d-flex justify-content-between">
								<span>관리자</span>&nbsp;
							<%if(n.getFilePath()!=null&&n.getFilePath().length()>0){ %>
								<img src="<%=request.getContextPath() %>/images/attfile.png" width="18px" height="18px">
							<%}else{ %>
								<span></span>
								<% }%>
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
				location.replace("<%=request.getContextPath()%>/notice/noticeList.do");
			}
		});
	}


	function writeNotice(){
		//$(".container>button").css({display:"none"});
		$("section>div.row>div").html("");
		
		$("section>div.row:last>div").append($("<h3>").html("공지사항입력"));
		let inputBox=$("<div>");
		
		let inputTitle = $("<input>").addClass("form-control form-control-lg").attr({type:"text",name:"title",placeholder:"제목",required:true});
		let inputContent = $("<textarea>").addClass("form-control").attr({rows:"5", cols:"47",name:"content",style:{resize:"none",height:"200px"}});
		let inputFile = $("<input>").addClass("form-control").attr({type:"file",name:"fileInput",multiple:true})
		let writeButton = $("<button>").css("float","right").addClass("btn btn-primary").attr({type:"button",onclick:"submitWriteForm();"}).html("입력");

		let table = $("<table>").css("margin","auto");
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


		$("section>div.row:last>div").append(table);

	}

	function fn_noticepage(pageNo,numPerPage){
		$.ajax({
			url:"<%=request.getContextPath()%>/notice/noticeListAjax.do",
			data:{pageNo:pageNo,numPerPage:numPerPage},
			success:data=>{
			
				$("section>div.row:last>div").html("");

				let listGroup = $("<div>").attr({id:"listRoot",class:"list-group"});
				
				let listData = data["list"];
				for(let i=0; i<listData.length;i++){
					let listItem = $("<div>").addClass("list-group-item list-group-item-action d-flex justify-content-between");

					let firDiv = $("<div>").append($("<span>").addClass("margin-10").html(listData[i]["noticeNo"])).append($("<a>").addClass("margin-30").attr({href:"javascript:fn_noticeDetail("+listData[i]["noticeNo"]+");"}).html(listData[i]["noticeTitle"]));
					
					let secDiv = $("<div>").addClass("rightbox d-flex justify-content-between").append($("<span>").html("관리자"));

					if(!listData["filePath"]){
						secDiv.append($("<span>"));
					}else{
						let fileImg = $("<img>").attr({src:"<%=request.getContextPath() %>/images/attfile.png",width:"18px",height:"18px"});
						secDiv.append(fileImg);
						
					}
					secDiv.append($("<span>").html(listData[i]["noticeDate"]));
					listItem.append(firDiv).append(secDiv);
					listGroup.append(listItem);
				}
				//$("section>div.row:last>div").append($("<h3>").html("공지사항"));
				$("section>div.row:last>div").append(listGroup);
				
				$("section>div.row:last>div").append($("<div>").attr({id:"pageBar"}).css("display","flex").css("justify-content","center"));


				$("#pageBar").html("").html(data["pageBar"]);
				
			}
		});
	}

	
	
	function fn_noticeDetail(noticeNo){
		$.ajax({
			url:"<%=request.getContextPath()%>/notice/noticeDetailAjax.do",
			data:{noticeNo:noticeNo},
			success:data=>{
				$("section>div.row:last>div").html("");//.append($("<h4>").html("공지사항"));

				let noticeBox = $("<div>").addClass("card").css("width","100%");

				

				let noticeNo = $("<div>").html(data["noticeNo"]);

				
				let date =$("<span>").html(data["noticeDate"]);

				let div1 = $("<div>").addClass("card-header d-flex justify-content-between").append(noticeNo).append(date);

				let title = $("<span>").html(data["noticeTitle"]).addClass("card-title");

				title.after($("<hr>"));

				let content = $("<p>").css({"height":"300px","margin-top":"30px"}).html(data["noticeContent"]).addClass("card-text");

				let fileImg = $("<a>").attr({href:"<%=request.getContextPath() %>/notice/noticeFileDown.do?fileName="+data["filePath"]}).append($("<img>").attr({src:"<%=request.getContextPath() %>/images/attfile.png" ,width:"18px",height:"18px", style:"margin-left:10px"}));
				
				let div2 =$("<div>").addClass("card-body").append(title.append(fileImg)).append(content);
				
				
				
				let writer = $("<span>").html("관리자");
				let readCount = $("<span>").html("조회수 : "+ data["readCount"]);
				
				let div3 = $("<div>").addClass("card-footer d-flex justify-content-between").append(writer).append(readCount);
				
				
				noticeBox.append(div1).append(div2).append(div3);
				$("section>div.row:last>div").append(noticeBox);

			}

		});
	}


	





	
</script>
<%@ include file="/views/common/footer.jsp"%>