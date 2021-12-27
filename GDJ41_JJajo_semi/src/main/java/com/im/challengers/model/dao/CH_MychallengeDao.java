package com.im.challengers.model.dao;

import static com.jj.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.im.challengers.model.vo.CH_Challengers;
import com.im.challengers.model.vo.CH_Mychallenge;

public class CH_MychallengeDao {

	
	private Properties prop=new Properties();
	
	
	public CH_MychallengeDao() {
		
		String path=CH_MychallengeDao.class.getResource("/sql/challengers/mychallenge_sql.properties").getPath();
		try {
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
	/*=================== 챌린지 찾기(회원번호, 챌린져스 번호 사용)================= */		
	
	public List<CH_Mychallenge> searchChallenge(Connection conn, int memberNo, int challengersNo){
		
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		CH_Mychallenge my = null;
		
		List<CH_Mychallenge> list = new ArrayList();
		
		String sql = prop.getProperty("searchChallenge");
		
		try {
			
			pstmt=conn.prepareStatement(sql);
		
			pstmt.setInt(1, memberNo);
			pstmt.setInt(2, challengersNo);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				
				my=CH_Mychallenge.builder()
						.mychallengeNo(rs.getInt("MY_NO")).memberNo(rs.getInt("MEMBER_NO")).challengersNo(rs.getInt("CH_NO"))
						.count(rs.getInt("MY_COUNT")).enrolldate(rs.getDate("MY_ENROLLDATE")).enddate(rs.getDate("MY_ENDDATE"))
						.day1(rs.getString("MY_1DAY")).day2(rs.getString("MY_2DAY")).day3(rs.getString("MY_3DAY")).day4(rs.getString("MY_4DAY"))
						.day5(rs.getString("MY_5DAY")).day6(rs.getString("MY_6DAY")).day7(rs.getString("MY_7DAY")).day8(rs.getString("MY_8DAY"))
						.day9(rs.getString("MY_9DAY")).day10(rs.getString("MY_10DAY")).day11(rs.getString("MY_11DAY")).day12(rs.getString("MY_12DAY"))
						.day13(rs.getString("MY_13DAY")).day14(rs.getString("MY_14DAY")).day15(rs.getString("MY_15DAY")).day16(rs.getString("MY_16DAY"))
						.day17(rs.getString("MY_17DAY")).day18(rs.getString("MY_18DAY")).day19(rs.getString("MY_19DAY")).day20(rs.getString("MY_20DAY"))
						.day21(rs.getString("MY_21DAY")).day22(rs.getString("MY_22DAY")).day23(rs.getString("MY_23DAY")).day24(rs.getString("MY_24DAY"))
						.day25(rs.getString("MY_25DAY")).day26(rs.getString("MY_26DAY")).day27(rs.getString("MY_27DAY")).day28(rs.getString("MY_28DAY"))
						.checkdo(rs.getString("MY_CHECKDO")).build();
				
				list.add(my);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
		
	}
	
	
	
	
	/*=================== 챌린지 찾기(회원번호, 챌린져스 번호 사용) / 페이징 ================= */		
	
	public List<CH_Mychallenge> searchAllChallenge(Connection conn, int cPage, int numPerPage, int memberNo, int challengersNo){
		
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		CH_Mychallenge my = null;
		
		List<CH_Mychallenge> list = new ArrayList();
		
		String sql = prop.getProperty("searchAllChallenge");
		
		try {
			
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1, memberNo);
			pstmt.setInt(2, challengersNo);
			pstmt.setInt(3, (cPage-1)*numPerPage+1);
			pstmt.setInt(4, cPage*numPerPage);


			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				
				my=CH_Mychallenge.builder()
						.mychallengeNo(rs.getInt("MY_NO")).memberNo(rs.getInt("MEMBER_NO")).challengersNo(rs.getInt("CH_NO"))
						.count(rs.getInt("MY_COUNT")).enrolldate(rs.getDate("MY_ENROLLDATE")).enddate(rs.getDate("MY_ENDDATE"))
						.day1(rs.getString("MY_1DAY")).day2(rs.getString("MY_2DAY")).day3(rs.getString("MY_3DAY")).day4(rs.getString("MY_4DAY"))
						.day5(rs.getString("MY_5DAY")).day6(rs.getString("MY_6DAY")).day7(rs.getString("MY_7DAY")).day8(rs.getString("MY_8DAY"))
						.day9(rs.getString("MY_9DAY")).day10(rs.getString("MY_10DAY")).day11(rs.getString("MY_11DAY")).day12(rs.getString("MY_12DAY"))
						.day13(rs.getString("MY_13DAY")).day14(rs.getString("MY_14DAY")).day15(rs.getString("MY_15DAY")).day16(rs.getString("MY_16DAY"))
						.day17(rs.getString("MY_17DAY")).day18(rs.getString("MY_18DAY")).day19(rs.getString("MY_19DAY")).day20(rs.getString("MY_20DAY"))
						.day21(rs.getString("MY_21DAY")).day22(rs.getString("MY_22DAY")).day23(rs.getString("MY_23DAY")).day24(rs.getString("MY_24DAY"))
						.day25(rs.getString("MY_25DAY")).day26(rs.getString("MY_26DAY")).day27(rs.getString("MY_27DAY")).day28(rs.getString("MY_28DAY"))
						.checkdo(rs.getString("MY_CHECKDO")).build();

				list.add(my);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
		
	}
	
/*================================ 마이 챌린지 갯수 출력 ========================= */			
	
	public int searchAllChallengeCount(Connection conn, int memberNo, int challengersNo) {
		
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		int result=0;
		
		String sql = prop.getProperty("searchAllChallengeCount");
		
		try {
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			pstmt.setInt(2, challengersNo);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				result=rs.getInt(1);
			}
					
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
				
	}
	
	
/*=========================== 챌린지 찾기(회원번호 사용) ==================== */		
	
	public List<CH_Mychallenge> searchChallenge(Connection conn, int memberNo){
		
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		CH_Mychallenge my = null;
		
		List<CH_Mychallenge> list = new ArrayList();
		
		String sql = prop.getProperty("searchMemberChallenge");
		
		try {
			
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1, memberNo);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				
				my=CH_Mychallenge.builder().challengersNo(rs.getInt("CH_NO")).build();
				
				list.add(my);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
		
	}
	
/*======================= DropList에 담을 챌린지 찾기========================= */
	
	public List<CH_Challengers> searchChallengeListDrop(Connection conn, int memberNo){
		
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		CH_Challengers ch = null;
		
		 List<CH_Challengers> list = new ArrayList();
		
		String sql = prop.getProperty("searchChallengeListDrop");
		
		try {
			
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1, memberNo);
			
			rs=pstmt.executeQuery();
			
		while(rs.next()) {
				
				ch=CH_Challengers.builder().challengersNo(rs.getInt("CH_NO")).title(rs.getString("CH_TITLE")).build();
				
				list.add(ch);
			}
			System.out.println(list);
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
		
	}
		
/*============================= 마이 챌린지 등록 ========================== */

	public int startChallenge(Connection conn,int count,int memberNo,int challengersNo) {
		
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("startChallenge");
		
		try {
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			pstmt.setInt(2, challengersNo);
			pstmt.setInt(3, count);
			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
		
		
		
	}
	
	
/*============================= 챌린지 결과 등록 ========================== */
	
	public int challengeResultEnroll(Connection conn, String myDay, int count, int chNo, int memberNo, String result) {
		
		PreparedStatement pstmt=null;
		int end=0;
		String sql=prop.getProperty("challengeResultEnroll");
		sql=sql.replace("#COL", myDay);
		
		try {
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, result);
			pstmt.setInt(2, count);
			pstmt.setInt(3, chNo);
			pstmt.setInt(4, memberNo);
			end=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return end;
		
	}
	
	
/*=============================== 챌린지 완료 ============================*/
	
	public int finishChallenge(Connection conn, String check, int myNo) {
		
		PreparedStatement pstmt=null;
		int result=0;
		
		String sql=prop.getProperty("finishChallenge");
		
		try {
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, check);
			pstmt.setInt(2, myNo);
			
			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
		
		
	}
	
	
	
	
/*============================= 마이 챌린지 등록 ========================== */
/*============================= 마이 챌린지 등록 ========================== */
/*============================= 마이 챌린지 등록 ========================== */
	
	
	
}
