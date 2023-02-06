package com.fd.customerService.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.fd.admin.model.vo.Question;
import com.fd.common.MyFileRenamePolicy;
import com.fd.customerService.model.service.MemberNoticeService;
import com.fd.customerService.model.vo.Attachment;
import com.fd.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class MemberQuestionEnrollAdminController
 */
@WebServlet("/questionAdmin.me")
public class MemberQuestionEnrollAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberQuestionEnrollAdminController() {
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
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/cs_files/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			String category = multiRequest.getParameter("category");
			String qTitle = multiRequest.getParameter("qTitle");
			String qContent = multiRequest.getParameter("qContent");
			
			HttpSession session = request.getSession();
			int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
			
			Question q = new Question();
			q.setCategory(category);
			q.setqTitle(qTitle);
			q.setqContent(qContent);
			q.setqPerson(String.valueOf(userNo));
			
			Attachment at = null;
			
			if(multiRequest.getOriginalFileName("upfile") != null) {
				at = new Attachment();
				at.setOriginName(multiRequest.getOriginalFileName("upfile"));
				at.setChangeName(multiRequest.getFilesystemName("upfile"));
				at.setFilePath("resources/sc_files");
			}
			
			int result = new MemberNoticeService().insertQuestion(q, at);
			
			if(result > 0) {
				session.setAttribute("alertMsg", "일반게시글 작성 성공");
				response.sendRedirect(request.getContextPath() + "/questionEnrollAdmin.me");
			} else {
				
				if(at != null) {
					new File(savePath + at.getChangeName()).delete();
				}
				
				request.setAttribute("errorMsg", "문의글 작성 실패");
				request.getRequestDispatcher("views/common/errorPage.jsp");
				
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
