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
 * Servlet implementation class ConfirmPwdController
 */
@WebServlet("/changeInfo.me")
public class ConfirmPwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConfirmPwdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		Member m = new MemberService().loginMember(userId, userPwd);
		
		if(m == null) {
			// 실패시 
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "비밀번호가 틀렸습니다. 다시 입력해주세요");
			request.getRequestDispatcher("views/member/memberConfirmPwd.jsp").forward(request, response);
		} else {
			// 성공시 => 다음페이지(views/member/memberChangeInfo.jsp)
			HttpSession session = request.getSession();
			session.setAttribute("m", m);
			
			request.getRequestDispatcher("views/member/memberChangeInfo.jsp").forward(request, response);
			
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
