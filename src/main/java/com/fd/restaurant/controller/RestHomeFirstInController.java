package com.fd.restaurant.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fd.admin.model.vo.Question;
import com.fd.restaurant.model.service.RestaurantService;
import com.fd.restaurant.model.vo.Restaurant;
import com.fd.review.model.vo.Review;

/**
 * Servlet implementation class RestFirstInController
 */
@WebServlet("/home.re")
public class RestHomeFirstInController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RestHomeFirstInController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginRest")==null) {
			session.setAttribute("alertMsg", "로그인 후 이용가능한 서비스입니다.");
			response.sendRedirect(request.getContextPath()+"/rest.admin");
		}else {
			Restaurant rest = (Restaurant)session.getAttribute("loginRest");
			if(rest.getStatus().equals("C")) { //관리자 승인 후, 첫로그인을 한 상태(첫 비번설정을 안한상태)
				request.getRequestDispatcher("views/restaurant/restFirstIn_1.jsp").forward(request, response);
			}else if(rest.getStatus().equals("Y")) { //정상적으로 이용중인 업체
				int resNo = ((Restaurant)session.getAttribute("loginRest")).getResNo();
				//새로운 문의 조회해오기
				ArrayList<Question> qList = new RestaurantService().selectNewQuestion(resNo);
				session.setAttribute("qList", qList);
				//새로운 리뷰 조회해오기
				ArrayList<Review> rList = new RestaurantService().selectNewReview(resNo);
				session.setAttribute("rList", rList);
				request.getRequestDispatcher("views/restaurant/restHome.jsp").forward(request, response);
			}
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
