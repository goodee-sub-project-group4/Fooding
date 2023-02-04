package com.fd.review.model.vo;

public class ReviewDetailVo {

	private int reviewNo;
	private String resNo;
	private String reviewContent;
	private String star;
	private String resName;
		
	public ReviewDetailVo() {
		super();
	}

	public ReviewDetailVo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	
	public ReviewDetailVo(int reviewNo, String resNo, String reviewContent, String star, String resName) {
		this.reviewNo = reviewNo;
		this.resNo = resNo;
		this.reviewContent = reviewContent;
		this.star = star;
		this.resName = resName;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getResNo() {
		return resNo;
	}

	public void setResNo(String resNo) {
		this.resNo = resNo;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public String getStar() {
		return star;
	}
	
	public void setStar(String star) {
		this.star = star;
	}

	
	
	public String getResName() {
		return resName;
	}

	public void setResName(String resName) {
		this.resName = resName;
	}

	@Override
	public String toString() {
		return "ReviewDetailVo [reviewNo=" + reviewNo + ", resNo=" + resNo + ", reviewContent=" + reviewContent
				+ ", star=" + star + ", resName=" + resName + "]";
	}

	
	
	
	
	
	
}
