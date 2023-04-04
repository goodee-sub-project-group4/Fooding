package com.fd.book.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fd.book.model.service.BookService;
import com.fd.book.model.vo.Book;
import com.fd.book.model.vo.BookMenu;
import com.fd.book.model.vo.Payment;
import com.fd.book.model.vo.Point;
import com.fd.restaurant.model.vo.Menu;
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
		
		// 예약 인설트 파라미터
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
		
		// 예약 메뉴 인설트 파라미터
		String menuNameList = element.getAsJsonObject().get("menuName").getAsString();
		String menuQuantityList = element.getAsJsonObject().get("menuQuantity").getAsString();
		String[] menuName = menuNameList.split(",");
		String[] menuQuantity = menuQuantityList.split(",");
		
		// 결제 인설트 파라미터
		int payPoint = element.getAsJsonObject().get("payPoint").getAsInt();
		int payTotal = element.getAsJsonObject().get("amount").getAsInt();
		String payOp = element.getAsJsonObject().get("payMethod").getAsString();
		Payment payment = new Payment(resNo, userNo, payPoint, payTotal, payOp);
		
		// 포인트 인설트 파라미터
		String pointName = bookDate + " " + element.getAsJsonObject().get("resName").getAsString();
		int pointTrade = element.getAsJsonObject().get("savePoint").getAsInt();
		Point point = new Point(userNo, resNo, pointName, pointTrade, payPoint);
		
		
		new BookService().insertBook(book, payment, point, menuName, menuQuantity);
		
		response.getWriter().print(1);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
}
