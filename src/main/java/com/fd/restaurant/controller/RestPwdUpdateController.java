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
 * Servlet implementation class RestPwdUpdateController
 */
@WebServlet("/pwd.re")
public class RestPwdUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RestPwdUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userPwd = request.getParameter("userPwd");
		HttpSession session = request.getSession();
		int resNo = ((Restaurant)session.getAttribute("loginRest")).getResNo();
		
		int result = new RestaurantService().updatePwd(resNo, userPwd);
		if(result>0) {
			//비밀번호 업데이트성공 >> 다음페이지로 이등(loginRest는 업뎃할 필요 x)
			request.getRequestDispatcher("views/restaurant/restFirstIn_2.jsp").forward(request, response);
		} else {
			//비밀번호 업데이트 실패 >> 정상이용 불가판단, 푸딩홈페이지로 보내버리기
			session.setAttribute("alertMsg", "비밀번호 설정에 실패하였습니다. 고객센터로 문의해주세요.");
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
