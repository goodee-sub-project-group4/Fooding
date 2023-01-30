package com.fd.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.fd.admin.model.service.AdminService;
import com.fd.admin.model.vo.Notice;
import com.fd.common.MyFileRenamePolicy;
import com.fd.common.model.vo.Attachment;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class AdminNoticeUpdateController
 */
@WebServlet("/noUpdate.ad")
public class AdminNoticeUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNoticeUpdateController() {
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
			
			int NoticeNo = Integer.parseInt(multiRequest.getParameter("no"));
			String noticeTitle = multiRequest.getParameter("title");
			String noticeContent = multiRequest.getParameter("content");
			
			Notice n = new Notice();
			n.setNoticeNo(NoticeNo);
			n.setNoticeTitle(noticeTitle);
			n.setNoticeContent(noticeContent);
			
			Attachment at = null;
			if(multiRequest.getOriginalFileName("upfile") != null) {
				// 새로 넘어온 첨부파일 있을 경우 Attachment 객체 생성
				at = new Attachment();
				at.setOriginName(multiRequest.getOriginalFileName("upfile"));
				at.setChangeName(multiRequest.getFilesystemName("upfile"));
				at.setFilePath("resources/notice_upfiles/");
				
				if(multiRequest.getParameter("originFileNo") != null) {
					// 기존 첨부파일 있었을 경우 => update attachment(기존 파일번호 필요)
					at.setFileNo(Integer.parseInt(multiRequest.getParameter("originFileNo")));
				}else {
					// 기존 첨부파일 없었을 경우 => insert attachment(현재게시글번호 필요)
					at.setRefBoardNo(NoticeNo);
				}
			}
			
			int result = new AdminService().updateNotice(n, at);
			if(result>0) {
				request.getSession().setAttribute("alertMsg", "수정 완료");
				response.sendRedirect(request.getContextPath() + "/noDetail.ad?no=" + NoticeNo);
			}else {
				request.getSession().setAttribute("errorMsg", "수정 실패");
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
