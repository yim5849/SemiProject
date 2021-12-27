<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String memberId = (String)request.getAttribute("memberId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Insert title here</title>
<style>
	.myChatBox{
       display:flex;
       justify-content: flex-end;
       margin-right: 4px;
	   margin-bottom: 4px;
    }
	.myChatContent{
        
		text-align: left;
		background: #F7E600;
		border-radius: 10px 10px 10px 10px;
        max-width: 200px;
        padding: 3px 3px;
        
	}

    .chatBox{
		display: flex;
		flex-direction: column;
		justify-content: flex-start;
        margin-left: 4px;
		margin-bottom: 4px;
    }

	.chatContent{
		text-align: left;
        background-color: white;
        border-radius: 10px 10px 10px 10px;
        max-width: 200px;
        padding: 3px 3px;
	}
</style>
</head>
<body>
	<div style="display: flex;">
		<div id="chatRoot" style="width: 300px; height:500px;background-color:cornflowerblue; display: flex; flex-direction: column; justify-content: space-between;" >
			<div>
				<div id="msgContainer" style="width:300px; height: 450px;background-color: crimson; overflow: hidden;">
					<!-- <span>fdsfssdf</span> -->
				</div>
				<div id="inputBox" style="margin-bottom: 10px; margin-left: 10px;">
					<input type="hidden" id="sender" value="<%=memberId%>">
					<input type="hidden" id="receiver" value="ALL">
					<input type="text" id="msg" style="width: 230px;" placeholder="전송할 메시지 입력">
					<button type="button" id="sendMsg">전송</button>
				</div>
			</div>
		</div>
		<div id="navRoot" style="background-color: cadetblue; width:100px; height:500px">
			<button id="allChatBtn" type="button" class="btn btn-primary">전체대화방</button>
			<button id="whisperBtn">귓속말</button>
			<input type="text" id="whisperId" size="8">
			<div id="userList"></div>
		</div>
	</div>				

<script>
	let socket = new WebSocket("ws://localhost:9090<%=request.getContextPath()%>/jjajo/chatting");
	$("#allChatBtn").click(e=>{
		$("#receiver").val("ALL");
		
	
	});

	
	$("#whisperBtn").click(e=>{
		$("#sender").val("<%=memberId%>");
		$("#receiver").val($("#whisperId").val());
	});

	

	socket.onopen=e=>{
		console.log("소캣 서버연결성공");
		$("#msgContainer").append($("<p>전체 대화방 입장!!!</p>"));
		let sender = $("#sender").val();
		const enterMsg=new Message(sender, sender, sender);
		socket.send(JSON.stringify(enterMsg));
		
		
	}
	
	socket.onmessage=e=>{
		console.log("e :",e);

		console.log("e.data : ",e.data);

		const datas = JSON.parse(e.data);

		console.log(datas);
		
		const chatBox=$("<div>").addClass("chatBox").append($("<span>").html(datas["sender"])).append($("<div>").addClass("chatContent").html(datas["msg"]));
		if(datas["receiver"]=="<%=memberId%>"){
			chatBox.find("<span>").after($("<span>귓속말</span>"));
		}

		$("#msgContainer").append(chatBox);
		
		
	}

	socket.onclose=e=>{
		console.log("연결 끊어짐 ");
	}



	$("#sendMsg").click(e=>{
		sendMsg();
	})
	
	$("#msg").keydown(key=>{
		if(key.keyCode==13){
			sendMsg();
		}
	})

	function sendMsg(){
		const val=$("#msg").val();
		const sender=$("#sender").val();
		const receiver=$("#receiver").val();
	
		const msg=new Message(sender, receiver, val);
		socket.send(JSON.stringify(msg));
		console.log("send");
		const myChatBox = $("<div>").addClass("myChatBox").append($("<div>").addClass("myChatContent").html(val));
		$("#msgContainer").append(myChatBox);
	}

	
	function Message(sender, receiver, msg){
		this.sender=sender;
		this.receiver=receiver;
		this.msg=msg;
	}
	
	
</script>
	
</body>
</html>