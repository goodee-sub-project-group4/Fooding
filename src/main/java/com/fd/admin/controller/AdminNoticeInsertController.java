package com.fd.admin.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.fd.admin.model.service.AdminService;
import com.fd.admin.model.vo.Notice;
import com.fd.common.MyFileRenamePolicy;
import com.fd.common.model.vo.Attachment;
import com.fd.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class AdminNoticeInsertController
 */
@WebServlet("/noInsert.ad")
public class AdminNoticeInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNoticeInsertController() {
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
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/notice_upfiles/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			String noticeTitle = multiRequest.getParameter("title");
			String noticeContent = multiRequest.getParameter("content");
			
			HttpSession session = request.getSession();
			int userNo = ((Member)session.getAttribute("loginAdmin")).getUserNo();
			
//			String toWhom = multiRequest.getParameter("toWhom");
			String boardType = multiRequest.getParameter("boardType");	// boardType 숨겨서 담을 예정
			
			
			Notice n = new Notice();
			n.setNoticeTitle(noticeTitle);
			n.setNoticeContent(noticeContent); 	
			n.setUserNo(String.valueOf(userNo));
//			n.setToWhom(toWhom);
			n.setBoardType(boardType);
			
			
			Attachment at = null;
			if(multiRequest.getOriginalFileName("upfile") != null) {
				at = new Attachment();
				at.setOriginName(multiRequest.getOriginalFileName("upfile"));
				at.setChangeName(multiRequest.getFilesystemName("upfile"));
				at.setFilePath("resources/notice_upfiles/");
			}
			
			int result = new AdminService().insertNotice(n, at);
			
			if(result > 0) {
				session.setAttribute("alertMsg", "공지사항이 등록되었습니다.");
				response.sendRedirect(request.getContextPath()+"/noList.ad");//나중에 페이징 처리하면 /noList.ad?cpage=1
			}else {
				if(at != null) { // 실패하면 업로드된 첨부파일 삭제해야됨
					new File(savePath + at.getChangeName()).delete();
				}
				request.setAttribute("errorMsg", "공지사항 등록 실패");
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
