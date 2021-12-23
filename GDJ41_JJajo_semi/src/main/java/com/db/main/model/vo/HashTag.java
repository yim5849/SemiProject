package com.db.main.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@AllArgsConstructor
@Builder
public class HashTag {
	private String tagContent;
	
	public HashTag() {
		
	}
	
	
}
