package com.db.find.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.jj.member.model.vo.Member;
import static com.jj.common.JDBCTemplate.close;

public class FindDao {
	Properties prop = new Properties();
	
	public FindDao() {
		String path = FindDao.class.getResource("/sql/find/findsql.properties").getPath();
		
		try {
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}

	public List<Member> findFollowing(Connection conn, String memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		List<Member> followList = new ArrayList();
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("findFollowing"));
			pstmt.setString(1, memberNo);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Member m=Member.builder()
						.memberNo(rs.getInt("member_no"))
						.memberId(rs.getString("member_id"))
						.memberName(rs.getString("member_name"))
						.birthday(rs.getString("birthday"))
						.gender(rs.getString("gender"))
						.email(rs.getString("email"))
						.address(rs.getString("address"))
						.filePath(rs.getString("filepath"))
						.myInfo(rs.getString("my_info"))
						.build();	
				followList.add(m);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return followList;
	}
	
	
	
	
	
}
