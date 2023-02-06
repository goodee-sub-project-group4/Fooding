package com.fd.book.model.vo;

import java.util.Date;

public class Point {
	
	private int pointNo;
	private int payNo;
	private int userNo;
	private int resNo;
	private String pointName;
	private String status;
	private int pointTrade;
	private int pointNow;
	private Date pointDate;
	private int payPoint;

	public Point() {
		super();
	}
	
	public Point(int pointNo, int payNo, int userNo, int resNo, String pointName, String status, int pointTrade,
			int pointNow, Date pointDate) {
		super();
		this.pointNo = pointNo;
		this.payNo = payNo;
		this.userNo = userNo;
		this.resNo = resNo;
		this.pointName = pointName;
		this.status = status;
		this.pointTrade = pointTrade;
		this.pointNow = pointNow;
		this.pointDate = pointDate;
	}
	
	public Point(int userNo, int resNo, String pointName, int pointTrade, int payPoint) {
		super();
		this.userNo = userNo;
		this.resNo = resNo;
		this.pointName = pointName;
		this.pointTrade = pointTrade;
		this.payPoint = payPoint;
	}

	public int getPayPoint() {
		return payPoint;
	}

	public void setPayPoint(int payPoint) {
		this.payPoint = payPoint;
	}

	public int getPointNo() {
		return pointNo;
	}

	public void setPointNo(int pointNo) {
		this.pointNo = pointNo;
	}

	public int getPayNo() {
		return payNo;
	}

	public void setPayNo(int payNo) {
		this.payNo = payNo;
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

	public String getPointName() {
		return pointName;
	}

	public void setPointName(String pointName) {
		this.pointName = pointName;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
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

	public Date getPointDate() {
		return pointDate;
	}

	public void setPointDate(Date pointDate) {
		this.pointDate = pointDate;
	}

	@Override
	public String toString() {
		return "Point [pointNo=" + pointNo + ", payNo=" + payNo + ", userNo=" + userNo + ", resNo=" + resNo
				+ ", pointName=" + pointName + ", status=" + status + ", pointTrade=" + pointTrade + ", pointNow="
				+ pointNow + ", pointDate=" + pointDate + "]";
	}

}
