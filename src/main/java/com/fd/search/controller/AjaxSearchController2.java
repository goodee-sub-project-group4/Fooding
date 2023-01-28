package com.fd.search.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fd.search.model.service.SearchService;
import com.fd.search.model.vo.Search;
import com.google.gson.Gson;

/**
 * Servlet implementation class AjaxSearchController2
 */
@WebServlet("/ajaxsearch2.aj")
public class AjaxSearchController2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxSearchController2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String keyword = request.getParameter("keyword");
		
		//서비스 클래스의 selectSearch()메소드 이용해서 검색결과 조회해오기 
		ArrayList<Search> list = new SearchService().selectSearch(keyword); 
		
		response.setContentType("application/json; charset=UTF-8"); 
		new Gson().toJson(list, response.getWriter()); 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
