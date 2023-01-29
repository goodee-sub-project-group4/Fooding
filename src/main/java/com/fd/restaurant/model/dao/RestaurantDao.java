package com.fd.restaurant.model.dao;

import static com.fd.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.fd.restaurant.model.vo.Restaurant;

public class RestaurantDao {
	
	private Properties prop = new Properties();
	
	public RestaurantDao() {
		String filePath = RestaurantDao.class.getResource("/db/sql/restaurant-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public Restaurant loginRest(Connection conn, int restNo, String userPwd) {
		Restaurant r = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("loginRest");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, restNo);
			pstmt.setString(2, userPwd);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				r= new Restaurant(rset.getInt("res_no")
								, rset.getString("res_name")
								, rset.getString("ceo")
								, rset.getString("permit_no")
								, rset.getString("address")
								, rset.getString("d_address")
								, rset.getString("local_ct")
								, rset.getString("dlocal_ct")
								, rset.getString("phone")
								, rset.getString("cellphone")
								, rset.getString("email")
								, rset.getString("parking")
								, rset.getString("status")
								, rset.getString("longtitude")
								, rset.getString("latitude")
								, rset.getString("r_img")
								, rset.getString("open")
								, rset.getString("close")
								, rset.getString("break_s")
								, rset.getString("break_e")
								, rset.getString("food_ct"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return r;
	}
	
	public int updatePwd(Connection conn, int resNo, String userPwd) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatePwd");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userPwd);
			pstmt.setInt(2, resNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int updateHours(Connection conn, Restaurant r) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateHours");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, r.getOpen());
			pstmt.setString(2, r.getClose());
			pstmt.setString(3, r.getBreakS());
			pstmt.setString(4, r.getBreakE());
			pstmt.setInt(5, r.getResNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public Restaurant selectRest(Connection conn, int restNo) {
		Restaurant r = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectRest");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, restNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				r= new Restaurant(rset.getInt("res_no")
								, rset.getString("res_name")
								, rset.getString("ceo")
								, rset.getString("permit_no")
								, rset.getString("address")
								, rset.getString("d_address")
								, rset.getString("local_ct")
								, rset.getString("dlocal_ct")
								, rset.getString("phone")
								, rset.getString("cellphone")
								, rset.getString("email")
								, rset.getString("parking")
								, rset.getString("status")
								, rset.getString("longtitude")
								, rset.getString("latitude")
								, rset.getString("r_img")
								, rset.getString("open")
								, rset.getString("close")
								, rset.getString("break_s")
								, rset.getString("break_e")
								, rset.getString("food_ct"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return r;
	}

}
