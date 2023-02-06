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
import com.fd.book.model.vo.NotAble;
import com.fd.restaurant.model.service.RestaurantService;
import com.fd.restaurant.model.vo.Restaurant;

/**
 * Servlet implementation class RestCalendarController
 */
@WebServlet("/calendar.re")
public class RestCalendarController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RestCalendarController() {
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
			//달력 구성에 필요한 정보 담기
			String year = (String)session.getAttribute("sessionYear");
			String month = (String)session.getAttribute("sessionMonth");
			request.setAttribute("year", year);
			request.setAttribute("month", month);
			
			//불가날짜 담기
			NotAble na = new NotAble();
			na.setResNo(resNo);
			na.setYear(year);
			na.setMonth(month);
			ArrayList<NotAble> naList = new RestaurantService().selectNotAble(na);
			request.setAttribute("naList", naList);
			
			//일별예약정보담기
			if(month.length()==1) {
				month = "0"+month;
			}
			ArrayList<Book> bList = new RestaurantService().selectBookForCalendar(resNo, year, month);
			request.setAttribute("bList", bList);
			request.getRequestDispatcher("views/restaurant/restCalendar.jsp").forward(request, response);
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
