package com.im.challengers.model.vo;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class CH_Mychallenge {

	private int mychallengeNo;			// 마이 챌린지 번호 (PK)
	private int memberNo;					// 회원번호 (FK)
	private int challengersNo;				// 챌린져스 번호 (FK)
	private int count;							// 진행중인 회차수
	private Date enrolldate;					// 시작일
	private Date enddate;						// 종료일
	private String day1;							// 1일차 결과
	private String day2;						// 2일차 결과
	private String day3;						// 3일차 결과
	private String day4;						// 4일차 결과
	private String day5;						// 5일차 결과
	private String day6;						// 6일차 결과
	private String day7;						// 7일차 결과
	private String day8;						// 8일차 결과
	private String day9;						// 9일차 결과
	private String day10;						// 10일차 결과
	private String day11;						// 11일차 결과
	private String day12;						// 12일차 결과
	private String day13;						// 13일차 결과
	private String day14;						// 14일차 결과
	private String day15;						// 15일차 결과
	private String day16;						// 16일차 결과
	private String day17;						// 17일차 결과
	private String day18;						// 18일차 결과
	private String day19;						// 19일차 결과
	private String day20;						// 20일차 결과
	private String day21;						// 21일차 결과
	private String day22;						// 22일차 결과
	private String day23;						// 23일차 결과
	private String day24;						// 24일차 결과
	private String day25;						// 25일차 결과
	private String day26;						// 26일차 결과
	private String day27;						// 27일차 결과
	private String day28;						// 28일차 결과
	private String checkdo;					// 진행여부 체크
	
}
