package com.fd.customerService.model.service;

import static com.fd.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.fd.admin.model.vo.Notice;
import com.fd.customerService.model.dao.MemberNoticeDao;

public class MemberNoticeService {
	
	/** 공지사항 리스트
	 * @author 빛나
	 * @return list
	 */
	public ArrayList<Notice> selectMemberNoticeList() {
		
		Connection conn = getConnection();
		ArrayList<Notice> list = new MemberNoticeDao().selectMemberNoticeList(conn);
		close(conn);
		System.out.println("리스트가 담겨왓나 : " + list);
		return list;
		
	}

}
