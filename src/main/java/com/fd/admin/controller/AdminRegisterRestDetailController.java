package com.fd.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fd.admin.model.service.AdminService;
import com.fd.common.model.vo.Attachment;
import com.fd.restaurant.model.vo.Restaurant;

/**
 * Servlet implementation class AdminRegisterRestDetailController
 */
@WebServlet("/rrDetail.ad")
public class AdminRegisterRestDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminRegisterRestDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		int resNo = Integer.parseInt(request.getParameter("no"));
		
		AdminService aService = new AdminService();
		
		int result = aService.increseCountRes(resNo);
		if(result>0) {
			Restaurant r = aService.selectRegister(resNo);
			Attachment at = aService.selectRegisterAttachment(resNo);

			request.setAttribute("n", r);
			request.setAttribute("at", at);
			request.getRequestDispatcher("views/admin/registerRestDetailView.jsp").forward(request, response);
			
		} else {
			request.setAttribute("errorPage", "상세조회 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
