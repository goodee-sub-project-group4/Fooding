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
		return list;
		
	}
	
	/** 조회수
	 * @author 빛나
	 * @param noticeNo
	 * @return result
	 */
	public int increaseCount(int noticeNo) {
		
		Connection conn = getConnection();
		int result = new MemberNoticeDao().increaseCount(conn, noticeNo);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
		
	}
	
	/** 공지사항 리스트 상세조회
	 * @author 빛나
	 * @param noticeNo
	 * @return n
	 */
	public Notice selectMemberNoticeDetail(int noticeNo) {
		
		Connection conn = getConnection();
		Notice n = new MemberNoticeDao().selectMemberNoticeDetail(conn, noticeNo);
		close(conn);
		return n;
	}
	
	
	

}
