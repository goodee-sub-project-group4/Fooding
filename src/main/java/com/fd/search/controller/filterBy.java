package com.fd.search.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fd.restaurant.model.vo.Restaurant;

/**
 * Servlet implementation class filterBy
 */
@WebServlet("/filter.res")
public class filterBy extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public filterBy() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		ArrayList<Restaurant> list1 = (ArrayList<Restaurant>)request.getAttribute("list"); 
		String standard = (String)request.getAttribute("standard"); 
		
		
		System.out.println(standard); 
		//System.out.println(list1); 
		
		
		int result = 0; 
		
		response.setContentType("text/html; charset=UTF-8"); // 한글포함문자열 돌려줄 때 
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
