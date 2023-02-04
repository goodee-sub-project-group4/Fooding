package com.fd.admin.model.vo;


public class Black {
	private int blackNo;
	private String bPerson;
	private String tPerson;
	private String blackTitle;
	private String blackContent;
	private String blackType;
	
	public Black() {}

	public Black(int blackNo, String bPerson, String tPerson, String blackTitle, String blackContent,
			String blackType) {
		super();
		this.blackNo = blackNo;
		this.bPerson = bPerson;
		this.tPerson = tPerson;
		this.blackTitle = blackTitle;
		this.blackContent = blackContent;
		this.blackType = blackType;
	}

	public int getBlackNo() {
		return blackNo;
	}

	public void setBlackNo(int blackNo) {
		this.blackNo = blackNo;
	}

	public String getbPerson() {
		return bPerson;
	}

	public void setbPerson(String bPerson) {
		this.bPerson = bPerson;
	}

	public String gettPerson() {
		return tPerson;
	}

	public void settPerson(String tPerson) {
		this.tPerson = tPerson;
	}

	public String getBlackTitle() {
		return blackTitle;
	}

	public void setBlackTitle(String blackTitle) {
		this.blackTitle = blackTitle;
	}

	public String getBlackContent() {
		return blackContent;
	}

	public void setBlackContent(String blackContent) {
		this.blackContent = blackContent;
	}

	public String getBlackType() {
		return blackType;
	}

	public void setBlackType(String blackType) {
		this.blackType = blackType;
	}

	@Override
	public String toString() {
		return "Black [blackNo=" + blackNo + ", bPerson=" + bPerson + ", tPerson=" + tPerson + ", blackTitle="
				+ blackTitle + ", blackContent=" + blackContent + ", blackType=" + blackType + "]";
	}
	
	

}
