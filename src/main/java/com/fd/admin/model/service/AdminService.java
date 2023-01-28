package com.fd.admin.model.service;

import static com.fd.common.JDBCTemplate.*;
import static com.fd.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.fd.admin.model.dao.AdminDao;
import com.fd.admin.model.vo.Notice;
import com.fd.common.model.vo.Attachment;
import com.fd.member.model.vo.Member;

public class AdminService {
	
	/**관리자 로그인
	 * @param adminId
	 * @param adminPwd
	 * @return
	 */
	public Member loginAdmin(String adminId, String adminPwd) {
		Connection conn = getConnection();
		Member a = new AdminDao().loginAdmin(conn, adminId, adminPwd);
		close(conn);
		return a;
	}
	
	
	/**회원 공지사항 목록 조회
	 * @return
	 */
	public ArrayList<Notice> selectNoticeListU() {
		Connection conn = getConnection();
		ArrayList<Notice> list = new AdminDao().selectNoticeListU(conn);
		close(conn);
		return list;
	}

	
	/**공지사항 등록
	 * @param n 
	 * @param at
	 * @return
	 */
	public int insertNotice(Notice n, Attachment at) {
		Connection conn = getConnection();
		int result1 = new AdminDao().insertNotice(conn, n);
		int result2 = 1;
		if(at != null) {
			result2 = new AdminDao().insertAttachment(conn, at);
		}
		
		if(result1>0 && result2>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result1*result2;
	}

	
}
