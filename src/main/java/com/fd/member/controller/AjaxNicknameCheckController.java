package com.fd.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fd.member.model.service.MemberService;

/**
 * Servlet implementation class AjaxNicknameCheckController
 */
@WebServlet("/nicknameCheck.me")
public class AjaxNicknameCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxNicknameCheckController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String checkNickname = request.getParameter("checkNickname");
		
		int count2 = new MemberService().nicknameCheck(checkNickname);
		
		response.setContentType("text/html; charset=UTF-8"); // 한글포함
		
		if(count2 > 0) { // 존재 아이디 있음 => 사용불가능(NNN)
			response.getWriter().print("NNN");
		} else { // 존재 아이디 없음 => 사용가능(YYY)
			response.getWriter().print("YYY");
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
