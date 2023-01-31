package com.fd.search.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fd.restaurant.model.vo.Restaurant;
import com.fd.search.model.service.SearchService;

/**
 * Servlet implementation class ResFormController
 */
@WebServlet("/resForm.res")
public class ResFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 1) 요청시 전달값 뽑아서 변수에 담기 
		request.setCharacterEncoding("UTF-8"); // POST 방식일 때 사용 (연습할 때는 GET방식으로)
		
		String resName = request.getParameter("resName");
		String ceo = request.getParameter("ceo");
		String permitNo = request.getParameter("permitNo"); 
		String address = request.getParameter("address"); 
		String dAddress = request.getParameter("dAddress"); 
		String phone = request.getParameter("phone"); 
		String cellphone = request.getParameter("cellphone"); 
		String email = request.getParameter("email"); 
		String parking = request.getParameter("parking"); 
		String foodCt = request.getParameter("foodCt");
		
		// 2) 위의 값들을 Restaurant 객체로 만들어서 SearchService()로 전달 (매개변수 생성자 이용)
		Restaurant r = new Restaurant(resName, ceo, permitNo, address, dAddress, phone, cellphone, email, parking, foodCt);
		
		// 3) 요청 처리 (db에 sql문 실행)
		int result = new SearchService().insertRes(r); 
		
		
		//String localCt; 		//sql로 조회해올거임 
		//String dLocalCt; 		//sql로 조회해올거임
		//String applyDate; 	//sysdate로 할거임 
		//String longtitude;	//팀장님이 사용하실 변수(지도api)
		//String latitude;  	//팀장님이 사용하실 변수(지도api) 
		//업체사진은 일단 나중에 하겠음!! 
		
		// address를 사용자한테 입력받을 때 최소한 "시"와 "구"가 포함되도록 하자 
		// ex) OO시 OO구 형식으로 적어주세요 (placeholder)
		// 그런 다음 address에 포함되어있는 "시 이름"과 "구 이름"을 sql문으로 추출해서 
		// 추출한 시 이름은 => localCt 변수에, 
		// 추출한 구 이름은 => dLocalCt 변수에 담기! 
		
		// 한 마디로, 이 컨트롤러 안에서는 
		// (1) localCt와 dLocalCt를 추출하는 메소드 --> extractLocal() 
		// (2) 위에서 구한 데이터까지 포함해서 Restaurant 테이블에 전달값을 insert하는 메소드 
		// 이렇게 두 개의 메소드가 필요함 !! --> insertRes()
		

		
		// 응답페이지 (views/search/resForm.jsp)
		request.getRequestDispatcher("views/search/resForm.jsp").forward(request, response); 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
