package com.fd.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.fd.admin.model.service.AdminService;
import com.fd.common.MyFileRenamePolicy;
import com.fd.common.model.vo.Attachment;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class AdminBannerUpdateController
 */
@WebServlet("/baUpdate.ad")
public class AdminBannerUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminBannerUpdateController() {
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
			String savePath = request.getSession().getServletContext().getRealPath("/resources/mainBanner_upfiles/");
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
//			ArrayList<Attachment> list = new ArrayList<>();
			
			Attachment at = null;
			
			for(int i=1; i<=3; i++) {
				String key = "file" + i;
				
				if(multiRequest.getOriginalFileName("key") != null) {
				
					at = new Attachment();
					at.setOriginName(multiRequest.getOriginalFileName(key));
					at.setChangeName(multiRequest.getFilesystemName(key));
					at.setFilePath("resources/mainBanner_upfiles/");
					at.setFileNo(Integer.parseInt(multiRequest.getParameter("originFileNo")));	
				}
			}
			
			int result = new AdminService().updateBanner(at);
			if(result>0) {
				request.getSession().setAttribute("alertMsg", "수정 완료");
				response.sendRedirect(request.getContextPath()+"/banner.ad");
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
