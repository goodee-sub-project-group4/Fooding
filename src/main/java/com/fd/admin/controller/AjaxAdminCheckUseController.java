package com.fd.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

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
 * Servlet implementation class AjaxAdminCheckUseController
 */
@WebServlet("/useMember.ad")
public class AjaxAdminCheckUseController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxAdminCheckUseController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			int userNo = Integer.parseInt(request.getParameter("userNo"));
			ArrayList<Member> useList = new AdminService().selectUseList(userNo);
			response.setContentType("application/json; charset=UTF-8");
			new Gson().toJson(useList, response.getWriter());	
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
