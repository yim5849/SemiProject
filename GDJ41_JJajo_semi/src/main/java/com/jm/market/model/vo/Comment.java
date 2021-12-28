package com.jm.market.model.vo;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Comment {
	 
	private String commentContent;
	private String commentDel;
	private Date enrollData;
	private int productNo;
	private int memberNo;
	private String CommentWriter;
	private String productTitle;

}
