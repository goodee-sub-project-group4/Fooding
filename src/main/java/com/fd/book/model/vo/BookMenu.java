package com.fd.book.model.vo;

public class BookMenu {
	
	private int bmNo;
	private int bookNo;
	private String menuName;
	private String menuNo;
	private int menuCount;
	private int price;
	private int bmPrice;
	
	public BookMenu(int bmNo, int bookNo, String menuName, String menuNo, int menuCount, int price, int bmPrice) {
		super();
		this.bmNo = bmNo;
		this.bookNo = bookNo;
		this.menuName = menuName;
		this.menuNo = menuNo;
		this.menuCount = menuCount;
		this.price = price;
		this.bmPrice = bmPrice;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public BookMenu() {}

	public BookMenu(int bmNo, int bookNo, String menuNo, int menuCount, int bmPrice) {
		super();
		this.bmNo = bmNo;
		this.bookNo = bookNo;
		this.menuNo = menuNo;
		this.menuCount = menuCount;
		this.bmPrice = bmPrice;
	}
	
	public BookMenu(String menuName, int price, int menuCount) {
		super();
		this.menuName = menuName;
		this.price = price;
		this.menuCount = menuCount;
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

	
	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
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
