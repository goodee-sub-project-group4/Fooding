package com.fd.book.model.vo;

public class BookMenu {
	
	private int bmNo;
	private int bookNo;
	private String menuNo;
	private int menuCount;
	private int bmPrice;
	
	public BookMenu() {}

	public BookMenu(int bmNo, int bookNo, String menuNo, int menuCount, int bmPrice) {
		super();
		this.bmNo = bmNo;
		this.bookNo = bookNo;
		this.menuNo = menuNo;
		this.menuCount = menuCount;
		this.bmPrice = bmPrice;
	}

	public int getBmNo() {
		return bmNo;
	}

	public void setBmNo(int bmNo) {
		this.bmNo = bmNo;
	}

	public int getBookNo() {
		return bookNo;
	}

	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}

	public String getMenuNo() {
		return menuNo;
	}

	public void setMenuNo(String menuNo) {
		this.menuNo = menuNo;
	}

	public int getMenuCount() {
		return menuCount;
	}

	public void setMenuCount(int menuCount) {
		this.menuCount = menuCount;
	}

	public int getBmPrice() {
		return bmPrice;
	}

	public void setBmPrice(int bmPrice) {
		this.bmPrice = bmPrice;
	}

	@Override
	public String toString() {
		return "BookMenu [bmNo=" + bmNo + ", bookNo=" + bookNo + ", menuNo=" + menuNo + ", menuCount=" + menuCount
				+ ", bmPrice=" + bmPrice + "]";
	}
	
	

}
