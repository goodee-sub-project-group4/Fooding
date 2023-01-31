package com.fd.search.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class BeforeSearchController
 */
@WebServlet("/before.sh")
public class BeforeSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BeforeSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 로그인 전 vs 후를 나누는 이유 
		// 로그인 전이나 로그인 후나 "보여질 페이지 화면은 완전히 똑같은데", 
		// "로그인한 회원"만 찜을 할 수 있으므로 
		// 일단 로그인 전 vs 후 로 나누겠음!! 
		
		HttpSession session = request.getSession(); 
		
		if(session.getAttribute("loginUser") == null) { // 로그인 전 => 찜하기 못함 
			// 찜하기 구현 후 작성할 코드 
			// 하트(찜하기기능)를 눌렀을 경우, "로그인 후 이용가능한 이용가능한 서비스입니다."가 alertMsg로 뜨도록 
			// session.setAttribute("alertMsg", "로그인 후 이용가능한 서비스입니다."); 
			
			request.getRequestDispatcher("views/search/search4.jsp").forward(request, response);
		}else { // 로그인 후 
			
			request.getRequestDispatcher("views/search/search4.jsp").forward(request, response);
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
