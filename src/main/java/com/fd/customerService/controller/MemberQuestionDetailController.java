package com.fd.customerService.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fd.admin.model.vo.Question;
import com.fd.customerService.model.service.MemberNoticeService;
import com.fd.customerService.model.vo.Attachment;


/**
 * Servlet implementation class MemberQuestionDetailController
 */
@WebServlet("/questionDetail.me")
public class MemberQuestionDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberQuestionDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int qNo = Integer.parseInt(request.getParameter("no"));
		
		MemberNoticeService mns = new MemberNoticeService();
		
		int result = mns.increaseCountQ(qNo);
		
		if(result > 0) {
			
			Question q = mns.selectQuestion(qNo);
			Attachment at = mns.selectAttachment(qNo);
			
			request.setAttribute("q", q);
			request.setAttribute("at", at);
			
			request.getRequestDispatcher("views/customerService/memberQuestionDetailView.jsp").forward(request, response);
			
		} else {
			
			// 에러페이지
			request.setAttribute("errorMsg", "상세조회 실패");
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
