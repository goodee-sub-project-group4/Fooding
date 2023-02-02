package com.fd.restaurant.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.fd.common.MyFileRenamePolicy;
import com.fd.restaurant.model.service.RestaurantService;
import com.fd.restaurant.model.vo.Menu;
import com.fd.restaurant.model.vo.Restaurant;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class RestMenuUpdateController
 */
@WebServlet("/menuInsert.re")
public class RestMenuInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RestMenuInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			//파일업로드처리
			int maxSize = 10*1024*1024;
			String savePath = request.getSession().getServletContext().getRealPath("/resources/rest_upfiles/");
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			//데이터담기
			HttpSession session = request.getSession();
			int resNo = ((Restaurant)session.getAttribute("loginRest")).getResNo();
			int count = Integer.parseInt(multiRequest.getParameter("count")); //메뉴갯수
			ArrayList<Menu> list = new ArrayList<>();
			for(int i=0; i<= count; i++ ) { 
				list.add(new Menu(resNo
						        , multiRequest.getParameter("name"+i)
						        , Integer.parseInt(multiRequest.getParameter("price"+i))
						        , multiRequest.getParameter("describe"+i)
						        , "resources/rest_upfiles/"+multiRequest.getFilesystemName("file"+i)));
			}
			
			//DB 처리하기
			int result = new RestaurantService().insertMenu(list);
			
			System.out.println("result : "+result);
			//응답뷰지정
			if(result>0) {
				session.setAttribute("alertMsg", "초기설정이 완료되었습니다.");
				response.sendRedirect(request.getContextPath()+"/home.re");
			} else {
				//업로드된 첨부파일 삭제하기
				for(int i=0; i<list.size(); i++) {
					new File(list.get(i).getmImg()).delete();
				}
				//메뉴 업데이트 실패 >> 정상이용 불가판단, 푸딩홈페이지로 보내버리기
				session.setAttribute("alertMsg", "메뉴 추가에 실패하였습니다. 고객센터로 문의해주세요.");
				response.sendRedirect(request.getContextPath());
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
