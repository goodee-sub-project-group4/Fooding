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
@WebServlet("/menuUpdate.re")
public class RestMenuUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RestMenuUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		if(ServletFileUpload.isMultipartContent(request)) {
			//1)파일업로드하기
			int maxSize = 10*1024*1024;
			String savePath = request.getSession().getServletContext().getRealPath("/resources/restUpfiles/");
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			//2)데이터담기
			HttpSession session = request.getSession();
			int resNo = ((Restaurant)session.getAttribute("loginRest")).getResNo();
			// ↓ 총 메뉴 갯수(인덱스)
			int count = Integer.parseInt(multiRequest.getParameter("count")); 
			// ↓ 기존메뉴갯수(인덱스)
			int oldCount = Integer.parseInt(multiRequest.getParameter("oldCount"))-1; 
			
			System.out.println("count : "+count);
			System.out.println("oldCount : "+oldCount);
			//2-1)기존메뉴 담기
			ArrayList<Menu> oldList = new ArrayList<>();
			for(int i=0; i<=oldCount; i++) {
				//첨부파일이 수정되었는지 여부 판단하기
				if(multiRequest.getParameter("file-changed"+i).equals("yes")) {
					//첨부파일 바뀌었을 경우 == 기존 파일은 삭제한 후 새로운 파일을 추가한다.
					new File(multiRequest.getParameter("oldfile"+i)).delete();
					Menu m = new Menu(Integer.parseInt(multiRequest.getParameter("number"+i))
							   , resNo
					           , multiRequest.getParameter("name"+i)
					           , Integer.parseInt(multiRequest.getParameter("price"+i))
					           , multiRequest.getParameter("describe"+i)
					           , "resources/restUpfiles/"+multiRequest.getFilesystemName("file"+i));
					oldList.add(m);
				} else { 
					//첨부파일이 바뀌지 않았을 경우
					Menu m = new Menu(Integer.parseInt(multiRequest.getParameter("number"+i))
							   , resNo
					           , multiRequest.getParameter("name"+i)
					           , Integer.parseInt(multiRequest.getParameter("price"+i))
					           , multiRequest.getParameter("describe"+i)
					           , multiRequest.getParameter("oldfile"+i));
					oldList.add(m);
				}
				
			}	
			
			//2-2)새로운 메뉴 담기
			ArrayList<Menu> newList = new ArrayList<>();
			if(oldCount<count) { //새로운 메뉴가 있다면
				for(int i=oldCount+1; i<=count; i++) {
					newList.add(new Menu(Integer.parseInt(multiRequest.getParameter("number"+i))
							   , resNo
					           , multiRequest.getParameter("name"+i)
					           , Integer.parseInt(multiRequest.getParameter("price"+i))
					           , multiRequest.getParameter("describe"+i)
					           , "resources/restUpfiles/"+multiRequest.getFilesystemName("file"+i)));
				}
			}
			
			System.out.println("newList : "+newList);
			
			//3) 요청처리하러가기
			//int result = new RestaurantService().updateMenu(oldList, newList);


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
