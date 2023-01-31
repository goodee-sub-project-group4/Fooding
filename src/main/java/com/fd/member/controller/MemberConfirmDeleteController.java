package com.fd.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fd.member.model.service.MemberService;

/**
 * Servlet implementation class MemberConfirmDeleteController
 */
@WebServlet("/confirmDelete.me")
public class MemberConfirmDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberConfirmDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		int result = new MemberService().confirmDeleteMember(userId, userPwd);
		
		HttpSession session = request.getSession();
		if(result > 0) { // 성공
			session.setAttribute("alertMsg", "성공적으로 탈퇴되었습니다.");
			session.removeAttribute("loginUser");
			response.sendRedirect(request.getContextPath());
		} else { // 실패
			session.setAttribute("alertMsg", "탈퇴실패");
			response.sendRedirect(request.getContextPath() + "/changeInfo.me");
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
