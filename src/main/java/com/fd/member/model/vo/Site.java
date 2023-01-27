package com.fd.member.model.vo;

public class Site {
	
	private int siteNo;
	private String siteContent;
	private String writeType;
	
	public Site() {}

	public Site(int siteNo, String siteContent, String writeType) {
		super();
		this.siteNo = siteNo;
		this.siteContent = siteContent;
		this.writeType = writeType;
	}

	public int getSiteNo() {
		return siteNo;
	}

	public void setSiteNo(int siteNo) {
		this.siteNo = siteNo;
	}

	public String getSiteContent() {
		return siteContent;
	}

	public void setSiteContent(String siteContent) {
		this.siteContent = siteContent;
	}

	public String getWriteType() {
		return writeType;
	}

	public void setWriteType(String writeType) {
		this.writeType = writeType;
	}

	@Override
	public String toString() {
		return "Site [siteNo=" + siteNo + ", siteContent=" + siteContent + ", writeType=" + writeType + "]";
	}
	
}
