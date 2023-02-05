package com.fd.restaurant.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fd.restaurant.model.service.RestaurantService;

/**
 * Servlet implementation class RestBookStatusController
 */
@WebServlet("/bookStatus.re")
public class RestBookStatusController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RestBookStatusController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bookNo = Integer.parseInt(request.getParameter("statusBookNo"));
		String status = request.getParameter("bookStatus");
		int result = new RestaurantService().updateBookStatus(bookNo, status);
		HttpSession session = request.getSession();
		if(result>0) {
			session.setAttribute("alertMsg", "예약상태 변경이 완료되었습니다.");
			response.sendRedirect(request.getContextPath()+"/book.re");
		}else {
			session.setAttribute("alertMsg", "예약상태 변경에 실패하였습니다. 고객센터로 문의해주세요.");
			response.sendRedirect(request.getContextPath()+"/book.re");
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
