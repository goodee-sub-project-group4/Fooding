package com.fd.review.controller;

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
import com.fd.common.model.vo.Attachment;
import com.fd.member.model.vo.Member;
import com.fd.review.model.service.ReviewService;
import com.fd.review.model.vo.Review;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class ReviewFormController
 */
@WebServlet("/reviewForm.me")
public class ReviewFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 10*1024*1024;
			// 저장시킬 물리적인 경로 제시
			String savePath = request.getSession().getServletContext().getRealPath("/resources/review_upfiles/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			// db
			HttpSession session = request.getSession();
			/* int userNo = ((Member)session.getAttribute("loginUser")).getUserNo(); */
			
			
			Review r = new Review();
			
			r.setBookNo(Integer.parseInt(multiRequest.getParameter("bookNo")));
			r.setResNo(multiRequest.getParameter("resNo"));
			r.setUserNo(Integer.parseInt(multiRequest.getParameter("userNo")));
			r.setReviewContent(multiRequest.getParameter("reviewContent"));
			r.setStar(Double.parseDouble(multiRequest.getParameter("star")));
			
			
			// Attachment 데이터 담기
			ArrayList<Attachment> list = new ArrayList<>();
			
			for(int i=1; i<=4; i++) {
				String key = "file" + i;
				if(multiRequest.getOriginalFileName(key) != null) { 
					// 있는 경우 => Attachment생성 + 원본명, 수정명, 저장경로, 파일레벨 담기
					Attachment at = new Attachment();
					at.setOriginName(multiRequest.getOriginalFileName(key));
					at.setChangeName(multiRequest.getOriginalFileName(key));
					at.setFilePath("resources/review_upfiles/");
					at.setBoardType("R");
					
					list.add(at);
					
				} 
			}
			
			int result = new ReviewService().insertReview(r, list);
			
			if(result > 0) {
				// 성공 => 리뷰리스트 페이지 (/reviewList.re)
				session.setAttribute("alertMsg", "성공적으로 게시글이 등록되었습니다.");
				response.sendRedirect(request.getContextPath() + "/reviewList.re");
				
			} else {
				// 실패 => 에러페이지 
				session.setAttribute("alertMsg", "실패했습니다.");
				response.sendRedirect(request.getContextPath() + "/reviewList.re");
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
