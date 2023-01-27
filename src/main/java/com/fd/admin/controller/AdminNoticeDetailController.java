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
 * Servlet implementation class AdminNoticeDetailController
 */
@WebServlet("/noDetail.ad")
public class AdminNoticeDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNoticeDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int noticeNo = Integer.parseInt(request.getParameter("no"));
		AdminService nService = new AdminService();
		
		int result = nService.increaseCount(noticeNo);
		if(result>0) {
			Notice n = nService.selectNotice(noticeNo);
			Attachment at = nService.selectAttachment(noticeNo);
				// 마저 해야됨
			request.setAttribute("n", n);
			request.setAttribute("at", at);
			request.getRequestDispatcher("views/admin/noticeDetailView.jsp").forward(request, response);
			
		} else {
			request.setAttribute("errorPage", "상세조회 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
