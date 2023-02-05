package com.fd.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fd.admin.model.service.AdminService;
import com.fd.restaurant.model.vo.Restaurant;
import com.google.gson.Gson;

/**
 * Servlet implementation class AjaxAdminCheckRestController
 */
@WebServlet("/selectRest.ad")
public class AjaxAdminCheckRestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxAdminCheckRestController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int resNo = Integer.parseInt(request.getParameter("resNo"));
		Restaurant r = new AdminService().selectRest(resNo);
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(r, response.getWriter());	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
