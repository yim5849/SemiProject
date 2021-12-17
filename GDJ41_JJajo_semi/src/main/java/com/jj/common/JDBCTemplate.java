package com.jj.common;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class JDBCTemplate {
	
	// 경로 수정해야할 경우 경로를 수정할 것! getProperties로 가져오는 변수명도 properties에서 작성한 변수명과 일치하는지 확인하기!

	public static Connection getConnection() {
		Connection conn=null;
		String path=JDBCTemplate.class.getResource("/driver.properties").getPath();
		Properties prop=new Properties();
		try {
			prop.load(new FileReader(path));
			Class.forName(prop.getProperty("driver"));
			conn=DriverManager.getConnection(prop.getProperty("url"),
					prop.getProperty("userId"),prop.getProperty("pw"));
			conn.setAutoCommit(false);
		}catch(Exception e) {
			e.printStackTrace();
		}return conn;
	}
	
	public static void close(Connection conn) {
		try {
			if(conn!=null&&!conn.isClosed()) {
				conn.close();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	public static void close(Statement stmt) {
		try {
			if(stmt!=null && !stmt.isClosed()) {
				stmt.close();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(ResultSet rs) {
		try {
			if(rs!=null&&!rs.isClosed()) {
				rs.close();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void commit(Connection conn) {
		try {
			if(conn!=null&&!conn.isClosed()) {
				conn.commit();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void rollback(Connection conn) {
		try {
			if(conn!=null && !conn.isClosed()) {
				conn.close();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}

	
	
	
}
