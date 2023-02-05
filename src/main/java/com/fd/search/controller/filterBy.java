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

		String standard = (String)request.getParameter("standard"); 
		//String list1 = (String)request.getParameter("list1");
		//ArrayList<Restaurant> list1 = (ArrayList<Restaurant>)request.getAttribute("list1"); 
		
		
		System.out.println(standard); 
		//System.out.println(list1);
		
		//ArrayList<Restaurant> list = (ArrayList<Restaurant>)session.getAttribute("list"); 
		
		//System.out.println(list); 
		
		 
		
		
		int result = 0; 
		
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
