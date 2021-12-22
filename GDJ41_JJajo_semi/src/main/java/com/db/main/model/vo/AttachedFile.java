package com.db.main.model.vo;


import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor

public class AttachedFile {
	private List<String> imgNoList;
	private List<String> imgNameList;
	
	public AttachedFile() {
		
	}
	
}
