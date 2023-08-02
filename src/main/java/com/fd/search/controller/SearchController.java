package com.fd.search.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fd.common.model.vo.PageInfo;
import com.fd.restaurant.model.vo.Restaurant;
import com.fd.search.model.service.SearchService;

/**
 * Servlet implementation class SearchController
 */
@WebServlet("/search.res")
public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		// 1) 사용자로부터 전달받은 값 뽑아서 변수에 저장 
		String localCt = request.getParameter("city");	
		String dLocalCt = request.getParameter("county"); 
		String foodCt = request.getParameter("foodCt"); 
		// 2) 페이징처리를 위한 변수 설정 
		int listCount; 		
		int currentPage; 	
		int pageLimit; 		
		int boardLimit; 	
		int maxPage; 		
		int startPage; 		
		int endPage; 		
		
		listCount = new SearchService().selectListCount(localCt, dLocalCt, foodCt);
		currentPage = Integer.parseInt(request.getParameter("cpage")); 
		pageLimit = 10; 
		boardLimit = 10; 
		maxPage = (int)Math.ceil( (double)listCount / boardLimit ); 
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1; 
		endPage = startPage + pageLimit - 1; 
		
		if(endPage > maxPage) {
			endPage = maxPage; 
		}
		
		// 3) 페이징바를 만들때 필요한 객체 생성
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		// 4) 현재 요청한 페이지(currentPage)에 보여질 검색게시글 리스트 boardLimit 수만큼 조회 	
		ArrayList<Restaurant> list = new SearchService().selectList(pi, localCt, dLocalCt, foodCt); 
		
		request.setAttribute("pi", pi); 
		request.setAttribute("list", list); 
		request.setAttribute("localCt", localCt);
		request.setAttribute("dLocalCt", dLocalCt);
		request.setAttribute("foodCt", foodCt);
		
		request.getRequestDispatcher("views/search/categorySearch.jsp").forward(request, response); 
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
