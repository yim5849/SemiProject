package com.db.chatting;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.websocket.EncodeException;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.db.chatting.model.vo.Message;

@ServerEndpoint(value="/jjajo/chatting",
		encoders= {
				MessageEncoder.class
		},
		decoders= {
				MessageDecoder.class
		})
public class ChattingServer {
	private Map<Session,String> userList = new HashMap();
	
	
	@OnOpen
	public void open(Session session, EndpointConfig config) {
		System.out.println("클라이언트 접속");
		System.out.println(session.getId());
		
	}
	
	@OnMessage

	public void message(Session session, Message msg) {   //msg 지금 온거 
	
		if(msg.getSender().equals(msg.getReceiver())) {
			userList.put(session, msg.getMsg());
			sendMsgAll(session, new Message("server","",msg.getMsg()+"님이 입장하셨습니다."));
			return;
		}
		

		System.out.println(msg);
		if(msg.getReceiver().equals("ALL")) {
			sendMsgAll(session, msg);
		}else {
			Set<Session> keys = userList.keySet();
			
			Iterator<Session> it = keys.iterator();
			
			while(it.hasNext()) {
				Session keySession = it.next();
				String userId = userList.get(keySession);
				if(msg.getReceiver().equals(userId)) {
					try {
						keySession.getBasicRemote().sendObject(msg);						
					}catch(IOException|EncodeException e) {
						e.printStackTrace();
					}
				}
			}
			
			
			
		}
		
		
		
	}
	
	@OnClose
	public void close(Session session) {
		userList.remove(session);
	}
	
	private void sendMsgAll(Session session , Message msg) {
		Set<Session> keys = userList.keySet();
		System.out.println("send");
		for(Session s : keys) {
			if(!s.equals(session)) {
				try {
					s.getBasicRemote().sendObject(msg);					
				}catch(IOException|EncodeException e) {
					e.printStackTrace();
				}
			}
		}
		
	}
	
	
	
	
}
