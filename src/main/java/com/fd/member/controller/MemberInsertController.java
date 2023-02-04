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
 * Servlet implementation class MemberInsertController
 */
@WebServlet("/insert.me")
public class MemberInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/** 회원가입
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1)
		request.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String userName = request.getParameter("userName");
		String nickname = request.getParameter("nickname");
		String userEmail = request.getParameter("userEmail");
		String userPhone = request.getParameter("userPhone");
		String gender = request.getParameter("gender");
		String[] birthArr = request.getParameterValues("birth");
		
		String birth = "";
		if(birthArr != null) {
			birth = String.join("", birthArr);
		}
		
		Member m = new Member(userId, userPwd, userName, nickname, userEmail, userPhone, gender, birth);
		
		// 2) 
		Member selectMember = new MemberService().insertMember(m);
		
		// 3) 
		if(selectMember != null) {
			
			// 회원가입축하 적립금 조회
			int result2 = new MemberService().insertPoint(selectMember);
			
			
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "성공적으로 회원가입이 되었습니다.");
			// 성공 => index페이지
			response.sendRedirect(request.getContextPath());
			
		} else {
			// 실패 => 에러페이지
			request.setAttribute("errorMsg", "회원가입 실패했습니다.");
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
