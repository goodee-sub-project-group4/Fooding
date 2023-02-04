package com.fd.restaurant.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fd.book.model.vo.Book;
import com.fd.book.model.vo.BookMenu;
import com.fd.book.model.vo.Payment;
import com.fd.restaurant.model.service.RestaurantService;
import com.google.gson.Gson;

/**
 * Servlet implementation class AjaxRestBookDetailController
 */
@WebServlet("/bookDetail.re")
public class AjaxRestBookDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxRestBookDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bookNo = Integer.parseInt(request.getParameter("no"));
		RestaurantService rs = new RestaurantService();
		//정보 각각 조회해오기
		Book b = rs.selectBook(bookNo);
		ArrayList<BookMenu> bmList = rs.selectBookMenu(bookNo);
		Payment p = rs.selectPayment(bookNo);
		//정보 한군데에 담기
		ArrayList set = new ArrayList();
		set.add(b);
		set.add(bmList);
		set.add(p);
		//데이터 넘기기
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(set, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
