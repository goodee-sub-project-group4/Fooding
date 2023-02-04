package com.fd.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fd.admin.model.service.AdminService;
import com.fd.member.model.vo.Member;
import com.google.gson.Gson;

/**
 * Servlet implementation class AjaxAdminUpdateMemberController
 */
@WebServlet("/updateMember.ad")
public class AjaxAdminUpdateMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxAdminUpdateMemberController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 회원 수정
		ArrayList<Member> list = new AdminService().selectMemberList();
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		Member m = new AdminService().selectMember(userNo);
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(list, response.getWriter());	
		new Gson().toJson(m, response.getWriter());	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
