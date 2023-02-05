package com.fd.book.model.vo;


public class Payment {

	private int payNo;
	private int bookNo;
	private int resNo;
	private int userNo;
	private int payPoint;
	private int payTotal;
	private String payOp;
	private String payDate;
	private String status;
	private String modifyDate;
	
	public String getModifyDate() {
		return modifyDate;
	}


	public void setModifyDate(String modifyDate) {
		this.modifyDate = modifyDate;
	}


	public Payment() {
		super();
	}


	public Payment(int payNo, int bookNo, int resNo, int userNo, int payPoint, int payTotal, String payOp, String payDate,
			String status) {
		super();
		this.payNo = payNo;
		this.bookNo = bookNo;
		this.resNo = resNo;
		this.userNo = userNo;
		this.payPoint = payPoint;
		this.payTotal = payTotal;
		this.payOp = payOp;
		this.payDate = payDate;
		this.status = status;
	}


	public int getPayNo() {
		return payNo;
	}


	public void setPayNo(int payNo) {
		this.payNo = payNo;
	}


	public int getBookNo() {
		return bookNo;
	}


	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}


	public int getResNo() {
		return resNo;
	}


	public void setResNo(int resNo) {
		this.resNo = resNo;
	}


	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public int getPayPoint() {
		return payPoint;
	}


	public void setPayPoint(int payPoint) {
		this.payPoint = payPoint;
	}


	public int getPayTotal() {
		return payTotal;
	}


	public void setPayTotal(int payTotal) {
		this.payTotal = payTotal;
	}


	public String getPayOp() {
		return payOp;
	}


	public void setPayOp(String payOp) {
		this.payOp = payOp;
	}


	public String getPayDate() {
		return payDate;
	}


	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	@Override
	public String toString() {
		return "Payment [payNo=" + payNo + ", bookNo=" + bookNo + ", resNo=" + resNo + ", userNo=" + userNo
				+ ", payPoint=" + payPoint + ", payTotal=" + payTotal + ", payOp=" + payOp + ", payDate=" + payDate
				+ ", status=" + status + "]";
	}
	
	
}
