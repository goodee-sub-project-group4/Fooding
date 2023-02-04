package com.fd.review.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fd.review.model.service.ReviewService;
import com.fd.review.model.vo.ReviewDetailFileVo;
import com.google.gson.Gson;

/**
 * Servlet implementation class AjaxReviewDetailFileController
 */
@WebServlet("/reviewDetailFile.me")
public class AjaxReviewDetailFileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxReviewDetailFileController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
		
		ReviewService rs = new ReviewService();
		ArrayList<ReviewDetailFileVo> detailFileVos = rs.selectContentReviewFiles(reviewNo);
		System.out.println("detailFileVos ==> " + detailFileVos);
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(detailFileVos, response.getWriter());	
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
