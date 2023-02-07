package com.fd.book.model.vo;


public class Book {
	
	private int bookNo;
	private int userNo;
	private int resNo;
	private String resName;
	private String bookName;
	private String bookPhone;
	private String bookDate;
	private String bookTime;
	private int people;
	private String email;
	private String request;
	private String status;
	private String modifyDate;
	private String bookA;
	private int payTotal;
	private int payPoint;
	private String payOp;
	private String rImg;
	private double longtitude;
	private double latitude;
	private String payDate;
	private int pointTrade;
	private int pointNow;
	private String resPhone;
	private String address;
	private String dAddress;
	private int payNo;
	
	public Book() {}

	public Book(int bookNo, int userNo, int resNo, String resName, String bookName, String bookPhone, String bookDate, String bookTime,
			int people, String email, String request, String status, String modifyDate, String bookA, int payTotal, int payPoint, String payOp,
			String rImg) {
		super();
		this.bookNo = bookNo;
		this.userNo = userNo;
		this.resNo = resNo;
		this.resName = resName;
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
		this.payTotal = payTotal;
		this.payPoint = payPoint;
		this.payOp = payOp;
		this.rImg = rImg;
	}
	
	public Book(int userNo, int resNo, String bookName, String bookPhone, String bookDate, String bookTime,
			int people, String email, String request) {
		super();
		this.userNo = userNo;
		this.resNo = resNo;
		this.bookName = bookName;
		this.bookPhone = bookPhone;
		this.bookDate = bookDate;
		this.bookTime = bookTime;
		this.people = people;
		this.email = email;
		this.request = request;
	}
	
	public Book(int bookNo, int resNo, String bookName, String bookPhone, String bookDate, String bookTime, int people,
			String email, String request, String status, String modifyDate, String bookA) {
		super();
		this.bookNo = bookNo;
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
	
	public Book(int bookNo, String resName, String bookName, String bookPhone, String bookDate, String bookTime,
			int people, String email, String request, String status, String modifyDate, String bookA, int payTotal,
			int payPoint, String payOp, String address, String dAddress, double longtitude, double latitude, String payDate,
			int pointTrade, int pointNow, String resPhone) {
		super();
		this.bookNo = bookNo;
		this.resName = resName;
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
		this.payTotal = payTotal;
		this.payPoint = payPoint;
		this.payOp = payOp;
		this.address = address;
		this.dAddress = dAddress;
		this.longtitude = longtitude;
		this.latitude = latitude;
		this.payDate = payDate;
		this.pointTrade = pointTrade;
		this.pointNow = pointNow;
		this.resPhone = resPhone;
	}
	
	public Book(int userNo, int resNo, String status, int payTotal, int payPoint, String payOp, int payNo, String resName) {
		super();
		this.userNo = userNo;
		this.resNo = resNo;
		this.status = status;
		this.payTotal = payTotal;
		this.payPoint = payPoint;
		this.payOp = payOp;
		this.payNo = payNo;
		this.resName = resName;
	}

	public int getPayNo() {
		return payNo;
	}

	public void setPayNo(int payNo) {
		this.payNo = payNo;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getdAddress() {
		return dAddress;
	}

	public void setdAddress(String dAddress) {
		this.dAddress = dAddress;
	}

	public double getLongtitude() {
		return longtitude;
	}

	public void setLongtitude(double longtitude) {
		this.longtitude = longtitude;
	}

	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public String getPayDate() {
		return payDate;
	}

	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}

	public int getPointTrade() {
		return pointTrade;
	}

	public void setPointTrade(int pointTrade) {
		this.pointTrade = pointTrade;
	}

	public int getPointNow() {
		return pointNow;
	}

	public void setPointNow(int pointNow) {
		this.pointNow = pointNow;
	}

	public String getResPhone() {
		return resPhone;
	}

	public void setResPhone(String resPhone) {
		this.resPhone = resPhone;
	}

	public String getrImg() {
		return rImg;
	}

	public void setrImg(String rImg) {
		this.rImg = rImg;
	}

	public int getPayTotal() {
		return payTotal;
	}

	public void setPayTotal(int payTotal) {
		this.payTotal = payTotal;
	}

	public int getPayPoint() {
		return payPoint;
	}

	public void setPayPoint(int payPoint) {
		this.payPoint = payPoint;
	}

	public String getPayOp() {
		return payOp;
	}

	public void setPayOp(String payOp) {
		this.payOp = payOp;
	}

	public String getResName() {
		return resName;
	}

	public void setResName(String resName) {
		this.resName = resName;
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

	public String getBookDate() {
		return bookDate;
	}

	public void setBookDate(String bookDate) {
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

	public String getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(String modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getBookA() {
		return bookA;
	}

	public void setBookA(String bookA) {
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
