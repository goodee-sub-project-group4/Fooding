package com.fd.restaurant.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fd.admin.model.vo.Black;
import com.fd.restaurant.model.service.RestaurantService;
import com.fd.restaurant.model.vo.Restaurant;

/**
 * Servlet implementation class AjaxRestBlackController
 */
@WebServlet("/black.re")
public class AjaxRestBlackController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxRestBlackController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String reviewNo = request.getParameter("reviewNo");
		String blackContent = request.getParameter("blackContent");
		HttpSession session = request.getSession();
		int resNo = ((Restaurant)session.getAttribute("loginRest")).getResNo();
		Black b = new Black();
		b.setBlackContent(blackContent);
		b.setbPerson(String.valueOf(resNo));
		b.settPerson(reviewNo);
		
		//요청처리하러가기
		int result = new RestaurantService().insertBlack(b);
		
		//결과보내기
		response.setContentType("text/html; charset=UTF-8"); 
		response.getWriter().print(result);		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
