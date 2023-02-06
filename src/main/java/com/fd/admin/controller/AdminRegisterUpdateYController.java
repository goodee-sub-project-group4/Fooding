package com.fd.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fd.admin.model.service.AdminService;

/**
 * Servlet implementation class AdminRegisterStatusYController
 */
@WebServlet("/setY.ad")
public class AdminRegisterUpdateYController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminRegisterUpdateYController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("loginAdmin")==null) {
			session.setAttribute("alertMsg", "로그인 후 이용가능한 서비스입니다.");
			response.sendRedirect(request.getContextPath()+"/rest.admin");
		}else {	
			int resNo = Integer.parseInt(request.getParameter("resNo"));
			int result = new AdminService().restStatusY(resNo);
			if(result>0) {
				session.setAttribute("alertMsg", "업체 등록 승인 완료");
				response.sendRedirect(request.getContextPath()+"/rrList.ad");
			}else {
				session.setAttribute("alertMsg", "업체 등록 승인 실패");
				response.sendRedirect(request.getContextPath()+"/rrDetail.ad");
			}
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
