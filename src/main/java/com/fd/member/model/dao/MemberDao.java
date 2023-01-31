package com.fd.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import static com.fd.common.JDBCTemplate.*;
import com.fd.member.model.vo.Member;

public class MemberDao {
	
	// properties객체 생성
	private Properties prop = new Properties();
	
	public MemberDao() {
		
		String filePath = MemberDao.class.getResource("/db/sql/member-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	/** 로그인 / (마이페이지) 비밀번호 확인
	 * @author 빛나
	 * @param conn
	 * @param userId
	 * @param userPwd
	 * @return m
	 */
	public Member loginMember(Connection conn, String userId, String userPwd) {
		// select문
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("loginMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				m = new Member(rset.getInt("user_no"),
							   rset.getString("user_id"),
							   rset.getString("user_pwd"),
							   rset.getString("user_name"),
							   rset.getString("nickname"),
							   rset.getString("user_email"),
							   rset.getString("user_phone"),
							   rset.getString("gender"),
							   rset.getString("birth"),
							   rset.getDate("enroll_date"),
							   rset.getDate("modify_date"),
							   rset.getString("status"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
		
	}
	
	/** 회원가입
	 * @param conn
	 * @param m 
	 * @return result 
	 */
	public int insertMember(Connection conn, Member m) {
		// insert문
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPwd());
			pstmt.setString(3, m.getUserName());
			pstmt.setString(4, m.getNickname());
			pstmt.setString(5, m.getUserEmail());
			pstmt.setString(6, m.getUserPhone());
			pstmt.setString(7, m.getGender());
			pstmt.setString(8, m.getBirth());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	/** 아이디 중복체크
	 * @author 빛나
	 * @param conn
	 * @param checkId
	 * @return count (중복된 아이디 값의 개수)
	 */
	public int idCheck(Connection conn, String checkId) {
		
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("idCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, checkId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return count;
	
	}
	
	/** 닉네임 중복체크
	 * @author 빛나
	 * @param conn
	 * @param checkNickname
	 * @return count2 (중복된 닉네임 값의 개수)
	 */
	public int nicknameCheck(Connection conn, String checkNickname) {

		int count2 = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("nicknameCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, checkNickname);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count2 = rset.getInt("count2");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return count2;
		
	}
	
	/** 회원정보수정
	 * @author 빛나
	 * @param conn
	 * @param m
	 * @return result
	 */
	public int updateMember(Connection conn, Member m) {
		// update
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getUpdatePwd());
			pstmt.setString(2, m.getUserName());
			pstmt.setString(3, m.getNickname());
			pstmt.setString(4, m.getUserEmail());
			pstmt.setString(5, m.getUserPhone());
			pstmt.setString(6, m.getGender());
			pstmt.setString(7, m.getBirth());
			pstmt.setString(8, m.getUserId());
			pstmt.setString(9, m.getUserPwd());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}

	/** 회원정보수정(갱신된 회원 객체 다시 조회)
	 * @param conn
	 * @param userId
	 * @param userPwd
	 * @return m
	 */
	public Member selectMember(Connection conn, String userId, String userPwd) {
		// select => ResultSet(한행) => Member객체
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMember");
		System.out.println(userPwd);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				m = new Member(rset.getInt("user_no"),
						   rset.getString("user_id"),
						   rset.getString("user_pwd"),
						   rset.getString("user_name"),
						   rset.getString("nickname"),
						   rset.getString("user_email"),
						   rset.getString("user_phone"),
						   rset.getString("gender"),
						   rset.getString("birth"),
						   rset.getDate("enroll_date"),
						   rset.getDate("modify_date"),
						   rset.getString("status"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
		
	}
	
	/** 회원탈퇴
	 * @param conn
	 * @param userId
	 * @param userPwd
	 * @return result
	 */
	public int confirmDeleteMember(Connection conn, String userId, String userPwd) {
		//update
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("confirmDeleteMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
