package com.fd.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fd.restaurant.model.service.RestaurantService;

/**
 * Servlet implementation class AdminQuestionInsertController
 */
@WebServlet("/insertAnswer.ad")
public class AdminQuestionInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminQuestionInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int qNo = Integer.parseInt(request.getParameter("qNo"));
		String aContent = request.getParameter("aContent");
		int result = new RestaurantService().updateQuestion(qNo, aContent);
		HttpSession session = request.getSession();
		if(result>0) {
			session.setAttribute("alertMsg", "답변 등록 완료");
			response.sendRedirect(request.getContextPath()+"/quList.ad");
		}else {
			session.setAttribute("alertMsg", "답변 등록 실패");
			response.sendRedirect(request.getContextPath()+"/quList.ad");
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
