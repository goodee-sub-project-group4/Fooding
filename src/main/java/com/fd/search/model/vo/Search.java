package com.fd.search.model.vo;

import java.sql.Date;

public class Search { 
	
	private int resNo; 
    private String resName; 
    private String ceo; 
    private String perimtNo; 
    private String address; 
    private String localCt; 
    private String dLocalCt; 
    private String phone; 
    private String celPhone; 
    private String email; 
    private Date applyDate; 
    private String longtitude; 
    private String latitude; 
    private String foodCt; 
    
    public Search() {}

	public Search(int resNo, String resName, String ceo, String perimtNo, String address, String localCt,
			String dLocalCt, String phone, String celPhone, String email, Date applyDate, String longtitude,
			String latitude, String foodCt) {
		super();
		this.resNo = resNo;
		this.resName = resName;
		this.ceo = ceo;
		this.perimtNo = perimtNo;
		this.address = address;
		this.localCt = localCt;
		this.dLocalCt = dLocalCt;
		this.phone = phone;
		this.celPhone = celPhone;
		this.email = email;
		this.applyDate = applyDate;
		this.longtitude = longtitude;
		this.latitude = latitude;
		this.foodCt = foodCt;
	}

	public int getResNo() {
		return resNo;
	}

	public void setResNo(int resNo) {
		this.resNo = resNo;
	}

	public String getResName() {
		return resName;
	}

	public void setResName(String resName) {
		this.resName = resName;
	}

	public String getCeo() {
		return ceo;
	}

	public void setCeo(String ceo) {
		this.ceo = ceo;
	}

	public String getPerimtNo() {
		return perimtNo;
	}

	public void setPerimtNo(String perimtNo) {
		this.perimtNo = perimtNo;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getLocalCt() {
		return localCt;
	}

	public void setLocalCt(String localCt) {
		this.localCt = localCt;
	}

	public String getdLocalCt() {
		return dLocalCt;
	}

	public void setdLocalCt(String dLocalCt) {
		this.dLocalCt = dLocalCt;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getCelPhone() {
		return celPhone;
	}

	public void setCelPhone(String celPhone) {
		this.celPhone = celPhone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getApplyDate() {
		return applyDate;
	}

	public void setApplyDate(Date applyDate) {
		this.applyDate = applyDate;
	}

	public String getLongtitude() {
		return longtitude;
	}

	public void setLongtitude(String longtitude) {
		this.longtitude = longtitude;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getFoodCt() {
		return foodCt;
	}

	public void setFoodCt(String foodCt) {
		this.foodCt = foodCt;
	}

	@Override
	public String toString() {
		return "Search [resNo=" + resNo + ", resName=" + resName + ", ceo=" + ceo + ", perimtNo=" + perimtNo
				+ ", address=" + address + ", localCt=" + localCt + ", dLocalCt=" + dLocalCt + ", phone=" + phone
				+ ", celPhone=" + celPhone + ", email=" + email + ", applyDate=" + applyDate + ", longtitude="
				+ longtitude + ", latitude=" + latitude + ", foodCt=" + foodCt + "]";
	}
    
	
}
