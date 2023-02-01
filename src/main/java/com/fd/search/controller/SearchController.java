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
		int listCount; 		// 현재 게시글 총 갯수 ( => 검색결과 총 갯수로 쓰자!! )
		int currentPage; 	// 사용자가 요청한 페이지 ( == 현재 페이지)
		int pageLimit; 		// 페이지 하단에 보여질 페이징바의 페이지 최대갯수 (몇개 단위씩)
		int boardLimit; 	// 한 페이지 내에 보여질 게시글 최대 갯수 (몇개 단위씩)
		
		int maxPage; 		// 가장 마지막페이지 (총 페이지수)
		int startPage; 		// 서용자가 요청한 페이지 하단의 페이징바의 시작수
		int endPage; 		// 사용자가 요청한 페이지 하단의 페이징바의 끝수 
		
		// 3) listCount (총 게시글 갯수 => 검색결과 총 갯수)
		listCount = new SearchService().selectListCount(localCt, dLocalCt, foodCt);
		
		// 4) currentPage : 사용자가 요청한 페이지 (현재 페이지)
		currentPage = Integer.parseInt(request.getParameter("cpage")); 
		
		// 5) pageLimit : 페이징바의 페이지 최대 갯수 
		pageLimit = 10; 
		
		// 6) boardLimit : 한 페이지당 보여질 검색게시글 최대 갯수 
		boardLimit = 10; 
		
		// 7) maxPage : 제일 마지막 페이지수(총 페이지수)
		maxPage = (int)Math.ceil( (double)listCount / boardLimit ); 
		
		// 8) startPage : 페이징바의 시작수 
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1; 
		
		// 9 ) endPage : 페이징바의 끝수 
		endPage = startPage + pageLimit - 1; 
		
		// 10) 
		if(endPage > maxPage) {
			endPage = maxPage; 
		}
		
		// 11) 페이징바를 만들때 필요한 객체 생성
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		// 12) 현재 요청한 페이지(currentPage)에 보여질 검색게시글 리스트 boardLimit 수만큼 조회 
		
		ArrayList<Restaurant> list = new SearchService().selectList(pi, localCt, dLocalCt, foodCt); 
		
		request.setAttribute("pi", pi); 
		request.setAttribute("list", list); 
		
		
		request.getRequestDispatcher("views/search/practice.jsp").forward(request, response); 
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
