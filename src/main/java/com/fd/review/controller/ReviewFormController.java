package com.fd.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.fd.common.MyFileRenamePolicy;
import com.fd.member.model.vo.Member;
import com.fd.review.model.vo.Review;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class ReviewFormController
 */
@WebServlet("/reviewForm.re")
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
			int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
			
			Review r = new Review();
			
			// 업체명 담아야함~~
			r.setUserNo(Integer.parseInt(multiRequest.getParameter("userNo")));
			r.setReviewContent(multiRequest.getParameter("reviewContent"));
			r.setStar(Double.parseDouble(multiRequest.getParameter("star")));
			
			
			
			
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
