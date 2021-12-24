package com.im.challengers.model.vo;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class CH_MychallengeImage {

	private int ch_imgNo;
	private String imageOriginalFilename;
	private String imageRenamedFilename;
	private int challengersNo;
	private int memberNo;
	
}
