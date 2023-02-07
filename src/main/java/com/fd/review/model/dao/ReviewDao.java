package com.fd.review.model.dao;

import static com.fd.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.fd.book.model.vo.Book;
import com.fd.common.model.vo.Attachment;
import com.fd.review.model.vo.Review;
import com.fd.review.model.vo.ReviewDetailFileVo;
import com.fd.review.model.vo.ReviewDetailVo;

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
	public int insertContentReview(Connection conn, Book book, int bookNo, double star, String reviewContent) {
		// insert
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertContentReview");
	
		try {
			pstmt = conn.prepareStatement(sql);
			// 업체명 담아야함
			pstmt.setInt(1, book.getResNo());
			pstmt.setInt(2, bookNo);
			pstmt.setInt(3, book.getUserNo());
			pstmt.setString(4, reviewContent);
			pstmt.setDouble(5, star);
			
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
	
	/** 조회수증가
	 * @param conn
	 * @param reviewNo
	 * @return result
	 */
	public int increaseCount(Connection conn, int reviewNo) {
		// update => 처리된행수
	 	int result = 0;
	    PreparedStatement pstmt = null;
	    String sql = prop.getProperty("increaseCount");
	    
	    try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reviewNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
	    
	    return result;
	
	}
	
	/** 리뷰상세조회
	 * @param reviewNo
	 * @return
	 */
	public ReviewDetailVo selectContentReview(Connection conn, int reviewNo) {
		ReviewDetailVo detailVo = new ReviewDetailVo();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectContentReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reviewNo);
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				detailVo = new ReviewDetailVo(rset.getInt("REVIEW_NO")
											, rset.getString("RES_NO")
											, rset.getString("REVIEW_CONTENT")
											, rset.getString("STAR")
											, rset.getString("RES_NAME"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return detailVo;
	}
	
	
	/** 리뷰상세조회 파일첨부 가져오기
	 * @author 빛나
	 * @param conn
	 * @return list
	 */
	public ArrayList<ReviewDetailFileVo> selectContentReviewFiles(Connection conn, int reviewNo) {
		// select
		ArrayList<ReviewDetailFileVo> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectContentReviewFiles");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, reviewNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new ReviewDetailFileVo(rset.getInt("ref_bno")
									          , rset.getString("change_name")
									          , rset.getString("file_path")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}

	public Book selectBook(Connection conn, int bookNo) {
		Book book = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectBook");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bookNo);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				book = new Book();
				book.setResNo(rset.getInt("res_no"));
				book.setUserNo(rset.getInt("user_no"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return book;
	}
	
}
