package com.fd.customerService.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.fd.admin.model.vo.Notice;

import static com.fd.common.JDBCTemplate.*;

public class MemberNoticeDao {
	
	// Properties 객체 생성
	private Properties prop = new Properties();
	
	public MemberNoticeDao() {
		try {
			prop.loadFromXML(new FileInputStream(MemberNoticeDao.class.getResource("/db/sql/customerService-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/** 공지사항 리스트
	 * @param conn
	 * @return list
	 */
	public ArrayList<Notice> selectMemberNoticeList(Connection conn) {
		// select
		ArrayList<Notice> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMemberNoticeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Notice(rset.getInt("notice_no"),
						            rset.getString("notice_title"),
						            rset.getString("user_id"),
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
	
	/** 조회수
	 * @param conn
	 * @param noticeNo
	 * @return result (유효한 공지사항인지 1 또는 0)
	 */
	public int increaseCount(Connection conn, int noticeNo) {
		// update
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, noticeNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	/** 공지사항 리스트 상세조회
	 * @author 빛나
	 * @param conn
	 * @param noticeNo
	 * @return n
	 */
	public Notice selectMemberNoticeDetail(Connection conn, int noticeNo) {
		// select
		Notice n = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMemberNoticeDetail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, noticeNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				n = new Notice(rset.getInt("notice_no"),
						       rset.getString("notice_title"),
						       rset.getString("notice_content"),
						       rset.getString("user_id"),
						       rset.getDate("create_date"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return n;
		
	}
	
	
	
	
	
	
	
	
	

}
