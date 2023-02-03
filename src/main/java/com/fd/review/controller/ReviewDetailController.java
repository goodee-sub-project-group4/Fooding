package com.fd.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fd.review.model.service.ReviewService;

/**
 * Servlet implementation class ReviewDetailController
 */
@WebServlet("/reviewDetail.re")
public class ReviewDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int reviewNo = Integer.parseInt(request.getParameter("no"));
		
		ReviewService rs = new ReviewService();
		
		// 조회수 증가
		int result = rs.increaseCount(reviewNo);
		if(result > 0) {
			// 성공시 
			// => 상세페이지(업체사진, 업체명, 별점, 내용) => review 테이블에서 조회
			// => 첨부파일정보(저장경로, 수정명) => attachment 테이블에서 조회
		} else {
			// 실패시
			// => 에러
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
