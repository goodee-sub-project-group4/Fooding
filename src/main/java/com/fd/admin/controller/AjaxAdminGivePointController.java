package com.fd.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fd.admin.model.service.AdminService;
import com.fd.book.model.vo.Point;

/**
 * Servlet implementation class AdminGivePointController
 */
@WebServlet("/point.ad")
public class AjaxAdminGivePointController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxAdminGivePointController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		String pointName = request.getParameter("pointName");
		int pointTrade = Integer.parseInt(request.getParameter("pointTrade"));
		
		Point p = new Point();
		p.setUserNo(userNo);
		p.setPointName(pointName);
		p.setPointTrade(pointTrade);
		
		int result = new AdminService().givePoint(p);
		response.setContentType("text/html; charset=UTF-8"); 
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
