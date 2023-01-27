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
	

}
