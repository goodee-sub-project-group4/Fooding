package com.fd.restaurant.model.vo;

import java.io.Serializable;

public class Menu implements Serializable{
	private int menuNo;
	private int resNo;
	private String menuName;
	private int price;
	private String menuDes;
	private String mImg;
	
	public Menu() {}
	
	

	public Menu(int resNo, String menuName, int price, String menuDes, String mImg) {
		super();
		this.resNo = resNo;
		this.menuName = menuName;
		this.price = price;
		this.menuDes = menuDes;
		this.mImg = mImg;
	}



	public Menu(int menuNo, int resNo, String menuName, int price, String menuDes, String mImg) {
		super();
		this.menuNo = menuNo;
		this.resNo = resNo;
		this.menuName = menuName;
		this.price = price;
		this.menuDes = menuDes;
		this.mImg = mImg;
	}

	public int getMenuNo() {
		return menuNo;
	}

	public void setMenuNo(int menuNo) {
		this.menuNo = menuNo;
	}

	public int getResNo() {
		return resNo;
	}

	public void setResNo(int resNo) {
		this.resNo = resNo;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getMenuDes() {
		return menuDes;
	}

	public void setMenuDes(String menuDes) {
		this.menuDes = menuDes;
	}

	public String getmImg() {
		return mImg;
	}

	public void setmImg(String mImg) {
		this.mImg = mImg;
	}

	@Override
	public String toString() {
		return "Menu [menuNo=" + menuNo + ", resNo=" + resNo + ", menuName=" + menuName + ", price=" + price
				+ ", menuDes=" + menuDes + ", mImg=" + mImg + "]";
	}
	
	

}
