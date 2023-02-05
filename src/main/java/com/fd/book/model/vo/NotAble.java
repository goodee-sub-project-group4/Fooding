package com.fd.book.model.vo;

public class NotAble {
	private int notNo;
	private int resNo;
	private String year;
	private String month;
	private String date;
	
	public NotAble() {}

	public NotAble(int notNo, int resNo, String year, String month, String date) {
		super();
		this.notNo = notNo;
		this.resNo = resNo;
		this.year = year;
		this.month = month;
		this.date = date;
	}

	public int getNotNo() {
		return notNo;
	}

	public void setNotNo(int notNo) {
		this.notNo = notNo;
	}

	public int getResNo() {
		return resNo;
	}

	public void setResNo(int resNo) {
		this.resNo = resNo;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "NotAble [notNo=" + notNo + ", resNo=" + resNo + ", year=" + year + ", month=" + month + ", date=" + date
				+ "]";
	}
	
	

}
