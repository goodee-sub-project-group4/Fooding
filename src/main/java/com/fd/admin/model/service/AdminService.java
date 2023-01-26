package com.fd.admin.model.service;

import static com.fd.common.JDBCTemplate.*;

import java.sql.Connection;

import com.fd.admin.model.dao.AdminDao;
import com.fd.member.model.vo.Member;

public class AdminService {

	public Member loginAdmin(String adminId, String adminPwd) {
		Connection conn = getConnection();
		Member a = new AdminDao().loginAdmin(conn, adminId, adminPwd);
		close(conn);
		return a;
	}

	
}
