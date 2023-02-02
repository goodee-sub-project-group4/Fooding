package com.fd.restaurant.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fd.restaurant.model.service.RestaurantService;

/**
 * Servlet implementation class RestQnaUpdateController
 */
@WebServlet("/updateAnswer.re")
public class RestQnaUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RestQnaUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qNo = Integer.parseInt(request.getParameter("qNo"));
		String aContent = request.getParameter("aContent");
		int result = new RestaurantService().updateQuestion(qNo, aContent);
		HttpSession session = request.getSession();
		if(result>0) {
			session.setAttribute("alertMsg", "답변이 등록되었습니다");
			response.sendRedirect(request.getContextPath()+"/qna.re");
		}else {
			session.setAttribute("alertMsg", "답변 등록에 실패하였습니다. 고객센터로 문의해주세요.");
			response.sendRedirect(request.getContextPath()+"/qna.re");
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
