package com.jj.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class AttachedFile {

	private int productNo;
	private int memberNo; 
	private String fileName;
	
	
}
