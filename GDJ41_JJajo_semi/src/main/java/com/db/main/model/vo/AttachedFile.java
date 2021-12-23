package com.db.main.model.vo;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@AllArgsConstructor
@Builder
public class AttachedFile {
	private String imgNo;
	private String imgName;
	
	public AttachedFile() {
		
	}
	
}
