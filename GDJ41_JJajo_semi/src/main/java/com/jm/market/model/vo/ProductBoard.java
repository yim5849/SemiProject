package com.jm.market.model.vo;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ProductBoard {	
	private int productNo;
	private String title;
	private String category;
	private String content;
	private int price;
	private String address;
	private Date enrollDate;
	private String isSale;
	private String isDelete;
	private int memberNo; 
	private String member_name;
	private List<AttachedFiles> fileName;
	
}
