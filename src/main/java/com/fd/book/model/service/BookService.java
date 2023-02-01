package com.fd.book.model.service;

import static com.fd.common.JDBCTemplate.*;

import java.sql.Connection;

import com.fd.book.model.dao.BookDao;
import com.fd.restaurant.model.vo.Restaurant;

public class BookService {

	public Restaurant selectRes(int resNo) {
		Connection conn = getConnection();
		Restaurant re = new BookDao().selectRes(conn, resNo);
		close(conn);
		return re;
	}

}
