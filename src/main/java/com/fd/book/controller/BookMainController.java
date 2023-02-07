package com.fd.book.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fd.book.model.service.BookService;
import com.fd.common.model.vo.Attachment;
import com.fd.restaurant.model.vo.Menu;
import com.fd.restaurant.model.vo.Restaurant;
import com.fd.review.model.vo.Review;

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
		System.out.println(resNo);
		int countUp = new BookService().selectCountUp(resNo);
		// 메뉴 정보 조회
		ArrayList<Menu> menuList = new BookService().selectMenu(resNo);
		// 리뷰 평점, 조회수, 개수 조회
		Review review = new BookService().selectReviewData(resNo);
		// 리뷰 정보 조회
		ArrayList<Review> reviewList = new BookService().selectReview(resNo);
		// 첨부 파일 조회
		ArrayList<Attachment> attachment = new BookService().selectAttachment(reviewList, resNo);
		// 식당 정보 조회
		Restaurant restaurant = new BookService().selectRes(resNo);	
		System.out.println(restaurant);
		if(restaurant == null) {
			request.setAttribute("errorMsg", "식당 조회 오류발생");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}else {
			request.setAttribute("restaurant", restaurant);
			request.setAttribute("review", review);
			request.setAttribute("menuList", menuList);
			request.setAttribute("reviewList", reviewList);
			request.setAttribute("attachment", attachment);
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
