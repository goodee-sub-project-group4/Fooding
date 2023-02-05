package com.fd.member.model.vo;

import java.sql.Date;

public class Member {
	
	private int userNo;
	private String userId;
	private String userPwd;
	private String updatePwd;
	private String userName;
	private String nickname;
	private String userEmail;
	private String userPhone;
	private String gender;
	private String birth;
	private Date enrollDate;
	private Date modifyDate;
	private String status;
	
	// 예약횟수, 리뷰횟수, 신고횟수 추가
	private String bookCount;
	private String reviewCount;
	private String blackCount;
	
	// 적립금 추가
	private int pointNow;
	
	// 
	private String bookDate;
	private String resName;
	private String bookTime;
	private int people;
	private int payTotal;
	private int payPoint;
	private int payFinal;
	private int plusPoint;
	private String payOp;
	

	public Member () {}

	public Member(int userNo, String userId, String userPwd, String userName, String nickname, String userEmail,
			String userPhone, String gender, String birth, Date enrollDate, Date modifyDate, String status) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.nickname = nickname;
		this.userEmail = userEmail;
		this.userPhone = userPhone;
		this.gender = gender;
		this.birth = birth;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.status = status;
	}
	
	// 회원가입
	public Member(String userId, String userPwd, String userName, String nickname, String userEmail, String userPhone,
			String gender, String birth) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.nickname = nickname;
		this.userEmail = userEmail;
		this.userPhone = userPhone;
		this.gender = gender;
		this.birth = birth;
	}
	
	// 회원정보수정
	public Member(String userId, String userPwd, String updatePwd, String userName, String nickname, String userEmail,
			String userPhone, String gender, String birth) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.updatePwd = updatePwd;
		this.userName = userName;
		this.nickname = nickname;
		this.userEmail = userEmail;
		this.userPhone = userPhone;
		this.gender = gender;
		this.birth = birth;
	}

	// 관리자- 관리자 로그인 조회할 때 사용
	public Member(int userNo, String userId, String userPwd, String userName, String status) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.status = status;
	}

	// 관리자 - 회원 리스트 조회할 때 사용
	public Member(int userNo, String userId, String userName, String userPhone, String gender,
			 String bookCount, String reviewCount, String blackCount, String status) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userName = userName;
		this.userPhone = userPhone;
		this.gender = gender;
		this.bookCount = bookCount;
		this.reviewCount = reviewCount;
		this.blackCount = blackCount;
		this.status = status;
	}
	
	// 관리자 - 회원 상세 조회할 때 사용
	public Member(int userNo, String userId, String userName, String nickname, String userPhone, String userEmail, 
			String birth, String gender, Date enrollDate, int pointNow, String status) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userName = userName;
		this.nickname = nickname;
		this.userPhone = userPhone;
		this.userEmail = userEmail;
		this.birth = birth;
		this.gender = gender;
		this.enrollDate = enrollDate;
		this.pointNow = pointNow;
		this.status = status;
	}
	
	// 관리자 - 회원 수정할 때 사용
	public Member(int userNo, String userName, String nickname, String userPhone, String userEmail, String status) {
		super();
		this.userNo = userNo;
		this.userName = userName;
		this.nickname = nickname;
		this.userEmail = userEmail;
		this.userPhone = userPhone;
		this.status = status;
	}
	
	// 관리자 - 회원 이용내역 조회할 때 사용
	public Member(int userNo, String userId, String bookDate, String resName, String bookTime, int people, int payTotal,
			int payPoint, int payFinal, int plusPoint, String payOp) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.bookDate = bookDate;
		this.resName = resName;
		this.bookTime = bookTime;
		this.people = people;
		this.payTotal = payTotal;
		this.payPoint = payPoint;
		this.payFinal = payFinal;
		this.plusPoint = plusPoint;
		this.payOp = payOp;
	}
	

	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void sertUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	
	public String getUpdatePwd() {
		return updatePwd;
	}
	
	public void setUpdatePwd(String updatePwd) {
		this.updatePwd = updatePwd;
	}
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
		
	
	public String getBookCount() {
		return bookCount;
	}

	public void setBookCount(String bookCount) {
		this.bookCount = bookCount;
	}

	public String getReviewCount() {
		return reviewCount;
	}

	public void setReviewCount(String reviewCount) {
		this.reviewCount = reviewCount;
	}
	
	
	public String getBlackCount() {
		return blackCount;
	}

	public void setBlackCount(String blackCount) {
		this.blackCount = blackCount;
	}

	public int getPointNow() {
		return pointNow;
	}

	public void setPointNow(int pointNow) {
		this.pointNow = pointNow;
	}
	
	

	public String getBookDate() {
		return bookDate;
	}

	public void setBookDate(String bookDate) {
		this.bookDate = bookDate;
	}

	public String getResName() {
		return resName;
	}

	public void setResName(String resName) {
		this.resName = resName;
	}

	public String getBookTime() {
		return bookTime;
	}

	public void setBookTime(String bookTime) {
		this.bookTime = bookTime;
	}

	public int getPeople() {
		return people;
	}

	public void setPeople(int people) {
		this.people = people;
	}

	public int getPayTotal() {
		return payTotal;
	}

	public void setPayTotal(int payTotal) {
		this.payTotal = payTotal;
	}

	public int getPayPoint() {
		return payPoint;
	}

	public void setPayPoint(int payPoint) {
		this.payPoint = payPoint;
	}

	public int getPayFinal() {
		return payFinal;
	}

	public void setPayFinal(int payFinal) {
		this.payFinal = payFinal;
	}

	public int getPlusPoint() {
		return plusPoint;
	}

	public void setPlusPoint(int plusPoint) {
		this.plusPoint = plusPoint;
	}

	public String getPayOp() {
		return payOp;
	}

	public void setPayOp(String payOp) {
		this.payOp = payOp;
	}

	@Override
	public String toString() {
		return "Member [userNo=" + userNo + ", userId=" + userId + ", userPwd=" + userPwd + ", updatePwd=" + updatePwd
				+ ", userName=" + userName + ", nickname=" + nickname + ", userEmail=" + userEmail + ", userPhone="
				+ userPhone + ", gender=" + gender + ", birth=" + birth + ", enrollDate=" + enrollDate + ", modifyDate="
				+ modifyDate + ", status=" + status + ", bookCount=" + bookCount + ", reviewCount=" + reviewCount
				+ ", blackCount=" + blackCount + "]";
	}

	
}
