package com.fd.customerService.model.dao;

import static com.fd.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.fd.admin.model.vo.Faq;
import com.fd.admin.model.vo.Notice;
import com.fd.admin.model.vo.Question;
import com.fd.common.model.vo.PageInfo;
import com.fd.customerService.model.vo.Attachment;

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
	
	/** 페이징 포함 FAQ 리스트 조회
	 * @param conn
	 * @return list
	 */
	public ArrayList<Faq> selectFAQList(Connection conn, PageInfo pi) {
		// select
		ArrayList<Faq> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectFAQList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
		    while(rset.next()) {
		    	list.add(new Faq(rset.getInt("faq_no"),
		    			         rset.getString("category"),
		    			         rset.getString("faq_title"),
		    			         rset.getString("faq_content")));
		    }
		    
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	/** FAQ 페이징
	 * @author 빛나
	 * @param conn
	 * @return listCount
	 */
	public int selectListCount(Connection conn) {
		// select
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	
	}
	
	/** 1:1문의(업체)리스트
	 * @return listR
	 */
	public ArrayList<Question> selectMemberQuestionListR(Connection conn) {
		// select
		ArrayList<Question> listR = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMemberQuestionListR");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				listR.add(new Question(rset.getInt("q_no"),
						               rset.getString("q_title"),
						               rset.getString("create_date"),
						               rset.getString("status")));
			} 
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listR;
		
	}
	
	/** 1:1문의(관리자)리스트
	 * @return
	 */
	public ArrayList<Question> selectMemberQuestionListA(Connection conn) {
		// select
		ArrayList<Question> listA = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMemberQuestionListA");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				listA.add(new Question(rset.getInt("q_no"),
						               rset.getString("q_title"),
						               rset.getString("create_date"),
						               rset.getString("status")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listA;

	}
	
	/** 1:1문의(관리자)글쓰기
	 * @param conn
	 * @param q
	 * @return result1
	 */
	public int insertQuestionAdmin(Connection conn, Question q) {
		// insert
		int result1 = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertQuestionAdmin");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, q.getCategory());
			pstmt.setString(2, q.getqTitle());
			pstmt.setString(3, q.getqContent());
			pstmt.setString(4, q.getqPerson());
			
			result1 = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result1;
		
	}
	
	/** 1:1문의(관리자)글쓰기 사진첨부
	 * @param conn
	 * @param at
	 * @return result2
	 */
	public int insertQuestionAttachment(Connection conn, Attachment at) {
		// insert
		int result2 = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertQuestionAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			
			
			result2 = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
	
		return result2;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
