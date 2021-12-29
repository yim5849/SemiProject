package com.jj.member.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Member {

		private int memberNo;
		private String memberId;
		private String memberPwd;
		private String memberName;
		private String gender;
		private String birthday;
		private String email;
		private String phone;
		private String address;
		private String filePath;
		private Date enrollDate;
		private String myInfo;
}

