package com.fd.search.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.fd.common.MyFileRenamePolicy;
import com.fd.common.model.vo.Attachment;
import com.fd.restaurant.model.vo.Restaurant;
import com.fd.search.model.service.SearchService;
import com.oreilly.servlet.MultipartRequest;

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

		/* 일단 주석처리!! 
		// 1) 요청시 전달값 뽑아서 변수에 담기 
		request.setCharacterEncoding("UTF-8"); // POST 방식일 때 사용 (연습할 때는 GET방식으로)
		
		String resName = request.getParameter("resName");
		String ceo = request.getParameter("ceo");
		String permitNo = request.getParameter("permitNo"); 
		String address = request.getParameter("address"); // 지도 api를 통해 입력받을 값 
		//String dAddress = request.getParameter("dAddress"); 
		String phone = request.getParameter("phone"); 
		String cellphone = request.getParameter("cellphone"); 
		String email = request.getParameter("email"); 
		String parking = request.getParameter("parking"); 
		String foodCt = request.getParameter("foodCt");
		
		// 2) 위의 값들을 Restaurant 객체로 만들어서 SearchService()로 전달 (매개변수 생성자 이용)
		Restaurant r = new Restaurant(resName, ceo, permitNo, address, phone, cellphone, email, parking, foodCt);
		
		// 3) 요청 처리 (db에 sql문 실행)
		int result = new SearchService().insertRes(r); 
		
		//String localCt; 		//
		//String dLocalCt; 		//
		//String applyDate; 	//sysdate로 할거임 
		//String longtitude;	//
		//String latitude;  	//
		//업체사진은 일단 나중에 하겠음!! 
		
		// 1단계 : 지도 api를 사용해서 사용자로부터 주소를 입력받음 (Address 하나만 입력받기??) 
		// 2단계 : 1단계에서 입력받은 주소값을 sql문을 사용해서 "시"와 "구" 문자열을 추출함 => extractLocal()
		// 3단계 : "시" => localCt 변수에 담기 
		//		  "구" => dLocalCt 변수에 담기 
		// 4단계 : 지도 api의 위도와 경도 값을 longtitude, latitude 변수에 담기 
		// 5단계 : 위에서 사용자로부터 입력받은 값들과, 1~4단계로 구한 값들을 sql문으로 insert => insertRes()
		
		// 의문점: 지도 api에서 주소값을 하나만 받아오는 거면 dAddress는 필요없지 않나?? 
		
		// 응답페이지 (views/search/resForm.jsp)
		//request.getRequestDispatcher("views/restaurant/resForm.jsp").forward(request, response); 
	
		if(result > 0) {
			
			HttpSession session = request.getSession(); 
			session.setAttribute("alertMsg", "성공적으로 업체등록신청이 되었습니다.");
			
			response.sendRedirect(request.getContextPath()); 
		}else {
			request.setAttribute("errorMsg", "업체등록요청을 실패했습니다."); 
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		*/
		
		// multipart/form-data로 전송하는 경우!! 
		
		
		request.setCharacterEncoding("UTF-8");
		System.out.println(ServletFileUpload.isMultipartContent(request));
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 10*1024*1024;
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/search_upfiles/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			String resName = multiRequest.getParameter("resName");
			String ceo = multiRequest.getParameter("ceo");
			String permitNo = multiRequest.getParameter("permitNo"); 
			String open = multiRequest.getParameter("open");
			String close = multiRequest.getParameter("close");
			String breakS = multiRequest.getParameter("breakS");
			String breakE = multiRequest.getParameter("breakE");
			
			// 나중에 지도 API로 받아올 변수 (address와 dAddress)
			String address = multiRequest.getParameter("address");
			String dAddress = multiRequest.getParameter("dAddress"); 
			
			String latitude = multiRequest.getParameter("latitude");
			String longtitude = multiRequest.getParameter("longtitude");
			
			// 시/도 (지역 카테고리가 될 변수)
			String localCt = multiRequest.getParameter("city"); 
			
			// 구/군 (세부지역 카테고리가 될 변수)
			String dLocalCt = multiRequest.getParameter("county"); 
			
			String phone = multiRequest.getParameter("phone"); 
			String cellphone = multiRequest.getParameter("cellphone"); 
			String email = multiRequest.getParameter("email"); 
			String parking = multiRequest.getParameter("parking"); 
			String foodCt = multiRequest.getParameter("foodCt");
			
			Restaurant r = new Restaurant(resName, ceo, permitNo, open, close, breakS, breakE, address,
					dAddress, latitude, longtitude, localCt, dLocalCt, phone, cellphone, email, parking, 
					foodCt);
			
			Attachment at = null;
			
			if(multiRequest.getOriginalFileName("rImg") != null) { // 첨부파일이 있을 경우
				at = new Attachment();
				at.setOriginName(multiRequest.getOriginalFileName("rImg"));
				at.setChangeName(multiRequest.getFilesystemName("rImg"));
				at.setFilePath("resources/search_upfiles/");
			}
			
			int result = new SearchService().insertRes(r, at);
			
			if(result > 0) {
				
				HttpSession session = request.getSession(); 
				session.setAttribute("alertMsg", "성공적으로 업체등록신청이 되었습니다.");
				
				response.sendRedirect(request.getContextPath()); // 인덱스 페이지로 보내기!! 
				
				
			}else {
				
				if(at != null) {
					new File(savePath + at.getChangeName()).delete();
				}
				
				
				request.setAttribute("errorMsg", "업체등록요청을 실패했습니다."); 
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
