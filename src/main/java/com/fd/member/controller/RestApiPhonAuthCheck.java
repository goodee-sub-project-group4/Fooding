
package com.fd.member.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fd.common.sms.SmsConst;
import com.fd.member.model.service.MemberService;

/**
 * Servlet implementation class RestApiPhonAuthCheck
 */
@WebServlet("/RestApiPhonAuthCheck.me")
public class RestApiPhonAuthCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RestApiPhonAuthCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String to = request.getParameter("to");
		String text = request.getParameter("text");
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("from", SmsConst.FROM_SEND_MASTER);
		map.put("to", to);
		map.put("text", text);
		map.put("type", "SMS");
		
		System.out.println("map ==>" + map);
		
		try {
			new MemberService().sendMessage(map);
			
		} catch (Exception e) {
			e.printStackTrace();
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
