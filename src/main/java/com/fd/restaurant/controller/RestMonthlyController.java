package com.fd.restaurant.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fd.book.model.vo.Payment;
import com.fd.restaurant.model.service.RestaurantService;
import com.fd.restaurant.model.vo.Restaurant;

/**
 * Servlet implementation class RestMonthlyController
 */
@WebServlet("/monthly.re")
public class RestMonthlyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RestMonthlyController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session.getAttribute("loginRest")==null) {
			session.setAttribute("alertMsg", "로그인 후 이용가능한 서비스입니다.");
			response.sendRedirect(request.getContextPath()+"/rest.admin");
		}else {
			int resNo = ((Restaurant)session.getAttribute("loginRest")).getResNo();
			String year =  request.getParameter("year");
			String month = request.getParameter("month");
			if(month.length()==1) {
				month = "0"+month;
			}
			String lastDay = request.getParameter("lastDay");
			System.out.println(resNo+"/"+year+"/"+month+"/"+lastDay);
			String startDay = year+"/"+month+"/01";
			String endDay = year+"/"+month+"/"+lastDay;
			ArrayList<Payment> list = new RestaurantService().selectMonthlyPayment(resNo, startDay, endDay);
			
			request.setAttribute("list", list);
			request.getRequestDispatcher("views/restaurant/restMonthly.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
