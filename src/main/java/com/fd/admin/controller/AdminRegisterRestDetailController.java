package com.fd.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		HttpSession session = request.getSession();
		if(session.getAttribute("loginAdmin")==null) {
			session.setAttribute("alertMsg", "로그인 후 이용가능한 서비스입니다.");
			response.sendRedirect(request.getContextPath()+"/rest.admin");
		}else {	

			int resNo = Integer.parseInt(request.getParameter("no"));	
			
			int result = new AdminService().increseCountRes(resNo);
			if(result>0) {
				Restaurant r = new AdminService().selectRegister(resNo);
	
				request.setAttribute("r", r);
				request.getRequestDispatcher("views/admin/registerRestDetailView.jsp").forward(request, response);
				
			} else {
				request.setAttribute("errorPage", "상세조회 실패");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
