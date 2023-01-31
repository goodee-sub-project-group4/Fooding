package com.fd.review.model.service;

import static com.fd.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

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
	
	

}
