package com.fd.restaurant.controller;

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
import com.fd.restaurant.model.service.RestaurantService;
import com.fd.restaurant.model.vo.Restaurant;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class RestInfoUpdate
 */
@WebServlet("/updateInfo.re")
public class RestInfoUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RestInfoUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		if(ServletFileUpload.isMultipartContent(request)) {
			//1) 파일업로드하기
			int maxSize = 10*1024*1024;
			String savePath = request.getSession().getServletContext().getRealPath("/resources/rest_upfiles/");
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			//2) 데이터 뽑아서 담기
			Restaurant r = new Restaurant();
			HttpSession session = request.getSession();
			r.setResNo(((Restaurant)session.getAttribute("loginRest")).getResNo());
			r.setPhone(multiRequest.getParameter("phone"));
			r.setCellphone(multiRequest.getParameter("cellPhone"));
			r.setAddress(multiRequest.getParameter("address"));
			r.setdAddress(multiRequest.getParameter("dAddress"));
			r.setEmail(multiRequest.getParameter("email"));
			r.setFoodCt(multiRequest.getParameter("foodCt"));
			r.setParking(multiRequest.getParameter("parking"));
			r.setOpen(multiRequest.getParameter("open"));
			r.setClose(multiRequest.getParameter("close"));
			r.setBreakS(multiRequest.getParameter("break-s"));
			r.setBreakE(multiRequest.getParameter("break-e"));
			// 첨부사진 변경여부 확인후 데이터 담기
			if(multiRequest.getOriginalFileName("rImg") != null) {
				//첨부파일 바뀌었을 경우 == 기존 파일은 삭제한 후 새로운 파일저장
				new File(multiRequest.getParameter("oldfile")).delete();
				r.setrImg("resources/rest_upfiles/"+multiRequest.getFilesystemName("rImg"));
			} else { 
				//첨부파일이 바뀌지 않았을 경우
				r.setrImg(multiRequest.getParameter("oldfile"));
			}

			//3) 서비스요청
			Restaurant updateRest = new RestaurantService().updateInfo(r);
			
			//4) 응답뷰지정
			if(updateRest != null) {
				session.setAttribute("loginRest", updateRest); //세션에 담긴 업체정보 바꾸기
				session.setAttribute("alertMsg", "성공적으로 매장 정보를 수정하였습니다.");
				response.sendRedirect(request.getContextPath()+"/info.re");
			} else {
				session.setAttribute("alertMsg", "정보 수정에 실패하였습니다. 고객센터로 문의해주세요.");
				response.sendRedirect(request.getContextPath()+"/info.re");
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
