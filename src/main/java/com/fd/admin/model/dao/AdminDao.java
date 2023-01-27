package com.fd.admin.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;
import static com.fd.common.JDBCTemplate.*;

import com.fd.admin.model.vo.Notice;
import com.fd.member.model.vo.Member;


public class AdminDao {

	private Properties prop = new Properties();
	
	public AdminDao() {
		String filePath = AdminDao.class.getResource("/db/sql/admin-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}
		
	/**
	 * 관리자 로그인
	 * @param conn
	 * @param adminId
	 * @param adminPwd
	 * @return
	 */
	public Member loginAdmin(Connection conn, String adminId, String adminPwd) {
		// select문 => ResultSet객체 (한행) => Member객체
		Member a = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("loginAdmin");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, adminId);
			pstmt.setString(2, adminPwd);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				a = new Member(rset.getInt("user_no"),
							   rset.getString("user_id"),
							   rset.getString("user_pwd"),
							   rset.getString("user_name"),
							   rset.getString("status")
							  );
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return a;
	}

	/**회원 공지사항 목록 조회
	 * @param conn
	 * @return
	 */
	public ArrayList<Notice> selectNoticeListU(Connection conn) {
		// select문 => ResultSet(여러행)
		ArrayList<Notice> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectNoticeListU");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Notice(rset.getInt("notice_no"),
									rset.getString("notice_title"),
									rset.getString("user_name"),
									rset.getInt("count"),
									rset.getDate("create_date")));
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	
	
	
	
	
	
	
	
	
	
	
}