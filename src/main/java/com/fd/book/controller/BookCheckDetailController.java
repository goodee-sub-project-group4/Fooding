package com.fd.book.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fd.book.model.service.BookService;
import com.fd.book.model.vo.Book;
import com.fd.book.model.vo.BookMenu;
import com.fd.book.model.vo.Point;
import com.fd.member.model.vo.Member;

/**
 * Servlet implementation class BookCheckDetailController
 */
@WebServlet("/checkDetail.bo")
public class BookCheckDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookCheckDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int bookNo = Integer.parseInt(request.getParameter("bookNo"));
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		Book book = new BookService().selectBook(bookNo);
		ArrayList<BookMenu> bookMenu = new BookService().selectBookMenuList(bookNo);
		int point = new BookService().selectPoint(userNo);
		
		request.setAttribute("book", book);
		request.setAttribute("bookMenu", bookMenu);
		request.setAttribute("point", point);
		request.getRequestDispatcher("views/book/bookCheckDetail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
