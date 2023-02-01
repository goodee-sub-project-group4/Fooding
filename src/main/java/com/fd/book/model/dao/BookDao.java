package com.fd.book.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import static com.fd.common.JDBCTemplate.*;

import com.fd.restaurant.model.vo.Restaurant;

public class BookDao {

	private Properties prop = new Properties();
	
	public BookDao() {
		try {
			prop.loadFromXML(new FileInputStream(BookDao.class.getResource("/db/sql/book-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public Restaurant selectRes(Connection conn, int resNo) {
		Restaurant re = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectRes");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, resNo);
			pstmt.setInt(2, resNo);
			pstmt.setInt(3, resNo);
			rset = pstmt.executeQuery();
	
			if(rset.next()) {
				re = new Restaurant(rset.getInt("res_no")
								  , rset.getString("res_name")
								  , rset.getString("ceo")
								  , rset.getString("permitNo")
								  , rset.getString("address")
								  , rset.getString("d_address")
								  , rset.getString("phone")
								  , rset.getString("parking")
								  , rset.getString("longtitude")
								  , rset.getString("latitude")
								  , rset.getString("r_img")
								  , rset.getString("open")
								  , rset.getString("close")
								  , rset.getString("break_s")
								  , rset.getString("break_e")
								  , rset.getString("food_ct")
								  , rset.getInt("review_count")
								  , rset.getDouble("review_avg"));
			}
			System.out.println(re);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
				
		return re;
	}

}
