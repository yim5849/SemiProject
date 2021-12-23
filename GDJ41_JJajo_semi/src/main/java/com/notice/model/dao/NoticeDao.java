package com.notice.model.dao;

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

import com.notice.model.vo.Notice;

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
				Notice n = Notice.builder().noticeNo(rs.getString("notice_no"))
										.noticeTitle(rs.getString("notice_title"))
										.noticeWriter(rs.getString("notice_writer"))
										.noticeContent(rs.getString("notice_content"))
										.noticeDate(rs.getDate("notice_date"))
										.filePath(rs.getString("filepath"))
										.readCount(rs.getString("readcount"))
										.build();
				
				list.add(n);
			
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		
		return list;
	}

	public int searchNoticeAllCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		int result=0;
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("searchNoticeAllCount"));
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result=rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}

	public Notice searchNoticeOne(Connection conn, String noticeNo) {
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		Notice notice = null;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("searchNoticeOne"));
			pstmt.setString(1, noticeNo);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				notice = Notice.builder().noticeNo(rs.getString("notice_no"))
						.noticeTitle(rs.getString("notice_title"))
						.noticeWriter(rs.getString("notice_writer"))
						.noticeContent(rs.getString("notice_content"))
						.noticeDate(rs.getDate("notice_date"))
						.filePath(rs.getString("filepath"))
						.readCount(rs.getString("readcount"))
						.build();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return notice;
	}

}



























