package com.fd.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fd.member.model.service.MemberService;
import com.fd.member.model.vo.Member;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/login.me")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/** 로그인
	 * @author 빛나
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 1)
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		// 2) m 대신 loginUser
		Member loginUser = new MemberService().loginMember(userId, userPwd);
	
		// 3)
		if(loginUser == null) {
			// 실패시 => 에러페이지(views/common/errorPage.jsp)
			request.setAttribute("errorMsg", "로그인에 실패했습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		} else {
			// 성공시 => 메인페이지(index.jsp)
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", loginUser);
			
			response.sendRedirect(request.getContextPath());
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
