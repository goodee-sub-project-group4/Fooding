package com.fd.book.model.service;

import static com.fd.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.fd.book.model.dao.BookDao;
import com.fd.book.model.vo.Book;
import com.fd.book.model.vo.Point;
import com.fd.restaurant.model.vo.Menu;
import com.fd.restaurant.model.vo.Restaurant;
import com.fd.review.model.vo.Review;

public class BookService {

	/**
	 * @param 김태진
	 * 업체 상세 조회 조회수 증가
	 */
	public int selectCountUp(int resNo) {
		Connection conn = getConnection();
		int result = new BookDao().selectCountUp(conn, resNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	
	
	public Restaurant selectRes(int resNo) {
		Connection conn = getConnection();
		Restaurant re = new BookDao().selectRes(conn, resNo);
		close(conn);
		return re;
	}



	public ArrayList<Menu> selectMenu(int resNo) {
		Connection conn = getConnection();
		ArrayList<Menu> list = new BookDao().selectMenu(resNo, conn);
		close(conn);
		return list;
	}



	public int selectBookNo() {
		Connection conn = getConnection();
		int result = new BookDao().selectBookNo(conn);
		close(conn);
		return result;
	}



	public Point selectPoint(int userNo) {
		Connection conn = getConnection();
		Point po = new BookDao().selectPoint(conn, userNo);
		close(conn);
		return po;
	}



	public int insertBook(Book book) {
		Connection conn = getConnection();
		int result = new BookDao().insertBook(conn, book);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}



//	public ArrayList<Review> selectReview(int resNo) {
//		Connection conn = getConnection();
//		ArrayList<Review> list = new BookDao().selectReview(resNo, conn);
//		close(conn);
//		return list;
//	}

	
}
