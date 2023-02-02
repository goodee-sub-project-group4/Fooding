package com.fd.restaurant.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fd.admin.model.vo.Question;
import com.fd.restaurant.model.service.RestaurantService;

/**
 * Servlet implementation class RestQnaDetailController
 */
@WebServlet("/qnaDetail.re")
public class RestQnaDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RestQnaDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qNo = Integer.parseInt(request.getParameter("no"));
		Question q = new RestaurantService().selectDetailQuestion(qNo);
		if(q==null) {
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "게시글 조회에 실패하였습니다. 고객센터로 문의해주세요.");
			response.sendRedirect(request.getContextPath()+"/qna.re");
		}else {
			request.setAttribute("q", q);
			request.getRequestDispatcher("views/restaurant/restQnaAnswer.jsp").forward(request, response);
			
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
