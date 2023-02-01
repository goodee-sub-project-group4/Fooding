package com.fd.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fd.admin.model.service.AdminService;
import com.fd.admin.model.vo.Faq;

/**
 * Servlet implementation class AdminFaqUpdateController
 */
@WebServlet("/faqUpdate.ad")
public class AdminFaqUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminFaqUpdateController() {
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
			
			request.setCharacterEncoding("UTF-8");
//			int faqNo = Integer.parseInt(request.getParameter("no"));
			String faqCategory = request.getParameter("category");
			String faqTitle = request.getParameter("title");
			String faqContent = request.getParameter("content");
			String modifyDate = request.getParameter("modifyDate");
			
			Faq f = new Faq();
			
			
			int result = new AdminService().updateFaq();
			if(result>0) {
				request.getSession().setAttribute("alertMsg", "수정 완료");
				response.sendRedirect(request.getContextPath() + "/faqList.ad=");
			}

			request.getRequestDispatcher("views/admin/faqUpdate.jsp").forward(request, response);
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
