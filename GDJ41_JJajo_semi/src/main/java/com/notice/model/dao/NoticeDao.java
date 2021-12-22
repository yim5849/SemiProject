package com.notice.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.notice.model.vo.Notice;
import static com.jj.common.JDBCTemplate.close;

public class NoticeDao {
	private Properties prop = new Properties();
	
	public NoticeDao() {
		String path = NoticeDao.class.getResource("/sql/notice/noticesql.properties").getPath();
		try {
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Notice> searchNoticeByPaging(Connection conn, int curPage, int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Notice> list = new ArrayList();
		try {
			pstmt = conn.prepareStatement(prop.getProperty("searchNoticeByPaging"));
			pstmt.setInt(1, (curPage-1)*numPerPage+1);
			pstmt.setInt(2, curPage*numPerPage);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		
		return null;
	}

}
