package com.fd.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fd.review.model.service.ReviewService;
import com.fd.review.model.vo.Review;
import com.fd.review.model.vo.ReviewDetailVo;
import com.google.gson.Gson;

/**
 * Servlet implementation class AjaxReviewDetailController
 */
@WebServlet("/reviewDetail.me")
public class AjaxReviewDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxReviewDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
		
		ReviewService rs = new ReviewService();
		// 조회수 증가
		int result = rs.increaseCount(reviewNo);
		
		if (result > 0) {
			
			ReviewDetailVo detailVo = rs.selectContentReview(reviewNo);
			
			response.setContentType("application/json; charset=UTF-8");
			new Gson().toJson(detailVo, response.getWriter());	
			
		} else {
			// 실패 => 에러페이지
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
