package com.fd.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fd.admin.model.service.AdminService;
import com.fd.member.model.vo.Member;
import com.google.gson.Gson;

/**
 * Servlet implementation class AjaxAdminUpdateMemberController
 */
@WebServlet("/updateMember.ad")
public class AdminUpdateMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminUpdateMemberController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 회원 수정
		request.setCharacterEncoding("UTF-8");
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));	
		String userName = request.getParameter("userName");
		String nickname = request.getParameter("nickname");
		String userPhone = request.getParameter("userPhone");
		String userEmail = request.getParameter("userEmail");
		String status = request.getParameter("status");
		
		Member u = new Member();
		u.setUserNo(userNo);
		u.setUserName(userName);
		u.setNickname(nickname);
		u.setUserPhone(userPhone);
		u.setUserEmail(userEmail);
		u.setStatus(status);
		
		int result = new AdminService().updateMember(u);
		
//		response.setContentType("text/html; charset=UTF-8"); 
//		new Gson().toJson(result, response.getWriter());	
		if(result>0) {
			request.getSession().setAttribute("alertMsg", "회원 수정 완료");
			response.sendRedirect(request.getContextPath() + "/mList.ad");
		}else {
			request.getSession().setAttribute("errorMsg", "회원 수정 실패");
			response.sendRedirect(request.getContextPath() + "/mList.ad");
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
