package com.fd.member.model.service;

import java.sql.Connection;

import static com.fd.common.JDBCTemplate.*;
import com.fd.member.model.dao.MemberDao;
import com.fd.member.model.vo.Member;

public class MemberService {
	
	/** 로그인 / (마이페이지) 비밀번호 확인
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
	 
	 
	/** 회원정보수정
	 * @author 빛나
	 * @param m
	 * @return updateMem
	 */
	public Member updateMember(Member m) {
		
		Connection conn = getConnection();
		int result = new MemberDao().updateMember(conn, m);
		Member updateMem = null;
		if(result > 0) {
			commit(conn);
			// 갱신된 회원 객체 다시 조회 m대신 updateMem
			updateMem = new MemberDao().selectMember(conn, m.getUserId(), m.getUpdatePwd());
			
		} else {
			rollback(conn); // 변경에 실패 시 null
		}
		
		close(conn);
		
		return updateMem;
		
	}
	
	public int confirmDeleteMember(String userId, String userPwd) {
		
		Connection conn = getConnection();
		int result = new MemberDao().confirmDeleteMember(conn, userId, userPwd);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		return result;
		
	}
	
	
	
	
	
	
	
	
	
	
	

}
