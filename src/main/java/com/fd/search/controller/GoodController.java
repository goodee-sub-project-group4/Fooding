package com.fd.search.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fd.member.model.vo.Member;
import com.fd.restaurant.model.vo.Restaurant;
import com.fd.search.model.service.SearchService;

/**
 * Servlet implementation class GoodController
 */
@WebServlet("/good.sh")
public class GoodController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GoodController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		System.out.println(userNo); 
		
		int resNo = Integer.parseInt(request.getParameter("resNo"));
		System.out.println(resNo); 
		
		int result = new SearchService().insertGood(resNo, userNo); 
		
		/*
		 * result 값이 0일 경우, 이미 찜하기가 되어있다는 얘기 이므로, 되어있는 찜을 삭제할 메소드
		if(result < 1) {
			result = new SearchService().deleteGood(resNo, userNo);
		}
		*/
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
