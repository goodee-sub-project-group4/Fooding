package com.fd.restaurant.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fd.admin.model.service.AdminService;
import com.fd.member.model.vo.Member;
import com.fd.restaurant.model.service.RestaurantService;
import com.fd.restaurant.model.vo.Restaurant;

/**
 * Servlet implementation class RestAdminLoginController
 */
@WebServlet("/login.re.ad")
public class RestAdminLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RestAdminLoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**업체/관리자 로그인
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String which = request.getParameter("which"); //관리자로그인인지 업체로그인인지 담음
		if(which.equals("rest")) {
			int restNo = Integer.parseInt(userId);
			Restaurant loginRest = new RestaurantService().loginRest(restNo, userPwd);
			if(loginRest == null) {
				request.setAttribute("errorMsg", "로그인에 실패했습니다.");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}else {
				HttpSession session = request.getSession();
				session.setAttribute("loginRest", loginRest);
				response.sendRedirect(request.getContextPath()+"/home.re");
			}
		}else {
			// 관리자 로그인 진행
			String adminId = userId;
			String adminPwd = userPwd;
			Member loginAdmin = new AdminService().loginAdmin(adminId, adminPwd);
			if(loginAdmin == null) {
				request.setAttribute("errorMsg", "로그인에 실패했습니다.");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);				
			}else {
				HttpSession session = request.getSession();
				session.setAttribute("loginAdmin", loginAdmin);
				//request.getRequestDispatcher("views/admin/checkMember.jsp").forward(request, response);
				response.sendRedirect(request.getContextPath()+"/mList.ad");
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
