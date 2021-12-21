package com.db.main.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.db.main.model.vo.MainBoard;
import static com.jj.common.JDBCTemplate.close;

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
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (curPosition-1)*numPerOnce+1);
			pstmt.setInt(2, curPosition*numPerOnce);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MainBoard mb = MainBoard.builder().boardNo(rs.getString("board_no"))		
									.boardTitle(rs.getString("board_title"))
									.boardContent(rs.getString("board_content"))
									.boardDate(rs.getDate("board_date"))
									.deleteYn(rs.getString("delete_yn"))
									.updateDate(rs.getDate("update_date"))
									.memberNo(rs.getString("member_no"))
									.build();
				mbList.add(mb);
						
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
