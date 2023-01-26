package com.fd.common;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import com.fd.common.JDBCTemplate;

public class JDBCTemplate {
	
	/*
	public static void main(String[] args) {
		getConnection();
	}
	*/
	
public static Connection getConnection() {
		
		Connection conn = null;
		Properties prop = new Properties();
		
		String filePath = JDBCTemplate.class.getResource("/db/driver/driver.properties").getPath();
		
		try {
			prop.load(new FileInputStream(filePath));
			//System.out.println("파일 읽어들이기 완료");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		try {
			Class.forName(prop.getProperty("driver"));
			// db의 url, 계정명, 비밀번호 제시해서 Connection 생성
			conn = DriverManager.getConnection(prop.getProperty("url"),
					 						   prop.getProperty("username"),
					 						   prop.getProperty("password"));
			
			conn.setAutoCommit(false);
			//System.out.println("Connection 객체 생성 완료");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return conn;
		
	}
	
	public static void commit(Connection conn) {
		
		try {
			if(conn != null && !conn.isClosed()) {
				conn.commit();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void rollback(Connection conn) {
		try {
			if(conn != null && !conn.isClosed()) {
				conn.rollback();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(Connection conn) {
		try {
			if(conn != null && !conn.isClosed()) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(Statement stmt) {
		try {
			if(stmt != null && !stmt.isClosed()) {
				stmt.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(ResultSet rset) {
		try {
			if(rset != null && !rset.isClosed()) {
				rset.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
