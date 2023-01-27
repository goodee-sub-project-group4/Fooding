package com.fd.restaurant.model.vo;

public class Restaurant {
	private int resNo;
	private String resName;
	private String ceo;
	private String permitNo;
	private String address;
	private String dAddress;
	private String localCt;
	private String dLocalCt;
	private String phone;
	private String cellphone;
	private String email;
	private String parking;
	private String applyDate;
	private String enrollDate;
	private String modifyDate;
	private String status;
	private String longtitude;
	private String latitude;
	private String rImg;
	

	private String open;
	private String close;
	private String breakS;
	private String privateE;
	private String foodCt;
	
	public Restaurant() {}
	
	public Restaurant(int resNo, String resName, String ceo, String permitNo, String address, String dAddress,
			String localCt, String dLocalCt, String phone, String cellphone, String email, String parking, String status,
			String longtitude, String latitude, String rImg, String open, String close, String breakS, String privateE,
			String foodCt) {
		super();
		this.resNo = resNo;
		this.resName = resName;
		this.ceo = ceo;
		this.permitNo = permitNo;
		this.address = address;
		this.dAddress = dAddress;
		this.localCt = localCt;
		this.dLocalCt = dLocalCt;
		this.phone = phone;
		this.cellphone = cellphone;
		this.email = email;
		this.parking = parking;
		this.status=status;
		this.longtitude = longtitude;
		this.latitude = latitude;
		this.rImg = rImg;
		this.open = open;
		this.close = close;
		this.breakS = breakS;
		this.privateE = privateE;
		this.foodCt = foodCt;
	}
	public Restaurant(int resNo, String resName, String ceo, String permitNo, String address, String dAddress,
			String localCt, String dLocalCt, String phone, String cellphone, String email, String parking,
			String applyDate, String enrollDate, String modifyDate, String status, String longtitude, String latitude,
			String rImg, String open, String close, String breakS, String privateE, String foodCt) {
		super();
		this.resNo = resNo;
		this.resName = resName;
		this.ceo = ceo;
		this.permitNo = permitNo;
		this.address = address;
		this.dAddress = dAddress;
		this.localCt = localCt;
		this.dLocalCt = dLocalCt;
		this.phone = phone;
		this.cellphone = cellphone;
		this.email = email;
		this.parking = parking;
		this.applyDate = applyDate;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.status = status;
		this.longtitude = longtitude;
		this.latitude = latitude;
		this.rImg = rImg;
		this.open = open;
		this.close = close;
		this.breakS = breakS;
		this.privateE = privateE;
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

	public String getPermitNo() {
		return permitNo;
	}

	public void setPermitNo(String permitNo) {
		this.permitNo = permitNo;
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

	public String getCellphone() {
		return cellphone;
	}

	public void setCelphone(String cellphone) {
		this.cellphone = cellphone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getParking() {
		return parking;
	}

	public void setParking(String parking) {
		this.parking = parking;
	}

	public String getApplyDate() {
		return applyDate;
	}

	public void setApplyDate(String applyDate) {
		this.applyDate = applyDate;
	}

	public String getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(String modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
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

	public String getrImg() {
		return rImg;
	}

	public void setrImg(String rImg) {
		this.rImg = rImg;
	}

	public String getOpen() {
		return open;
	}

	public void setOpen(String open) {
		this.open = open;
	}

	public String getClose() {
		return close;
	}

	public void setClose(String close) {
		this.close = close;
	}

	public String getBreakS() {
		return breakS;
	}

	public void setBreakS(String breakS) {
		this.breakS = breakS;
	}

	public String getPrivateE() {
		return privateE;
	}

	public void setPrivateE(String privateE) {
		this.privateE = privateE;
	}

	public String getFoodCt() {
		return foodCt;
	}

	public void setFoodCt(String foodCt) {
		this.foodCt = foodCt;
	}

	@Override
	public String toString() {
		return "Restaurant [resNo=" + resNo + ", resName=" + resName + ", ceo=" + ceo + ", permitNo=" + permitNo
				+ ", address=" + address + ", dAddress=" + dAddress + ", localCt=" + localCt + ", dLocalCt=" + dLocalCt
				+ ", phone=" + phone + ", cellphone=" + cellphone + ", email=" + email + ", parking=" + parking
				+ ", applyDate=" + applyDate + ", enrollDate=" + enrollDate + ", modifyDate=" + modifyDate + ", status="
				+ status + ", longtitude=" + longtitude + ", latitude=" + latitude + ", rImg=" + rImg + ", open=" + open
				+ ", close=" + close + ", breakS=" + breakS + ", privateE=" + privateE + ", foodCt=" + foodCt + "]";
	}
	
	

}
