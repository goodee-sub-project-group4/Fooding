package com.fd.customerService.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fd.admin.model.vo.Notice;
import com.fd.customerService.model.service.MemberNoticeService;

/**
 * Servlet implementation class MemberNoticeDetailController
 */
@WebServlet("/noticeDetail.me")
public class MemberNoticeDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberNoticeDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int noticeNo = Integer.parseInt(request.getParameter("no")); // 조회한 글번호
		
		int result = new MemberNoticeService().increaseCount(noticeNo);
		
		if(result > 0) { // 조회가능한 공지사항
			// 성공 => views/customerService/memberNoticeDetailView.jsp
			// 상세조회해야함
			Notice n = new MemberNoticeService().selectMemberNoticeDetail(noticeNo);
			
			request.setAttribute("notice", n);
			request.getRequestDispatcher("views/customerService/memberNoticeDetailView.jsp").forward(request, response);
			
		} else {
			// 실패 => 에러페이지
		
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
