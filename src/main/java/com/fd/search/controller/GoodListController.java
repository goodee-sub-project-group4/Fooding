package com.fd.search.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fd.common.model.vo.PageInfo;
import com.fd.member.model.vo.Member;
import com.fd.restaurant.model.vo.Restaurant;
import com.fd.search.model.service.SearchService;

/**
 * Servlet implementation class GoodListController
 */
@WebServlet("/goodList.sh")
public class GoodListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GoodListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// GOOD 테이블에 담긴 데이터들을 조회해와서 화면에 뿌릴 컨트롤러
		
		// 회원번호 뽑기 
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		
		System.out.println(userNo);
		
		// 페이징처리 
		int listCount;		
		int currentPage;	
		int pageLimit;		
		int boardLimit;		
		
		int maxPage;		
		int startPage;		
		int endPage;
		
		listCount = new SearchService().selectGoodCount(userNo);
		System.out.println(listCount); 
		
		currentPage = Integer.parseInt(request.getParameter("cpage"));
		
		pageLimit = 10;
	
		boardLimit = 10;
		
		maxPage = (int)Math.ceil( (double)listCount / boardLimit );
	
		startPage = (currentPage-1) / pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<Restaurant> list = new SearchService().selectGoodList(pi, userNo);
	
		request.setAttribute("pi", pi); 
		request.setAttribute("list", list); 
	
		request.getRequestDispatcher("views/search/zzim.jsp").forward(request, response); 
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
