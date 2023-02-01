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
import com.fd.member.model.vo.Member;

/**
 * Servlet implementation class AdminFaqInsertController
 */
@WebServlet("/faqInsert.ad")
public class AdminFaqInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminFaqInsertController() {
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
			
			int userNo = ((Member)session.getAttribute("loginAdmin")).getUserNo();
			String category = request.getParameter("category");
			String faqTitle = request.getParameter("title");
			String faqContent = request.getParameter("content");
			String who = request.getParameter("who");
			
			Faq f = new Faq();
			f.setUserNo(String.valueOf(userNo));
			f.setCategory(category);
			f.setFaqTitle(faqTitle);
			f.setFaqContent(faqContent);
			f.setWho(who);
			
			int result = new AdminService().insertFaq(f);
			if(result>0) {
				session.setAttribute("alertMsg", "Faq가 등록되었습니다.");
				response.sendRedirect(request.getContextPath()+"/faqList.ad");//나중에 페이징 처리..
			}else {
				request.setAttribute("errorMsg", "Faq 등록에 실패했습니다.");
				request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
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
