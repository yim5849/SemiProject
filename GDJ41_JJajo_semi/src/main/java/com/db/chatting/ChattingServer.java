package com.db.chatting;

import java.io.IOException;
import java.util.Collections;
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

import lombok.Synchronized;

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
	

		System.out.println(msg);
		if(msg.getReceiver().equals("ALL")) {
			Set<Session> clients = session.getOpenSessions();
			
			for(Session client : clients) {
				if(!client.equals(session)) {
					try {
						client.getBasicRemote().sendObject(msg);
					}catch(IOException|EncodeException e) {
						e.printStackTrace();
					}
					
				}
					
			}
			
		
		}else {
			
			
		}
		
		
		
	}
	
	@OnClose
	public void close(Session session) {
		userList.remove(session);
	}
	
	
	
	
	
	
}
