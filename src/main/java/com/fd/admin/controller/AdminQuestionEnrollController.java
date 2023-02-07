package com.fd.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fd.admin.model.service.AdminService;
import com.fd.admin.model.vo.Question;

/**
 * Servlet implementation class AdminQuestionEnrollController
 */
@WebServlet("/quEnroll.ad")
public class AdminQuestionEnrollController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminQuestionEnrollController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("loginAdmin")==null) {
			session.setAttribute("alertMsg", "로그인 후 이용가능한 서비스입니다.");
			response.sendRedirect(request.getContextPath()+"/rest.admin");
		}else {	
			int qNo = Integer.parseInt(request.getParameter("no"));
			Question q = new AdminService().selectDetailQuestion(qNo);
			if(q==null) {
				session.setAttribute("alertMsg", "게시글 조회 실패");
				response.sendRedirect(request.getContextPath()+"/quList.ad");
			}else {
				request.setAttribute("q", q);
				request.getRequestDispatcher("views/admin/questionEnroll.jsp").forward(request, response);
				
			}
			
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
