package com.fd.member.model.vo;

public class SendVo {
	
	private String phone; // 사용자의 핸드폰번호
	private String checkNum; // 인증번호 비교
	
	public SendVo () {}

	public SendVo(String phone, String checkNum) {
		super();
		this.phone = phone;
		this.checkNum = checkNum;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getCheckNum() {
		return checkNum;
	}

	public void setCheckNum(String checkNum) {
		this.checkNum = checkNum;
	}

	@Override
	public String toString() {
		return "SendVo [phone=" + phone + ", checkNum=" + checkNum + "]";
	}
	
}
