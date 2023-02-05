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
		
		// 페이징처리 
		int listCount;		// 현재 게시글 총 갯수
		int currentPage;	// 사용자가 요청한 페이지 (== 현재 페이지)
		int pageLimit;		// 페이지 하단에 보여질 페이징바의 페이지 최대갯수(몇개 단위씩)
		int boardLimit;		// 한 페이지 내에 보여질 게시글 최대갯수(몇개 단위씩)
		
		int maxPage;		// 가장 마지막페이지 (총 페이지 수)
		int startPage;		// 사용자가 요청한 페이지 하단의 페이징바의 시작수
		int endPage;
		
		// * listCount : 총 게시글 갯수
		listCount = new SearchService().selectGoodCount(userNo);
	
		// * currentPage : 사용자가 요청한 페이지 (현재 페이지)
		currentPage = Integer.parseInt(request.getParameter("cpage"));
		
		// * pageLimit : 페이징바의 페이지 최대 갯수 (단위)
		pageLimit = 10;
	
		// * boardLimit : 한 페이지당 보여질 게시글 최대 갯수 (단위)
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
