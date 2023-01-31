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
 * Servlet implementation class MemberUpdateController
 */
@WebServlet("/update.me")
public class MemberUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/** 회원정보수정
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1)
		request.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String updatePwd = (request.getParameter("updatePwd") == "") ? userPwd : request.getParameter("updatePwd"); 
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
		
		Member m = new Member(userId, userPwd, updatePwd, userName, nickname, userEmail, userPhone, gender, birth);
		
		// 2)
		Member updateMem = new MemberService().updateMember(m);
		
		// 3)
		if(updateMem == null) { 
			// 실패 => 에러페이지 포워딩
			request.setAttribute("errorMsg", "회원정보 수정에 실패했습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			
		} else {
			
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "성공적으로 회원정보를 수정하였습니다.");
			session.setAttribute("loginUser", updateMem); // 갱신된 회원정보로 업데이트
			
			// 성공 => 회원정보수정 페이지 (views/member/memberChangeInfo.jsp) == /changeInfo.me + 알람
			response.sendRedirect(request.getContextPath() + "/myPageConfirmPwd.me");
			
			
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
