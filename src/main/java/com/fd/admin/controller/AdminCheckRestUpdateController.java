package com.fd.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fd.admin.model.service.AdminService;
import com.fd.restaurant.model.vo.Restaurant;

/**
 * Servlet implementation class AdminCheckRestUpdateController
 */
@WebServlet("/updateRest.ad")
public class AdminCheckRestUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminCheckRestUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int resNo = Integer.parseInt(request.getParameter("resNo"));
		String resName = request.getParameter("resName");
		String ceo = request.getParameter("ceo");
		String permitNo = request.getParameter("permitNo");
		String address = request.getParameter("address");
		String dAddress = request.getParameter("dAddress");
		String phone = request.getParameter("phone");
		String cellphone = request.getParameter("cellphone");
		String email = request.getParameter("email");
		String foodCt = request.getParameter("foodCt");
		String parking = request.getParameter("parking");
		String open = request.getParameter("open");
		String close = request.getParameter("close");
		String breakS = request.getParameter("breakS");
		String breakE = request.getParameter("breakE");
		String status = request.getParameter("status");
		
		Restaurant r = new Restaurant();
		r.setResNo(resNo);
		r.setResName(resName);
		r.setCeo(ceo);
		r.setPermitNo(permitNo);
		r.setAddress(address);
		r.setdAddress(dAddress);
		r.setPhone(phone);
		r.setCellphone(cellphone);
		r.setEmail(email);
		r.setFoodCt(foodCt);
		r.setParking(parking);
		r.setOpen(open);
		r.setClose(close);
		r.setBreakS(breakS);
		r.setBreakE(breakE);
		r.setStatus(status);
		
		int result = new AdminService().updateRest(r);
		System.out.println("result : "+result);
		if(result>0) {
			request.getSession().setAttribute("alertMsg", "업체 수정 완료");
			response.sendRedirect(request.getContextPath() + "/rest.ad");
		}else {
			request.getSession().setAttribute("errorMsg", "업체 수정 실패"); //에러페이지용이라서 안떴던것
			response.sendRedirect(request.getContextPath() + "/rest.ad"); //에러페이지로 보내야함
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
