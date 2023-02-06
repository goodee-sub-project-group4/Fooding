package com.fd.restaurant.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fd.book.model.vo.NotAble;
import com.fd.restaurant.model.service.RestaurantService;
import com.fd.restaurant.model.vo.Restaurant;

/**
 * Servlet implementation class AjaxRestNotAbleDeleteController
 */
@WebServlet("/deleteNotAble.re")
public class AjaxRestNotAbleDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxRestNotAbleDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int resNo = ((Restaurant)session.getAttribute("loginRest")).getResNo();
		String month = request.getParameter("month");
		String date = request.getParameter("date");
		String year = request.getParameter("year");
		NotAble na = new NotAble();
		na.setResNo(resNo);
		na.setMonth(month);
		na.setYear(year);
		na.setDate(date);
		
		//db 처리하고온 후 결과 전달하기
		int result = new RestaurantService().deleteNotAble(na);
		response.getWriter().print(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
