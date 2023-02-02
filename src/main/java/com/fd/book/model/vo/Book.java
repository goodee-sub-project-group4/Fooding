package com.fd.book.model.vo;

import java.util.Date;

public class Book {

	private int bookNo;
	private int userNo;
	private int resNo;
	private String bookName;
	private String bookPhone;
	private Date bookDate;
	private String bookTime;
	private int people;
	private String email;
	private String request;
	private String status;
	private Date modifyDate;
	private Date bookA;
	
	public Book() {
		super();
	}

	public Book(int bookNo, int userNo, int resNo, String bookName, String bookPhone, Date bookDate, String bookTime,
			int people, String email, String request, String status, Date modifyDate, Date bookA) {
		super();
		this.bookNo = bookNo;
		this.userNo = userNo;
		this.resNo = resNo;
		this.bookName = bookName;
		this.bookPhone = bookPhone;
		this.bookDate = bookDate;
		this.bookTime = bookTime;
		this.people = people;
		this.email = email;
		this.request = request;
		this.status = status;
		this.modifyDate = modifyDate;
		this.bookA = bookA;
	}

	public int getBookNo() {
		return bookNo;
	}

	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getResNo() {
		return resNo;
	}

	public void setResNo(int resNo) {
		this.resNo = resNo;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getBookPhone() {
		return bookPhone;
	}

	public void setBookPhone(String bookPhone) {
		this.bookPhone = bookPhone;
	}

	public Date getBookDate() {
		return bookDate;
	}

	public void setBookDate(Date bookDate) {
		this.bookDate = bookDate;
	}

	public String getBookTime() {
		return bookTime;
	}

	public void setBookTime(String bookTime) {
		this.bookTime = bookTime;
	}

	public int getPeople() {
		return people;
	}

	public void setPeople(int people) {
		this.people = people;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRequest() {
		return request;
	}

	public void setRequest(String request) {
		this.request = request;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public Date getBookA() {
		return bookA;
	}

	public void setBookA(Date bookA) {
		this.bookA = bookA;
	}

	@Override
	public String toString() {
		return "Book [bookNo=" + bookNo + ", userNo=" + userNo + ", resNo=" + resNo + ", bookName=" + bookName
				+ ", bookPhone=" + bookPhone + ", bookDate=" + bookDate + ", bookTime=" + bookTime + ", people="
				+ people + ", email=" + email + ", request=" + request + ", status=" + status + ", modifyDate="
				+ modifyDate + ", bookA=" + bookA + "]";
	}

	
}
