package com.fd.search.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fd.search.model.service.SearchService;

/**
 * Servlet implementation class SearchController
 */
@WebServlet("/search.res")
public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1) 요청시 전달값 뽑기 & 데이터 가공처리 => 변수 또는 객체에 기록하기 
		String localCt = request.getParameter("city");	
		String dLocalCt = request.getParameter("county"); 
		String foodCt = request.getParameter("foodCt"); 
		
		// 2) 요청처리 (db에 sql문)
		new SearchService().selectListCount(); 
		
		// 응답페이지 (views/search/search.jsp); 
		request.getRequestDispatcher("views/search/search.jsp").forward(request, response); 
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
