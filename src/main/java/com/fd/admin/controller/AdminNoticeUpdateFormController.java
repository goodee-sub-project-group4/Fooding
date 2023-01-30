package com.fd.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fd.admin.model.service.AdminService;
import com.fd.admin.model.vo.Notice;
import com.fd.common.model.vo.Attachment;

/**
 * Servlet implementation class AdminNoticeUpdateController
 */
@WebServlet("/noUpdateForm.ad")
public class AdminNoticeUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNoticeUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int noticeNo = Integer.parseInt(request.getParameter("no"));
		
		AdminService aService = new AdminService();
		
		Notice n =aService.selectNotice(noticeNo);
		Attachment at = aService.selectNoticeAttachment(noticeNo);
		
		request.setAttribute("n", n);
		request.setAttribute("at", at);
		
		request.getRequestDispatcher("views/admin/noticeUpdate.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
