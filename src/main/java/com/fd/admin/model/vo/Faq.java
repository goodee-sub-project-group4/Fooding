package com.fd.admin.model.vo;

import java.sql.Date;

public class Faq {

	private int faqNo;
	private String userNo;
	private String category;
	private String faqTitle;
	private String faqContent;
	private String createDate;
	private String modifyDate;
	private int count;
	private String who;
	private String status;
	
	public Faq() {}

	public Faq(int faqNo, String userNo, String category, String faqTitle, String faqContent, String createDate,
			String modifyDate, int count, String who, String status) {
		super();
		this.faqNo = faqNo;
		this.userNo = userNo;
		this.category = category;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.count = count;
		this.who = who;
		this.status = status;
	}

	// FAQ 리스트 조회
	public Faq(int faqNo, String category, String faqTitle, String faqContent) {
		super();
		this.faqNo = faqNo;
		this.category = category;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
	}

	// FAQ 카테고리
	public Faq(String category) {
		super();
		this.category = category;
	}

	public int getFaqNo() {
		return faqNo;
	}

	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}

	public String getUserNo() {
		return userNo;
	}

	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getFaqTitle() {
		return faqTitle;
	}

	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}

	public String getFaqContent() {
		return faqContent;
	}

	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
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

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getWho() {
		return who;
	}

	public void setWho(String who) {
		this.who = who;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Faq [faqNo=" + faqNo + ", userNo=" + userNo + ", category=" + category + ", faqTitle=" + faqTitle
				+ ", faqContent=" + faqContent + ", createDate=" + createDate + ", modifyDate=" + modifyDate
				+ ", count=" + count + ", who=" + who + ", status=" + status + "]";
	};
	
}
