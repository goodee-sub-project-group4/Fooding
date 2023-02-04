package com.fd.review.model.vo;

public class ReviewDetailFileVo {

	private int refBno;
	private String changeName;
	private String filePath;
	
	public ReviewDetailFileVo() {
		super();
	}
	
	public ReviewDetailFileVo(int refBno, String changeName, String filePath) {
		this.refBno = refBno;
		this.changeName = changeName;
		this.filePath = filePath;
	}

	public int getRefBno() {
		return refBno;
	}
	public void setRefBno(int refBno) {
		this.refBno = refBno;
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

	@Override
	public String toString() {
		return "ReviewDetailFileVo [refBno=" + refBno + ", changeName=" + changeName + ", filePath=" + filePath + "]";
	}
	
	
	
}
