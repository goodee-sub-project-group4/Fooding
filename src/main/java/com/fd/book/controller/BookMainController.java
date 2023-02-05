package com.fd.book.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fd.book.model.service.BookService;
import com.fd.restaurant.model.vo.Menu;
import com.fd.restaurant.model.vo.Restaurant;

/**
 * Servlet implementation class BookMainController
 */
@WebServlet("/main.bo")
public class BookMainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookMainController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int resNo = Integer.parseInt(request.getParameter("resNo"));
		// 식당 조회수 1 증가
		int countUp = new BookService().selectCountUp(resNo);
		// 메뉴 정보 조회
		ArrayList<Menu> menuList = new BookService().selectMenu(resNo);
		// 리뷰 정보 조회
//		ArrayList<Review> reviewList = new BookService().selectReview(resNo);
		// 예약 번호 조회
		int bookNo = new BookService().selectBookNo();
		// 식당 정보 조회
		Restaurant restaurant = new BookService().selectRes(resNo);	
		if(restaurant == null) {
			request.setAttribute("errorMsg", "식당 조회 오류발생");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}else {
			request.setAttribute("restaurant", restaurant);
			request.setAttribute("menuList", menuList);
			request.setAttribute("bookNo", bookNo);
//			request.setAttribute("menuList", reviewList);
			request.getRequestDispatcher("views/book/bookMain.jsp").forward(request, response);
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
