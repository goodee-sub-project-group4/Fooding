package com.fd.restaurant.model.dao;

import static com.fd.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.fd.admin.model.vo.Question;
import com.fd.restaurant.model.vo.Menu;
import com.fd.restaurant.model.vo.Restaurant;
import com.fd.review.model.vo.Review;

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
	
	public int insertMenu(Connection conn, Menu m) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMenu");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, m.getResNo());
			pstmt.setString(2, m.getMenuName());
			pstmt.setInt(3, m.getPrice());
			pstmt.setString(4, m.getMenuDes());
			pstmt.setString(5, m.getmImg());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public ArrayList<Menu> selectMenu(Connection conn, int resNo) {
		ArrayList<Menu> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMenu");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, resNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Menu(rset.getInt("menu_no")
							    , rset.getInt("res_no")
						        , rset.getString("menu_name")
						        , rset.getInt("price")
						        , rset.getString("menu_des")
						        , rset.getString("m_img")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public int updateMenu(Connection conn, Menu m) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateMenu");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, m.getMenuName());
			pstmt.setInt(2, m.getPrice());
			pstmt.setString(3, m.getMenuDes());
			pstmt.setString(4, m.getmImg());
			pstmt.setInt(5, m.getMenuNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int updateInfo(Connection conn, Restaurant r) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateInfo");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, r.getAddress());
			pstmt.setString(2, r.getdAddress());
			pstmt.setString(3, r.getPhone());
			pstmt.setString(4, r.getCellphone());
			pstmt.setString(5, r.getEmail());
			pstmt.setString(6, r.getParking());
			pstmt.setString(7, r.getrImg());
			pstmt.setString(8, r.getOpen());
			pstmt.setString(9, r.getClose());
			pstmt.setString(10, r.getBreakS());
			pstmt.setString(11, r.getBreakE());
			pstmt.setString(12, r.getFoodCt());
			pstmt.setInt(13, r.getResNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int deleteMenu(Connection conn, int menuNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteMenu");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, menuNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public ArrayList<Question> selectQuestion(Connection conn, int resNo) {
		ArrayList<Question> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectQuestion");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, resNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Question q = new Question();
				q.setqNo(rset.getInt("q_no"));
				q.setCategory(rset.getString("category"));
				q.setqTitle(rset.getString("q_title"));
				q.setqPerson(rset.getString("user_id"));
				q.setStatus(rset.getString("status"));
				q.setCreateDate(rset.getString("create_date"));
				list.add(q);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public Question selectDetailQuestion(Connection conn, int qNo) {
		Question q = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectDetailQuestion");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				q = new Question();
				q.setqNo(rset.getInt("q_no"));
				q.setCategory(rset.getString("category"));
				q.setqTitle(rset.getString("q_title"));
				q.setqPerson(rset.getString("user_id"));
				q.setStatus(rset.getString("status"));
				q.setCreateDate(rset.getString("create_date"));
				q.setqContent(rset.getString("q_content"));
				q.setaContent(rset.getString("a_content"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return q;
	}
	
	public int updateQuestion(Connection conn, int qNo, String aContent) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateQuestion");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, aContent);
			pstmt.setInt(2, qNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Review> selectReview(Connection conn, int resNo) {
		ArrayList<Review> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReview");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, resNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Review r = new Review();
				r.setReviewNo(rset.getInt("review_no"));
				r.setUserId(rset.getString("user_id"));
				r.setReviewContent(rset.getString("review_content"));
				r.setStar(rset.getDouble("star"));
				r.setBookNo(rset.getInt("book_no"));
				r.setCreateDate(rset.getString("create_date"));
				r.setGood(rset.getString("good"));
				list.add(r);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public ArrayList<Question> selectNewQuestion(Connection conn, int resNo) {
		ArrayList<Question> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectNewQuestion");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, resNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Question q = new Question();
				q.setqNo(rset.getInt("q_no"));
				q.setqTitle(rset.getString("q_title"));
				q.setqContent(rset.getString("q_content"));
				q.setCreateDate(rset.getString("create_date"));
	
				list.add(q);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public ArrayList<Review> selectNewReview(Connection conn, int resNo) {
		ArrayList<Review> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectNewReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, resNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Review r = new Review();
				r.setReviewNo(rset.getInt("review_no"));
				r.setCreateDate(rset.getString("create_date"));
				r.setReviewContent(rset.getString("review_content"));
				list.add(r);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public Review selectReviewDetail(Connection conn, int reviewNo) {
		Review r= null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReviewDetail");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reviewNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				r = new Review();
				r.setReviewNo(rset.getInt("review_no"));
				r.setUserId(rset.getString("user_id"));
				r.setReviewContent(rset.getString("review_content"));
				r.setStar(rset.getDouble("star"));
				r.setBookNo(rset.getInt("book_no"));
				r.setCreateDate(rset.getString("create_date"));
				r.setGood(rset.getString("good"));
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
