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
		
		// 1) 요청시 전달값 뽑기 & 데이터 가공처리 => 변수 또는 객체에 기록하기 
		String localCt = request.getParameter("city");	
		String dLocalCt = request.getParameter("county"); 
		String foodCt = request.getParameter("foodCt"); 
	
		// 페이징 처리
		int listCount; // 현재 게시글 총 갯수 
		int currentPage; // 사용자가 요청한 페이지 ( == 현재 페이지)
		int pageLimit; // 페이지 하단에 보여질 페이징바의 페이지 최대갯수 (몇개 단위씩)
		int boardLimit; // 한 페이지 내에 보여질 게시글 최대 갯수 (몇개 단위씩)
		// 위의 4개를 가지고 아래의 3개의 값을 구할꺼임
		int maxPage; // 가장 마지막페이지 (총 페이지수)
		int startPage; // 서용자가 요청한 페이지 하단의 페이징바의 시작수
		int endPage; // 사용자가 요청한 페이지 하단의 페이징바의 끝수 
		
		// listCount : 총 게시글 갯수 
		listCount = new SearchService().selectListCount(localCt, dLocalCt, foodCt);
		
		// * currentPage : 사용자가 요청한 페이지 (현재 페이지)
		currentPage = Integer.parseInt(request.getParameter("cpage")); 
				
		// * pageLimit : 페이징바의 페이지 최대 갯수 (단위)
		pageLimit = 10; 
		
		// * boardLimit : 한 페이지당 보여질 게시글 최대 갯수 (단위)
		boardLimit = 10; 
		
		// * maxPage : 제일 마지막 페이지수(총 페이지수)
		// listCount(실수형) / boardLimit => 올림처리 (나머지가 있기라도 하면 무조건 올림처리 해야되므로)
		maxPage = (int)Math.ceil( (double)listCount / boardLimit ); 
		
		// * startPage : 페이징바의 시작수 
		startPage = (currentPage-1) / pageLimit * pageLimit + 1; //이해안됨 걍 암기
		
		// * endPage : 페이징바의 끝 수 
		endPage = startPage + pageLimit - 1; 
		
		// startPage가 11일 경우 endPage는 20으로 됨 (근데 maxPage가 고작 13까지밖에 안되면?)
		if(endPage > maxPage) {
			endPage = maxPage; 
		}
		
		// com.br.common.model.vo.PageInfo 
		// * 페이징바를 만들때 필요한 객체 
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage); 
		
		// * 현재 요청한 페이지(currentPage)에 보여질 게시글 리스트 boardLimit 수만큼 조회 
		ArrayList<Restaurant> list = new SearchService().selectList(pi, localCt, dLocalCt, foodCt);
		
		request.setAttribute("pi", pi); 
		request.setAttribute("list", list); 
		
		// 응답페이지 (views/search/search.jsp); 
		request.getRequestDispatcher("views/search/search.jsp").forward(request, response); 
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
