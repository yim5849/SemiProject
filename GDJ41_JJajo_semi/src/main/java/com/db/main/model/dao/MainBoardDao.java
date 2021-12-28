package com.db.main.model.dao;

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

import com.db.main.model.vo.AttachedFile;
import com.db.main.model.vo.MainBoard;
import com.jj.member.model.vo.Member;

public class MainBoardDao {
	private Properties prop = new Properties();
	
	public MainBoardDao() {
		String path = MainBoardDao.class.getResource("/sql/mainBoard/mainboardsql.properties").getPath();
		try {
			prop.load(new FileReader(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	
	public List<MainBoard> searchMainBoard(Connection conn, int curPosition, int numPerOnce) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<MainBoard> mbList = new ArrayList();
		String sql = prop.getProperty("searchMainBoard");
		String sql2 = prop.getProperty("searchAttachedFile");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (curPosition-1)*numPerOnce+1);
			pstmt.setInt(2, curPosition*numPerOnce);
			rs = pstmt.executeQuery();
			
			pstmt.clearParameters();
		
			while(rs.next()) {
				
				pstmt = conn.prepareStatement(sql2);
				
				String boardNo=rs.getString("board_no");
		
				pstmt.setString(1, boardNo);
				ResultSet rs2 = pstmt.executeQuery();
				
				List<AttachedFile> imgList = new ArrayList();
				
				
				while(rs2.next()) {
					AttachedFile file = AttachedFile.builder().imgNo(rs2.getString("image_no")).imgName(rs2.getString("filename")).build();
					imgList.add(file);
				}
				
				//AttachedFile af = new AttachedFile(noList, nameList);
				MainBoard mb = MainBoard.builder().boardNo(boardNo)		
									.boardTitle(rs.getString("board_title"))
									.boardContent(rs.getString("board_content"))
									.boardDate(rs.getDate("board_date"))
									.deleteYn(rs.getString("delete_yn"))
									.updateDate(rs.getDate("update_date"))
									.memberNo(rs.getString("member_no"))
									.memberName(rs.getString("member_name"))
									.attachedFileList(imgList)
									.build();
				close(rs2);
				mbList.add(mb);
				pstmt.clearParameters();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return mbList;
	}
	
	
	//JY
	public List<MainBoard> getUserBlog(Connection conn, String memberNo, int curPosition, int numPerOnce){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<MainBoard> ubList = new ArrayList<MainBoard>();
		String sql = prop.getProperty("searchMainBoard");
		String sql2 = prop.getProperty("searchAttachedFile");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (curPosition-1)*numPerOnce+1);
			pstmt.setInt(2, curPosition*numPerOnce);
			rs = pstmt.executeQuery();
			
			pstmt.clearParameters();
		
			while(rs.next()) {
				
				pstmt = conn.prepareStatement(sql2);
				
				String boardNo=rs.getString("board_no");
		
				pstmt.setString(1, boardNo);
				ResultSet rs2 = pstmt.executeQuery();
				
				List<AttachedFile> imgList = new ArrayList<AttachedFile>();
				
				
				while(rs2.next()) {
					AttachedFile file = AttachedFile.builder().imgNo(rs2.getString("image_no")).imgName(rs2.getString("filename")).build();
					imgList.add(file);
				}
				
				//AttachedFile af = new AttachedFile(noList, nameList);
				MainBoard mb = MainBoard.builder().boardNo(boardNo)		
									.boardTitle(rs.getString("board_title"))
									.boardContent(rs.getString("board_content"))
									.boardDate(rs.getDate("board_date"))
									.deleteYn(rs.getString("delete_yn"))
									.updateDate(rs.getDate("update_date"))
									.memberNo(rs.getString("member_no"))
									.tag(rs.getString("tag"))
									.memberName(rs.getString("member_name"))
									.attachedFileList(imgList)
									.build();
				close(rs2);
				
				if(mb.getMemberNo().equals(memberNo)) {
					ubList.add(mb);
				}
				
				pstmt.clearParameters();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}

		return ubList;
	}

	//게시물 제목, 내용, 멤버넘버
	public int insertBoard(Connection conn, MainBoard mb, String memberNo) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("insertBoard");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, mb.getBoardTitle());
			pstmt.setString(2, mb.getBoardContent());
			pstmt.setString(3,memberNo);
			pstmt.setString(4, mb.getTag());
			result=pstmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;	
	}
	
	//게시물에 boardNo 추가
	public String getBoardNo(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String boardNo=null;
		String sql=prop.getProperty("getBoardNo");
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) boardNo=rs.getString(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return boardNo;
	}
	
	
	
	
	//게시물에 사진추가
	public int insertImageFile(Connection conn, MainBoard mb, String boardNo) {//b_n 넘어오고
		PreparedStatement pstmt=null;
		int result2=0;
		String sql=prop.getProperty("insertImageFile");
		try {
			int length = mb.getAttachedFileList().size();
			int temp=0;
			for(int i=0; i<length;i++) {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1,boardNo);
				pstmt.setString(2,mb.getAttachedFileList().get(i).getImgNo());
				pstmt.setString(3,mb.getAttachedFileList().get(i).getImgName());
				result2=pstmt.executeUpdate();
				if(result2>0) {
					temp++;
				}
			}
			if(temp!=length) {
				return 0;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result2;
	}
	
	
	
	//자기소개 수정
	public int ModifyMyInfo(Connection conn,Member m) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("ModifyMyInfo");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, m.getMyInfo());
			pstmt.setInt(2, m.getMemberNo());	
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	

	
	//myInfo 가져오기
	public String getMyInfo(Connection conn,int memberNo1) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String m=null;
		
		String sql=prop.getProperty("getMyInfo");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo1);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m=rs.getString("my_info");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return m;
	}
	
	
	
	
	
	
	/*필요없어짐
	//게시물에 tag추가 **String version
	public int insertTag(Connection conn, MainBoard mb, String boardNo) {
		PreparedStatement pstmt=null;
		int result3=0;
		String sql=prop.getProperty("insertTag");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, boardNo);
			pstmt.setString(2, mb.getTag());
			result3=pstmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result3;	
	}
	*/
	
	
	
	
	//게시물에 태그추가**List<String> version
	/*public int insertTag(Connection conn, MainBoard mb, String boardNo) {
		PreparedStatement pstmt=null;
		int result3=0;
		String sql=prop.getProperty("insertTag");
		try {
			int length = mb.getTagList().size();
			int temp=0;
			for(int i=0; i<length;i++) {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, boardNo);

				pstmt.setString(2, mb.getTagList().get(i));
				result3=pstmt.executeUpdate();
				if(result3>0) {
					temp++;
				}else {
					return 0;
				}
			}if(temp!=length) {
				return 0;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result3;
	}*/
	
	
	
	
	
	/*
	if(result>0) {
		sql=prop.getProperty("insertImageFile");
		int length =mb.getAttachedFileList().size();
		int temp=0;
		for(int i=0; i<length;i++) {
		  	pstmt=conn.prepareStatement(sql);
		 	pstmt.setString(1,mb.getAttachedFileList().get(i).getImgNo());
		  	pstmt.setString(2,mb.getAttachedFileList().get(i).getImgName());
		  	result=pstmt.executeUpdate();
	  		if(result>0) {
	  	  		temp++;
	  		}
		}if(temp!=length) {
	  	 return 0;
		}
	  
	  //태그 
		sql=prop.getProperty("insertTag");
		length = mb.getTagList().size();
		temp=0;
		for(int i=0; i<length;i++) {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, mb.getTagList().get(i)); result=pstmt.executeUpdate();
			if(result>0) { 
				temp++; 
			} 
		}
		if(temp!=length) { 
			return 0; 
		}else {
			result=1;
		} 
	}else {
		result=0;
	}*/
	 
			

	

	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	

}
