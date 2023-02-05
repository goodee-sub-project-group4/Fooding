package com.fd.customerService.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fd.admin.model.vo.Faq;
import com.fd.common.model.vo.PageInfo;
import com.fd.customerService.model.service.MemberNoticeService;

/**
 * Servlet implementation class MemberFAQListController
 */
@WebServlet("/faq.me")
public class MemberFAQListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberFAQListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// 페이징
		int listCount; // 현재게시글 총 개수
		int currentPage; // 사용자가 요청한 페이지 == 현재페이지
		int pageLimit; // 페이징바의 페이지 최대갯수
		int boardLimit; // 페이지에 보여질 게시글 개수
		
		int maxPage; // 가장마지막페이지 (총 페이지 수)
		int startPage; // 사용자가 요청한 페이지 하단의 페이징 바의 시작수
		int endPage; // 사용자가 요청한 페이지 하단의 페이징 바의 끝수
		
		listCount = new MemberNoticeService().selectListCount();
		// 여기까지 성공
		
		currentPage = Integer.parseInt(request.getParameter("cpage"));
		pageLimit = 5;
		boardLimit = 10;
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		startPage = (currentPage-1) / pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		// com.fd.common.model.vo.PageInfo
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage); 
		ArrayList<Faq> list = new MemberNoticeService().selectFAQList(pi);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/customerService/memberFAQListView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
