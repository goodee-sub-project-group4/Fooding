package com.fd.book.controller;

import java.io.BufferedReader;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fd.book.model.service.BookService;
import com.fd.book.model.vo.Book;
import com.fd.book.model.vo.Payment;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

/**
 * Servlet implementation class BookInsertController
 */
@WebServlet("/insert.bo")
public class AjaxBookInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxBookInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		StringBuffer jb = new StringBuffer();
		String line = null;
		try {
			BufferedReader reader = request.getReader();
			while ((line = reader.readLine()) != null)
				jb.append(line);
		} catch (Exception e) {/* report an error */ }
						
		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(jb.toString());
		
		// 예약 인설트
		int userNo = element.getAsJsonObject().get("userNo").getAsInt();
		int resNo = element.getAsJsonObject().get("resNo").getAsInt();
		String bookName = element.getAsJsonObject().get("bookName").getAsString();
		String bookPhone = element.getAsJsonObject().get("bookPhone").getAsString();
		String bookDate = element.getAsJsonObject().get("bookDate").getAsString();
		String bookTime = element.getAsJsonObject().get("bookTime").getAsString();
		int people = element.getAsJsonObject().get("people").getAsInt();
		String email = element.getAsJsonObject().get("email").getAsString();
		String userRequest = element.getAsJsonObject().get("request").getAsString();
		
		Book book = new Book(userNo, resNo, bookName, bookPhone, bookDate, bookTime, people, email, userRequest);
		new BookService().insertBook(book);
		
		// 결제 인설트
		int bookNo = element.getAsJsonObject().get("bookNo").getAsInt();
		int payPoint = element.getAsJsonObject().get("payPoint").getAsInt();
		int payTotal = element.getAsJsonObject().get("amount").getAsInt();
		String payOp = element.getAsJsonObject().get("payMethod").getAsString();
		
		Payment payment = new Payment(bookNo, resNo, userNo, payPoint, payTotal, payOp);
		new BookService().insertPayment(payment);
		
		
		response.setContentType("application/json; charset=UTF-8");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
