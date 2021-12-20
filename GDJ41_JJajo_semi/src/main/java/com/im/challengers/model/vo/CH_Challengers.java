package com.im.challengers.model.vo;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class CH_Challengers {

	private int challengersNo;
	private String title;
	private String content;
	private String filepath;
	private Date enrolldate;
		
}
