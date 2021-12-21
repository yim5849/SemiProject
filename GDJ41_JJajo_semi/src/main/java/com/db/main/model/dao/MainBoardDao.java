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

import org.apache.tomcat.dbcp.dbcp2.PStmtKey;

import com.db.main.model.vo.AttachedFile;
import com.db.main.model.vo.MainBoard;

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
				
				List<String> noList =new ArrayList();
				List<String> nameList = new ArrayList();
				while(rs2.next()) {
	
					noList.add(rs2.getString("image_no"));
					nameList.add(rs2.getString("filename"));
				}
				
				AttachedFile af = new AttachedFile(noList, nameList);
				MainBoard mb = MainBoard.builder().boardNo(boardNo)		
									.boardTitle(rs.getString("board_title"))
									.boardContent(rs.getString("board_content"))
									.boardDate(rs.getDate("board_date"))
									.deleteYn(rs.getString("delete_yn"))
									.updateDate(rs.getDate("update_date"))
									.memberNo(rs.getString("member_no"))
									.memberName(rs.getString("member_name"))
									.attachedFile(af)
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
	
	
	
	
	
	
	
	
	
	

}
