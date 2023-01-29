package com.fd.restaurant.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fd.restaurant.model.service.RestaurantService;
import com.fd.restaurant.model.vo.Restaurant;

/**
 * Servlet implementation class RestHoursUpdateController
 */
@WebServlet("/hours.re")
public class RestHoursUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RestHoursUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String openTime = request.getParameter("open");
		String closeTime = request.getParameter("close");
		String breakStart = request.getParameter("break-s");
		String breakEnd= request.getParameter("break-e");
		HttpSession session = request.getSession();
		int resNo = ((Restaurant)session.getAttribute("loginRest")).getResNo();
		
		//데이터 담기
		Restaurant r = new Restaurant();
		r.setOpen(openTime);
		r.setClose(closeTime);
		r.setBreakS(breakStart);
		r.setBreakE(breakEnd);
		r.setResNo(resNo);
		
		//업데이트하러가기. 업데이트 후 업데이트 된 회원을 조회해온다.
		Restaurant updateRest = new RestaurantService().updateHours(r);
		
		if(updateRest != null) {
			//영업시간 업데이트성공 >> 업세션에 담긴 회원정보 업데이트 해야함
			session.setAttribute("loginRest", updateRest);
			request.getRequestDispatcher("views/restaurant/restFirstIn_3.jsp").forward(request, response);
		}else {
			//영업시간 업데이트 실패 >> 정상이용 불가판단, 푸딩홈페이지로 보내버리기
			session.setAttribute("alertMsg", "영업시간 설정에 실패하였습니다. 고객센터로 문의해주세요.");
			response.sendRedirect(request.getContextPath());
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
