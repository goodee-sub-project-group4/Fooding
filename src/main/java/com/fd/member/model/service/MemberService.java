package com.fd.member.model.service;

import java.sql.Connection;

import static com.fd.common.JDBCTemplate.*;
import com.fd.member.model.dao.MemberDao;
import com.fd.member.model.vo.Member;

public class MemberService {
	
	/** 로그인
	 * @author 빛나
	 * @param userId
	 * @param userPwd
	 * @return m
	 */
	public Member loginMember(String userId, String userPwd) {
		
		Connection conn = getConnection();
		Member m = new MemberDao().loginMember(conn, userId, userPwd);
		close(conn);
		return m;
	}
	
	/** 회원가입
	 * @author 빛나
	 * @param m 
	 * @return result 
	 */
	public int insertMember(Member m) {
		
		Connection conn = getConnection();
		int result = new MemberDao().insertMember(conn, m);
		
		if(result > 0) { 
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
		
	}
	
	/** 아이디 중복체크
	 * @author 빛나
	 * @param checkId
	 * @return count (중복된 아이디 값의 개수)
	 */
	public int idCheck(String checkId) {
		
		Connection conn = getConnection();
		int count = new MemberDao().idCheck(conn, checkId);
		close(conn);
		return count;
	}
	
	/** 닉네임 중복체크
	 * @author 빛나
	 * @param checkNickname
	 * @return count2 (중복된 닉네임 값의 개수)
	 */
	public int nicknameCheck(String checkNickname) {
		
		Connection conn = getConnection();
		int count2 = new MemberDao().nicknameCheck(conn, checkNickname);
		close(conn);
		return count2;
	}
	
	/*
	 * public void confirmPwdMember(String userId, String userPwd) {
	 * 
	 * Connection conn = getConnection(); i = new MemberDao().confirmPwdMember(conn,
	 * userId, userPwd);
	 * 
	 * 
	 * }
	 */
	
	
	
	
	
	
	
	
	
	
	

}
