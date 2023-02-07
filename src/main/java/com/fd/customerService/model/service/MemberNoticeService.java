package com.fd.customerService.model.service;

import static com.fd.common.JDBCTemplate.close;
import static com.fd.common.JDBCTemplate.commit;
import static com.fd.common.JDBCTemplate.getConnection;
import static com.fd.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.fd.admin.model.vo.Faq;
import com.fd.admin.model.vo.Notice;
import com.fd.admin.model.vo.Question;
import com.fd.common.model.vo.PageInfo;
import com.fd.customerService.model.dao.MemberNoticeDao;
import com.fd.customerService.model.vo.Attachment;


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
	
	/** 페이징 포함 FAQ 리스트 조회
	 * @author 빛나
	 * @return list
	 */
	public ArrayList<Faq> selectFAQList(PageInfo pi) {
		
		Connection conn = getConnection();
		ArrayList<Faq> list = new MemberNoticeDao().selectFAQList(conn, pi);
		close(conn);
		return list;
	}
	
	/** FAQ 페이징
	 * @return listCount
	 */
	public int selectListCount() {
		
		Connection conn = getConnection();
		int listCount = new MemberNoticeDao().selectListCount(conn);
		close(conn);
		return listCount;
		
	}
	
	
	/** 1:1문의(업체)리스트
	 * @return listA
	 */
	public ArrayList<Question> selectMemberQuestionListR() {
		
		Connection conn = getConnection();
		ArrayList<Question> listR = new MemberNoticeDao().selectMemberQuestionListR(conn);
		close(conn);
		return listR;
	}
	
	/** 1:1문의(관리자)리스트
	 * @return listR
	 */
	public ArrayList<Question> selectMemberQuestionListA() {
		
		Connection conn = getConnection();
		ArrayList<Question> listA = new MemberNoticeDao().selectMemberQuestionListA(conn);
		close(conn);
		return listA;
		
	}
	
	/** 1:1문의(관리자)글쓰기
	 * @author 빛나
	 * @param q
	 * @param at
	 * @return 
	 */
	public int insertQuestion(Question q, Attachment at) {
		
		Connection conn = getConnection();
		int result1 = new MemberNoticeDao().insertQuestionAdmin(conn, q);
		
		int result2 = 1;
		if(at != null) {
			result2 = new MemberNoticeDao().insertQuestionAttachment(conn, at);
		} 
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result1*result2;
		
	}
	
	/** 1:1문의 조회수
	 * @param qNo
	 * @return result
	 */
	public int increaseCountQ(int qNo) {
		
		Connection conn = getConnection();
		int result = new MemberNoticeDao().increaseCount(conn, qNo);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	/** 1:1문의 상세조회
	 * @param qNo
	 * @return q
	 */
	public Question selectQuestion(int qNo) {
		
		Connection conn = getConnection();
		Question q = new MemberNoticeDao().selectQuestion(conn, qNo);
		close(conn);
		return q;
		
	}
	
	/** 1:1문의 상세조회 사진첨부
	 * @param qNo
	 * @return at
	 */
	public Attachment selectAttachment(int qNo) {
		
		Connection conn = getConnection();
		Attachment at = new MemberNoticeDao().selectAttachment(conn, qNo);
		close(conn);
		return at;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
