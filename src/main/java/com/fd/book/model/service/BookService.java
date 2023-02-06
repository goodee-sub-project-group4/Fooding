package com.fd.book.model.service;

import static com.fd.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.fd.book.model.dao.BookDao;
import com.fd.book.model.vo.Book;
import com.fd.book.model.vo.Payment;
import com.fd.book.model.vo.Point;
import com.fd.common.model.vo.Attachment;
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



	public Review selectReviewData(int resNo) {
		Connection conn = getConnection();
		Review review = new BookDao().selectReviewData(resNo, conn);
		close(conn);
		return review;
	}



	public ArrayList<Attachment> selectAttachment(ArrayList<Review> reviewList, int resNo) {
		Connection conn = getConnection();
		ArrayList<Attachment> attachment = new BookDao().selectAttachment(reviewList, resNo, conn);
		close(conn);
		return attachment;
	}



	public ArrayList<Book> selectBookList(int userNo) {
		Connection conn = getConnection();
		ArrayList<Book> list = new BookDao().selectBookList(userNo, conn);
		close(conn);
		return list;
	}

	
}
