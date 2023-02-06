package com.fd.book.model.dao;

import static com.fd.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.fd.book.model.vo.Book;
import com.fd.book.model.vo.Payment;
import com.fd.book.model.vo.Point;
import com.fd.common.model.vo.Attachment;
import com.fd.restaurant.model.vo.Menu;
import com.fd.restaurant.model.vo.Restaurant;
import com.fd.review.model.vo.Review;

public class BookDao {

	private Properties prop = new Properties();
	
	public BookDao() {
		try {
			prop.loadFromXML(new FileInputStream(BookDao.class.getResource("/db/sql/book-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int selectCountUp(Connection conn, int resNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectCountUp");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, resNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public Restaurant selectRes(Connection conn, int resNo) {
		Restaurant re = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectRes");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, resNo);
			rset = pstmt.executeQuery();
	
			if(rset.next()) {
				re = new Restaurant(rset.getInt("res_no")
								  , rset.getString("res_name")
								  , rset.getString("ceo")
								  , rset.getString("permit_No")
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
								  , rset.getString("food_ct"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
				
		return re;
	}

	public ArrayList<Menu> selectMenu(int resNo, Connection conn) {
		ArrayList<Menu> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMenu");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, resNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Menu(rset.getInt("menu_no")
								, rset.getString("menu_name")
								, rset.getInt("price")
								, rset.getString("menu_des")
								, rset.getString("m_img")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int selectBookNo(Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectBookNo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				result = rset.getInt("book_no");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public ArrayList<Review> selectReview(int resNo, Connection conn) {
	ArrayList<Review> list = new ArrayList<>();
	PreparedStatement pstmt = null;
	ResultSet rset = null;
	String sql = prop.getProperty("selectReview");
	
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, resNo);
		rset = pstmt.executeQuery();
		
		while(rset.next()) {
			list.add(new Review(rset.getInt("review_no")
							  , rset.getString("RES_NO")
							  , rset.getInt("USER_NO")
							  , rset.getInt("book_no")
							  , rset.getString("REVIEW_CONTENT")
							  , rset.getDouble("star")
							  , rset.getString("CREATE_DATE")
							  , rset.getString("MODIFY_DATE")
							  , rset.getString("good")
							  , rset.getInt("count")
							  , rset.getString("nickname")));
		}
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(rset);
		close(pstmt);
	}
	
	return list;
}

	public int selectPoint(Connection conn, int userNo) {
		int pointNow = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectPoint");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				pointNow = rset.getInt("point_now");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return pointNow;
	}

	public int insertBook(Connection conn, Book book) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertBook");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, book.getUserNo());
			pstmt.setInt(2, book.getResNo());
			pstmt.setString(3, book.getBookName());
			pstmt.setString(4, book.getBookPhone());
			pstmt.setString(5, book.getBookDate());
			pstmt.setString(6, book.getBookTime());
			pstmt.setInt(7, book.getPeople());
			pstmt.setString(8, book.getEmail());
			pstmt.setString(9, book.getRequest());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertPayment(Connection conn, Payment payment) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertPayment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, payment.getResNo());
			pstmt.setInt(2, payment.getUserNo());
			pstmt.setInt(3, payment.getPayPoint());
			pstmt.setInt(4, payment.getPayTotal());
			pstmt.setString(5, payment.getPayOp());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertPayPoint(Connection conn, Point point) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertPayPoint");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, point.getUserNo());
			pstmt.setInt(2, point.getResNo());
			pstmt.setString(3, point.getPointName());
			pstmt.setInt(4, point.getPayPoint());
			pstmt.setInt(5, point.getPayPoint());
			pstmt.setInt(6, point.getUserNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertSavePoint(Connection conn, Point point) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertSavePoint");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, point.getUserNo());
			pstmt.setInt(2, point.getResNo());
			pstmt.setString(3, point.getPointName());
			pstmt.setInt(4, point.getPointTrade());
			pstmt.setInt(5, point.getPointTrade());
			pstmt.setInt(6, point.getUserNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public Review selectReviewData(int resNo, Connection conn) {
		Review review = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReviewData");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, resNo);
			pstmt.setInt(2, resNo);
			pstmt.setInt(3, resNo);
			
			rset = pstmt.executeQuery();
			if(rset.next()){
				review = new Review(rset.getInt("review_count"),
									rset.getDouble("review_avg"),
									rset.getInt("count"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return review;
	}

	public ArrayList<Attachment> selectAttachment(ArrayList<Review> reviewList, int resNo, Connection conn) {
		ArrayList<Attachment> at = new ArrayList<>(); 
		Attachment attachment = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			for(Review r : reviewList) {
				pstmt.setInt(1, r.getReviewNo());
				pstmt.setInt(2, resNo);
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					attachment = new Attachment(rset.getInt("res_no")
											  ,	rset.getInt("ref_bno")
											  ,	rset.getString("change_name")
								 			  , rset.getString("file_path"));
					at.add(attachment);
				}
			}
			
			System.out.println(at);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return at;
	}

	public ArrayList<Book> selectBookList(int userNo, Connection conn) {
		ArrayList<Book> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectBookList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Book(rset.getInt("book_no")
								, rset.getInt("res_no")
								, rset.getString("book_name")
								, rset.getString("book_phone")
								, rset.getString("book_date")
								, rset.getString("book_time")
								, rset.getInt("people")
								, rset.getString("email")
								, rset.getString("request")
								, rset.getString("status")
								, rset.getString("modify_date")
								, rset.getString("book_a")));
			}
			System.out.println(list);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}



}
