package com.fd.search.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fd.member.model.vo.Member;
import com.fd.search.model.service.SearchService;

/**
 * Servlet implementation class GoodDeleteController
 */
@WebServlet("/deleteListZzim.sh")
public class GoodDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GoodDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int resNo = Integer.parseInt(request.getParameter("resNo"));
		HttpSession session = request.getSession(); 
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo(); 
		
		int result = new SearchService().deleteGood(resNo, userNo); 
		
		if(result> 0) {
			session.setAttribute("alertMsg", "찜하기 목록에서 삭제가 완료되었습니다."); 
			response.sendRedirect(request.getContextPath() + "/zzim.is");

		} else {
			session.setAttribute("alertMsg", "찜하기 삭제 실패");
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
