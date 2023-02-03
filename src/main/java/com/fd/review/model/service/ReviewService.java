package com.fd.review.model.service;

import static com.fd.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.fd.common.model.vo.Attachment;
import com.fd.review.model.dao.ReviewDao;
import com.fd.review.model.vo.Review;

public class ReviewService {
	
	/** 리뷰리스트
	 * @author 빛나
	 * @return list (리뷰리스트에 필요한 데이터 리스트)
	 */
	public ArrayList<Review> selectReviewList() {
		
		Connection conn = getConnection();
		ArrayList<Review> list = new ReviewDao().selectReviewList(conn);
		close(conn);
		return list;
		
	}
	
	/** 리뷰쓰기 & 리뷰사진첨부
	 * @author 빛나
	 * @param r
	 * @param list
	 * @return result1 * result2
	 */
	public int insertReview(Review r, ArrayList<Attachment> list) {
		
		Connection conn = getConnection();
		
		int result1 = new ReviewDao().insertContentReview(conn, r);
		int result2 = new ReviewDao().insertAttachmentList(conn, list);
		
		if (result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1 * result2;
		
	}
	
	

}
