package com.fd.review.model.vo;


public class Review {
	
	private int reviewNo;
	private String resNo;
	private int userNo;
	private String userId;
	private int bookNo;
	private String reviewContent;
	private double star;
	private String createDate;
	private String modifyDate;
	private String status;
	private String good;
	private int count;
	private String nickName;
	private String changeName;
	private String filePath;
	private int reviewCount;
	private double reviewAvg;
	
	public Review () {}

	public Review(int reviewNo, String resNo, int userNo, int bookNo, String reviewContent, double star,
			String createDate, String modifyDate, String status, String good, int count) {
		super();
		this.reviewNo = reviewNo;
		this.resNo = resNo;
		this.userNo = userNo;
		this.bookNo = bookNo;
		this.reviewContent = reviewContent;
		this.star = star;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.status = status;
		this.good = good;
		this.count = count;
	}
	
	public Review(int reviewNo, String resNo, int userNo, int bookNo, String reviewContent, double star,
			String createDate, String modifyDate, String good, int count, String nickName) {
		super();
		this.reviewNo = reviewNo;
		this.resNo = resNo;
		this.userNo = userNo;
		this.bookNo = bookNo;
		this.reviewContent = reviewContent;
		this.star = star;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.good = good;
		this.count = count;
		this.nickName = nickName;
	}

	// 리뷰리스트
	public Review(int reviewNo, String resNo, String reviewContent, double star, String createDate) {
		super();
		this.reviewNo = reviewNo;
		this.resNo = resNo;
		this.reviewContent = reviewContent;
		this.star = star;
		this.createDate = createDate;
	}

	public Review(int count, double reviewAvg, int reviewCount) {
		super();
		this.count = count;
		this.reviewCount = reviewCount;
		this.reviewAvg = reviewAvg;
	}

	public Review(int reviewNo, String resNo, int userNo, int bookNo, String reviewContent, double star,
			String createDate, String modifyDate, String good, int count) {
		super();
		this.reviewNo = reviewNo;
		this.resNo = resNo;
		this.userNo = userNo;
		this.bookNo = bookNo;
		this.reviewContent = reviewContent;
		this.star = star;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.good = good;
		this.count = count;
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

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	
	public String getUserId() {
		return userId;
	}
	
	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getResNo() {
		return resNo;
	}

	public void setResNo(String resNo) {
		this.resNo = resNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getBookNo() {
		return bookNo;
	}

	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public double getStar() {
		return star;
	}

	public void setStar(double star) {
		this.star = star;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
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

	public String getGood() {
		return good;
	}

	public void setGood(String good) {
		this.good = good;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", resNo=" + resNo + ", userNo=" + userNo + ", bookNo=" + bookNo
				+ ", reviewContent=" + reviewContent + ", star=" + star + ", createDate=" + createDate + ", modifyDate="
				+ modifyDate + ", status=" + status + ", good=" + good + ", count=" + count + "]";
	}
	
}

