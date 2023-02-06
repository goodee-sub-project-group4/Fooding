package com.fd.book.model.service;

import static com.fd.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.fd.book.model.dao.BookDao;
import com.fd.book.model.vo.Book;
import com.fd.book.model.vo.Payment;
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



	public int selectPoint(int userNo) {
		Connection conn = getConnection();
		int pointNow = new BookDao().selectPoint(conn, userNo);
		close(conn);
		return pointNow;
	}



	public void insertBook(Book book, Payment payment, Point point) {
		Connection conn = getConnection();
		int insertBook = new BookDao().insertBook(conn, book);
		int insertPayment = new BookDao().insertPayment(conn, payment);
		if(payment.getPayPoint() > 0) {
			int insertPayPoint = new BookDao().insertPayPoint(conn, point);
			if(insertPayPoint > 0) {
				commit(conn);
			}else {
				rollback(conn);
			}
		}
		int insertSavePoint = new BookDao().insertSavePoint(conn, point);
		if(insertBook > 0 && insertPayment > 0 && insertSavePoint > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
	}



	public ArrayList<Review> selectReview(int resNo) {
		Connection conn = getConnection();
		ArrayList<Review> list = new BookDao().selectReview(resNo, conn);
		close(conn);
		return list;
	}
	
	/** (마이페이지) 예약/결제 내역 리스트
	 * @author 빛나 
	 * @return result
	 */
//	public int selectBookList(int userNo) {
//		Connection conn = getConnection();
//		int result = new BookDao().selectBookList(conn, userNo);
//		close(conn);
//		return result;
//	}

	
}
