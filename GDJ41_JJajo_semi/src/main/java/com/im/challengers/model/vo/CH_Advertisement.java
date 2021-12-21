package com.im.challengers.model.vo;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class CH_Advertisement {

	private int advertisementNo;
	private String content;
	private String address;
	private String filepath;
	private Date enrollDate;
	
}
