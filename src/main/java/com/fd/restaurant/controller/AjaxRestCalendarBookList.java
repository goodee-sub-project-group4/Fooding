package com.fd.restaurant.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fd.book.model.vo.Book;
import com.fd.restaurant.model.service.RestaurantService;
import com.fd.restaurant.model.vo.Restaurant;
import com.google.gson.Gson;

/**
 * Servlet implementation class AjaxRestCalendarBookList
 */
@WebServlet("/selectDateBook.re")
public class AjaxRestCalendarBookList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxRestCalendarBookList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int resNo = ((Restaurant)session.getAttribute("loginRest")).getResNo();
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String date  = request.getParameter("date");
		
		if(month.length()==1) {
			month="0"+month;
		}
		if(date.length()==1) {
			date="0"+date;
		}
		String bookDate = year+"/"+month+"/"+date;
		
		ArrayList<Book> list = new RestaurantService().selectCalendarBook(resNo, bookDate);
		//데이터 넘기기
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(list, response.getWriter());
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
