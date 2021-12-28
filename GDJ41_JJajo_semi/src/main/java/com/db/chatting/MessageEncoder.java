package com.db.chatting;

import javax.websocket.EncodeException;
import javax.websocket.Encoder.Text;
import javax.websocket.EndpointConfig;

import com.db.chatting.model.vo.Message;
import com.google.gson.Gson;

public class MessageEncoder implements Text<Message>{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void init(EndpointConfig arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String encode(Message arg0) throws EncodeException {
		
		return new Gson().toJson(arg0);
	}
	

}
