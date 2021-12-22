package com.notice.model.vo;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Notice {
	private String noticeNo;
	private String noticeTiltle;
	private String noticeWriter;
	private String noticeContent;
	private Date noticeDate;
	private String filePath;
	private String readCount;
}
