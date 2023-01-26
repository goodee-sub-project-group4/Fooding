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

}
