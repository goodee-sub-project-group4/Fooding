package com.fd.admin.model.vo;

import java.sql.Date;

public class Notice {
	
	private int noticeNo;
	private String userNo;
	private String noticeTitle;
	private String noticeContent;
	private Date createDate;
	private Date modifyDate;
	private int count;
	private String toWhom;
	private String status;
	
	private String boardType;	// 공지사항 공지사항 N / 리뷰 R / 1:1문의 Q


	public Notice() {}

	public Notice(int noticeNo, String userNo, String noticeTitle, String noticeContent, Date createDate, Date modifyDate,
				  int count, String toWhom, String status) {
		super();
		this.noticeNo = noticeNo;
		this.userNo = userNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.count = count;
		this.toWhom = toWhom;
		this.status = status;
	}
	
	// 공지사항 등록..
	public Notice(int noticeNo, String userNo, String noticeTitle, String noticeContent, Date createDate,
			Date modifyDate, int count, String toWhom, String status, String boardType) {
		super();
		this.noticeNo = noticeNo;
		this.userNo = userNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.count = count;
		this.toWhom = toWhom;
		this.status = status;
		this.boardType = boardType;
	}

	// 공지사항 목록 조회
	public Notice(int noticeNo, String noticeTitle, String userNo, int count, Date createDate) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.userNo = userNo;
		this.count = count;
		this.createDate = createDate;
	}
	
	
	// 공지사항 게시글 정보 조회
	public Notice(int noticeNo, String noticeTitle, String noticeContent, String userNo, Date createDate) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.userNo = userNo;
		this.createDate = createDate;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getUserNo() {
		return userNo;
	}

	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getToWhom() {
		return toWhom;
	}

	public void setToWhom(String toWhom) {
		this.toWhom = toWhom;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	public String getBoardType() {
		return boardType;
	}

	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}

	@Override
	public String toString() {
		return "Black [noticeNo=" + noticeNo + ", userNo=" + userNo + ", noticeTitle=" + noticeTitle
				+ ", noticeContent=" + noticeContent + ", createDate=" + createDate + ", modifyDate=" + modifyDate
				+ ", count=" + count + ", toWhom=" + toWhom + ", status=" + status + "]";
	}


}
