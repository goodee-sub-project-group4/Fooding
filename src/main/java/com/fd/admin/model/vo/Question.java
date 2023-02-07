package com.fd.admin.model.vo;

public class Question {
	private int qNo;
	private String category;
	private String qTitle;
	private String qContent;
	private String createDate;
	private String modifyDate;
	private String deleteDate;
	private String aContent;
	private String aDate;
	private String status;
	private String qPerson;
	private String qWho;
	private String aPerson; //회원번호와 회원아이디 둘다 저장하는 필드
	private String aWho;

	
	public Question () {}

	public Question(int qNo, String category, String qTitle, String qContent, String createDate, String modifyDate,
			String deleteDate, String aContent, String aDate, String status, String qPerson, String qWho,
			String aPerson, String aWho) {
		super();
		this.qNo = qNo;
		this.category = category;
		this.qTitle = qTitle;
		this.qContent = qContent;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.deleteDate = deleteDate;
		this.aContent = aContent;
		this.aDate = aDate;
		this.status = status;
		this.qPerson = qPerson;
		this.qWho = qWho;
		this.aPerson = aPerson;
		this.aWho = aWho;
	}
	
	// (회원)1:1문의리스트
	public Question(int qNo, String qTitle, String createDate,  String status) {
		super();
		this.qNo = qNo;
		this.qTitle = qTitle;
		this.createDate = createDate;
		this.status = status;
		
	}
	
	   // 1:1 문의상세조회
	   public Question(int qNo, String category, String qTitle, String qContent, String aContent) {
	      super();
	      this.qNo = qNo;
	      this.category = category;
	      this.qTitle = qTitle;
	      this.qContent = qContent;
	      this.aContent = aContent;
	   }
	
	// 관리자 - 회원, 업체 1:1리스트 조회
	public Question(int qNo, String category, String qTitle, String qContent, String createDate, String status, String qPerson) {
		super();
		this.qNo = qNo;
		this.category = category;
		this.qTitle = qTitle;
		this.qContent = qContent;
		this.createDate = createDate;
		this.status = status;
		this.qPerson = qPerson;
		this.aContent = aContent;
	}

	public int getqNo() {
		return qNo;
	}

	public void setqNo(int qNo) {
		this.qNo = qNo;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getqTitle() {
		return qTitle;
	}

	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}

	public String getqContent() {
		return qContent;
	}

	public void setqContent(String qContent) {
		this.qContent = qContent;
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

	public String getDeleteDate() {
		return deleteDate;
	}

	public void setDeleteDate(String deleteDate) {
		this.deleteDate = deleteDate;
	}

	public String getaContent() {
		return aContent;
	}

	public void setaContent(String aContent) {
		this.aContent = aContent;
	}

	public String getaDate() {
		return aDate;
	}

	public void setaDate(String aDate) {
		this.aDate = aDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getqPerson() {
		return qPerson;
	}

	public void setqPerson(String qPerson) {
		this.qPerson = qPerson;
	}

	public String getqWho() {
		return qWho;
	}

	public void setqWho(String qWho) {
		this.qWho = qWho;
	}

	public String getaPerson() {
		return aPerson;
	}

	public void setaPerson(String aPerson) {
		this.aPerson = aPerson;
	}

	public String getaWho() {
		return aWho;
	}

	public void setaWho(String aWho) {
		this.aWho = aWho;
	}

	@Override
	public String toString() {
		return "Question [qNo=" + qNo + ", category=" + category + ", qTitle=" + qTitle + ", qContent=" + qContent
				+ ", createDate=" + createDate + ", modifyDate=" + modifyDate + ", deleteDate=" + deleteDate
				+ ", aContent=" + aContent + ", aDate=" + aDate + ", status=" + status + ", qPerson=" + qPerson
				+ ", qWho=" + qWho + ", aPerson=" + aPerson + ", aWho=" + aWho + "]";
	}
	

}
