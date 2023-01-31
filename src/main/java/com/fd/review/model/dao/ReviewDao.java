package com.fd.review.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

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
						            rset.getInt("star"),
						            rset.getDate("create_date")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		
	}
	
	
	
	
	
}
