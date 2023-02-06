package com.fd.search.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fd.member.model.vo.Member;
import com.fd.search.model.service.SearchService;

/**
 * Servlet implementation class GoodCTController
 */
@WebServlet("/goodCt.sh")
public class GoodCTController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GoodCTController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		System.out.println(userNo); 
		
		int resNo = Integer.parseInt(request.getParameter("resNo"));
		System.out.println(resNo); 
		
		int result = new SearchService().insertGood(resNo, userNo); 
		
		
		//* result 값이 0일 경우, 이미 찜하기가 되어있다는 얘기 이므로, 되어있는 찜을 삭제할 메소드
		if(result < 1) {
			result = new SearchService().deleteGood(resNo, userNo);
			// 위의 식에 의해서 찜하기 삭제가 된 다음, 다시 result 값이 1이 되었을 거임 
			// 사용자에게 찜하기가 성공적으로 되었고, 찜하기가 성공적으로 삭제되었다는 것을 알려주기 위해선 
			// 두 result 값을 다르게 해서 구분지어야 하므로 
			// 찜하기 삭제가 성공적으로 실행된 경우는 result 값을 0으로 바꿔놓도록 하겠음!! 
			
			result = 0; 
		}
		
		// 찜하기가 성공적으로 DB에 삽입되었을 경우 돌아올 result 값 => 1 
		// 찜하기가 성공적으로 DB에서 삭제되었을 경우 돌아올 result 값 => 0
		
		response.getWriter().print(result); 
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
