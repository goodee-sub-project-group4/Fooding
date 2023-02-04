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
	private String breakE;
	private String foodCt;
	private int reviewCount;
	private double reviewAvg;
	private int menuNo;
	private String menuName;
	private String price;
	private String menuDes;
	private String img;
	
	// 한수가 추가한 필드 (SearchController 및 search와 관련된 파일에서만 사용)
	private int listCount; // 검색결과 총 갯수
	private double star; // 별점  
	private int count; // 조회수 
	private int totalReview; // 한 업체당 달린 리뷰 총 갯수 
	
	// 한수가 추가한 필드2 (찜하기에서 사용!!) 
	private int userNo; // 찜하기를 누른 회원의 번호 
	
	public Restaurant() {}
	
	// 식당 조회용 매개변수 생성자 - 태진
	public Restaurant(int resNo, String resName, String ceo, String permitNo, String address, String dAddress,
			String phone, String parking, String longtitude, String latitude, String rImg, String open, String close, String breakS, String breakE, String foodCt, int reviewCount,
			double reviewAvg, int count) {
		super();
		this.resNo = resNo;
		this.resName = resName;
		this.ceo = ceo;
		this.permitNo = permitNo;
		this.address = address;
		this.dAddress = dAddress;
		this.phone = phone;
		this.parking = parking;
		this.longtitude = longtitude;
		this.latitude = latitude;
		this.rImg = rImg;
		this.open = open;
		this.close = close;
		this.breakS = breakS;
		this.breakE = breakE;
		this.foodCt = foodCt;
		this.setReviewCount(reviewCount);
		this.setReviewAvg(reviewAvg);
		this.count = count;
	}
	
	
	public Restaurant(int resNo, String resName, String ceo, String permitNo, String address, String dAddress,
			String localCt, String dLocalCt, String phone, String cellphone, String email, String parking, String status,
			String longtitude, String latitude, String rImg, String open, String close, String breakS, String breakE,
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
		this.breakE = breakE;
		this.foodCt = foodCt;
	}
	public Restaurant(int resNo, String resName, String ceo, String permitNo, String address, String dAddress,
			String localCt, String dLocalCt, String phone, String cellphone, String email, String parking,
			String applyDate, String enrollDate, String modifyDate, String status, String longtitude, String latitude,
			String rImg, String open, String close, String breakS, String breakE, String foodCt) {
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
		this.breakE = breakE;
		this.foodCt = foodCt;
	}
	

	// 한수가 만든 매개변수 생성자1(ResformController 에서 사용!!)
	
	public Restaurant(String resName, String ceo, String permitNo, String address, String dAddress, String phone,
			String cellphone, String email, String parking, String foodCt) {
		super();
		this.resName = resName;
		this.ceo = ceo;
		this.permitNo = permitNo;
		this.address = address;
		this.dAddress = dAddress;
		this.phone = phone;
		this.cellphone = cellphone;
		this.email = email;
		this.parking = parking;
		this.foodCt = foodCt;
	}
	
	
	// 한수가 추가한 매개변수 생성자2 
	public Restaurant(String resName, String ceo, String permitNo, String address, String dAddress, String localCt,
			String dLocalCt, String phone, String cellphone, String email, String parking, String foodCt) {
		super();
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
		this.foodCt = foodCt;
	}
	
	// 한수가 추가한 매개변수 생성자3 (SearchDao의 selectList에서 사용!!)
	/*
	public Restaurant(int resNo, String resName, String address, String rImg, String foodCt, double star, int count) {
		super();
		this.resNo = resNo;
		this.resName = resName;
		this.address = address;
		this.rImg = rImg;
		this.foodCt = foodCt;
		this.star = star;
		this.count = count;
	}
	*/

	// 한수가 추가한 매개변수 생성자4 (SearchDao의 keywordList에서 사용!! )
	/*
	public Restaurant(String resName, String address, String rImg, String foodCt, double star, int count) {
		super();
		this.resName = resName;
		this.address = address;
		this.rImg = rImg;
		this.foodCt = foodCt;
		this.star = star;
		this.count = count;
	}
	*/
	
	
	// 한수가 추가한 매개변수 생성자5 (SearchDao의 selectList에서 사용)
	public Restaurant(int resNo, String resName, String address, String rImg, String foodCt, double reviewAvg,
			int count, int totalReview) {
		super();
		this.resNo = resNo;
		this.resName = resName;
		this.address = address;
		this.rImg = rImg;
		this.foodCt = foodCt;
		this.reviewAvg = reviewAvg; // 한업체에 달린 별점평점
		this.count = count; // 한업체의 조회수 
		this.totalReview = totalReview; // 한 업체에 달린 리뷰 총 갯수 
	}
	

	// getter/setter
	
	public int getResNo () {
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

	public void setCellphone(String cellphone) {
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

	public String getBreakE() {
		return breakE;
	}

	public void setBreakE(String breakE) {
		this.breakE = breakE;
	}

	public String getFoodCt() {
		return foodCt;
	}

	public void setFoodCt(String foodCt) {
		this.foodCt = foodCt;
	}
	
	
	// 한수가 추가한 getter/setter 

	public int getListCount() {
		return listCount;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
	}
	
	
	

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public Double getStar() {
		return star;
	}

	public void setStar(Double star) {
		this.star = star;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getMenuNo() {
		return menuNo;
	}

	public void setMenuNo(int menuNo) {
		this.menuNo = menuNo;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getMenuDes() {
		return menuDes;
	}

	public void setMenuDes(String menuDes) {
		this.menuDes = menuDes;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public void setStar(double star) {
		this.star = star;
	}

	public int getReviewCount() {
		return reviewCount;
	}

	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}

	public double getReviewAvg() {
		return reviewAvg;
	}

	public void setReviewAvg(double reviewAvg) {
		this.reviewAvg = reviewAvg;
	}
	
	
	public int getTotalReview() {
		return totalReview;
	}

	public void setTotalReview(int totalReview) {
		this.totalReview = totalReview;
	}

	@Override
	public String toString() {
		return "Restaurant [resNo=" + resNo + ", resName=" + resName + ", ceo=" + ceo + ", permitNo=" + permitNo
				+ ", address=" + address + ", dAddress=" + dAddress + ", localCt=" + localCt + ", dLocalCt=" + dLocalCt
				+ ", phone=" + phone + ", cellphone=" + cellphone + ", email=" + email + ", parking=" + parking
				+ ", applyDate=" + applyDate + ", enrollDate=" + enrollDate + ", modifyDate=" + modifyDate + ", status="
				+ status + ", longtitude=" + longtitude + ", latitude=" + latitude + ", rImg=" + rImg + ", open=" + open
				+ ", close=" + close + ", breakS=" + breakS + ", breakE=" + breakE + ", foodCt=" + foodCt
				+ ", reviewCount=" + reviewCount + ", reviewAvg=" + reviewAvg + ", listCount=" + listCount + ", star="
				+ star + ", count=" + count + "]";
	}


}
