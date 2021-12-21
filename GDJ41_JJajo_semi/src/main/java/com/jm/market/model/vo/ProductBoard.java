package com.jm.market.model.vo;

import java.util.Date;

import com.jj.member.model.vo.Member;

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
	private String Title;
	private String Category;
	private String content;
	private int price;
	private String address;
	private Date enrollDate;
	private String isSale;
	private String isDelete;
	private int memberNo; 
}
