package com.fd.review.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fd.review.model.service.ReviewService;
import com.fd.review.model.vo.Review;

/**
 * Servlet implementation class MyPageReviewListController
 */
@WebServlet("/reviewList.me")
public class ReviewListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// 1) 
		
		// 2) 응답페이지에 필요한 데이터 조회 (select)
		ArrayList<Review> list = new ReviewService().selectReviewList();
		
		// 3) 응답뷰 (views/review/reviewList.jsp)
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/review/reviewList.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
