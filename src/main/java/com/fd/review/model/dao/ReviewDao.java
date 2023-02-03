package com.fd.review.model.dao;

import static com.fd.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.fd.common.model.vo.Attachment;
import com.fd.review.model.vo.Review;

public class ReviewDao {
	
	// properties객체 생성
	private Properties prop = new Properties();
	
	public ReviewDao() {
		
		try {
			prop.loadFromXML(new FileInputStream(ReviewDao.class.getResource("/db/sql/review-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	/** 리뷰리스트
	 * @author 빛나
	 * @param conn
	 * @return list
	 */
	public ArrayList<Review> selectReviewList(Connection conn) {
		// select
		ArrayList<Review> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReviewList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Review(rset.getInt("review_no"),
						            rset.getString("res_name"),
						            rset.getString("review_content"),
						            rset.getDouble("star"),
						            rset.getString("create_date")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	/** 리뷰쓰기
	 * @author 빛나
	 * @param conn
	 * @param r (리뷰쓰기 데이터)
	 * @return result
	 */
	public int insertContentReview(Connection conn, Review r) {
		// insert
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertContentReview");
	
		try {
			pstmt = conn.prepareStatement(sql);
			// 업체명 담아야함
			pstmt.setString(1, r.getResNo());
			pstmt.setInt(2, r.getBookNo());
			pstmt.setInt(3, r.getUserNo());
			pstmt.setString(4, r.getReviewContent());
			pstmt.setDouble(5, r.getStar());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	/** 리뷰사진첨부
	 * @param conn
	 * @param list (사진첨부 데이터 넣은 리스트)
	 * @return result
	 */
	public int insertAttachmentList(Connection conn, ArrayList<Attachment> list) {
		// insert
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertAttachmentList");
		
		try {
			
			for(Attachment at : list) {
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, at.getOriginName());
				pstmt.setString(2, at.getChangeName());
				pstmt.setString(3, at.getFilePath());
				pstmt.setString(4, at.getBoardType());
				
				result = pstmt.executeUpdate();
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	
	
	
	
}
