package com.db.chatting.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class Message {
	private String sender;
	private String receiver;
	private String msg;
}
