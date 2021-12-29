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

	.message{
		width: 100%;
    	display: flex;
    	margin-bottom: 15px;
    	
	}

	.message_own{
		width: 100%;
    	display: flex;
    	margin-bottom: 15px;
		justify-content: flex-end;
	}


	.myChatBox{
       display:flex;
       justify-content: flex-end;
       margin-right: 4px;
	  
    }
	.myChatContent{
		background-color: #F7E600;
		font-size: 14px;
		border-radius: 10px;
		border-top-right-radius: 0px;
		padding: 8px 13px;
		
	}

    .chatBox{
		display: flex;
		flex-direction: column;
		justify-content: left;
		margin-left: 5px;
    }

	.chatContent{
		background-color: white;
		font-size: 14px;
    	border-radius: 10px;
   		 border-top-left-radius: 0px;

    	padding: 8px 13px;
    	margin-right: 5px;
	}

	.chat__timestamp {
		color: white;
		background-color: #92a4b2;
		padding: 10px;
		font-size: 14px;
		border-radius: 25px;
		margin-bottom: 25px;
		
	}
</style>
</head>
<body>
	<div style="display: flex;">
		<div id="chatRoot" style="width: 300px; height:500px;background-color:white; display: flex; flex-direction: column; justify-content: space-between;" >
			<div>
				<div id="msgContainer" style="width:300px; height: 450px; background-color: #abc1d1; overflow: scroll; display:flex; flex-direction: column; align-items: center;">
					
				</div>
				<div id="inputBox" style="margin-bottom: 10px; margin-left: 10px;">
					<input type="hidden" id="sender" value="<%=memberId%>">
					<input type="hidden" id="receiver" value="ALL">
					<div class="reply__column">
						<input type="text" id="msg" style="width: 230px;" placeholder="메시지">
						<button id="sendMsg">
						  <i class="fas fa-arrow-up" aria-hidden="true"></i>
						</button>
					  </div>
				</div>
				
			</div>
		</div>
		
	</div>				
	<script src="https://kit.fontawesome.com/6478f529f2.js" ;="" crossorigin="anonymous"></script>
<script>
	let socket = new WebSocket("ws://61.78.121.242:9999<%=request.getContextPath()%>/jjajo/chatting");
	$("#allChatBtn").click(e=>{
		$("#receiver").val("ALL");
		
	
	});

	
	$("#whisperBtn").click(e=>{
		$("#sender").val("<%=memberId%>");
		$("#receiver").val($("#whisperId").val());
	});

	

	socket.onopen=e=>{
		console.log("소캣 서버연결성공");
		$("#msgContainer").append($("<span>전체 대화방 입장!!!</span>").addClass("chat__timestamp"));
		let sender = $("#sender").val();
		const enterMsg=new Message(sender, sender, sender);
		socket.send(JSON.stringify(enterMsg));
		
		
	}
	
	socket.onmessage=e=>{
		const datas = JSON.parse(e.data);
		let chatBox;
		if(datas['sender']=='SERVER'){
			chatBox=$("<span>").addClass("chat__timestamp").html(datas["msg"]);
		}else{
			chatBox=$("<div>").addClass("message").append($("<div>").addClass("chatBox").append($("<span>").html(datas["sender"])).append($("<span>").addClass("chatContent").html(datas["msg"])));
		}

		$("#msgContainer").append(chatBox);
		$("#msgContainer").animate({
			scrollTop:$("#msgContainer").get(0).scrollHeight
		},100);
	}

	socket.onclose=e=>{
		console.log("연결 끊어짐 ");
	}



	$("#sendMsg").click(e=>{
		if(!$("#msg").val())return;
		sendMsg();
		$("#msg").val("");
	})
	
	$("#msg").keydown(key=>{
		if(!$("#msg").val())return;
		if(key.keyCode==13){
			sendMsg();
			$("#msg").val("");
		}
	})

	function sendMsg(){
		const val=$("#msg").val();
		const sender=$("#sender").val();
		const receiver=$("#receiver").val();
	
		const msg=new Message(sender, receiver, val);
		socket.send(JSON.stringify(msg));
		console.log("send");
		const myChatBox = $("<div>").addClass("message_own").append($("<div>").addClass("myChatBox").append($("<span>").addClass("myChatContent").html(val)));
		$("#msgContainer").append(myChatBox);
		$("#msgContainer").animate({
			scrollTop:$("#msgContainer").get(0).scrollHeight
		},100);
	}

	
	function Message(sender, receiver, msg){
		this.sender=sender;
		this.receiver=receiver;
		this.msg=msg;
	}
	
	
</script>
	
</body>
</html>