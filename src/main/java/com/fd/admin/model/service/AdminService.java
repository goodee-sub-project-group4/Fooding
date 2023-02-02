package com.fd.admin.model.service;

import static com.fd.common.JDBCTemplate.close;
import static com.fd.common.JDBCTemplate.commit;
import static com.fd.common.JDBCTemplate.getConnection;
import static com.fd.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.fd.admin.model.dao.AdminDao;
import com.fd.admin.model.vo.Faq;
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
	
	/**업체 공지사항 목록 조회
	 * @return
	 */
	public ArrayList<Notice> selectNoticeListR() {
		Connection conn = getConnection();
		ArrayList<Notice> list = new AdminDao().selectNoticeListR(conn);
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
		// 게시글 등록
		int result1 = new AdminDao().insertNotice(conn, n);
		int result2 = 1;
		if(at != null) {
			// 첨부파일 등록
			result2 = new AdminDao().insertNoticeAttachment(conn, at);
		}
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result1*result2;
	}

	// 공지사항 상세 조회
	/**1.공지사항 조회수 증가
	 * @param noticeNo
	 * @return
	 */
	public int increseCountNotice(int noticeNo) {
		Connection conn = getConnection();
		int result = new AdminDao().increseCountNotice(conn, noticeNo);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	/**2.공지사항 게시글 정보 조회
	 * @param noticeNo
	 * @return
	 */
	public Notice selectNotice(int noticeNo) {
		Connection conn = getConnection();
		Notice n = new AdminDao().selectNotice(conn, noticeNo);
		close(conn);
		return n;
	}

	/**3.공지사항 첨부파일 정보 조회
	 * @param noticeNo
	 * @return
	 */
	public Attachment selectNoticeAttachment(int noticeNo) {
		Connection conn = getConnection();
		Attachment at = new AdminDao().selectNoticeAttachment(conn, noticeNo);
		close(conn);
		return at;
	}


	/**공지사항 수정
	 * @param n
	 * @param at
	 * @return
	 */
	public int updateNotice(Notice n, Attachment at) {
		Connection conn = getConnection();
		// 게시글 정보만 수정
		int result1 = new AdminDao().updateNotice(conn, n);
		int result2 = 1;
		if(at != null) {
			if(at.getFileNo()!=0) {
				// 기존 첨부파일 있었을 경우 첨부파일 업데이트
				result2 = new AdminDao().updateNoticeAttachment(conn, at);
			}else {
				// 기존 첨부파일 없었을 경우 첨부파일 업데이트 
				result2 = new AdminDao().insertNewNoticeAttachment(conn, at);
			}
		}
		if(result1 > 0 && result2 >0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result1 * result2;
	}


	/**공지사항 삭제
	 * @param noticeNo
	 * @return
	 */
	public int deleteNotice(int noticeNo) {
		Connection conn = getConnection();
		int result = new AdminDao().deleteNotice(conn, noticeNo);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

// ==========================================================================

	/**회원 FAQ 목록 / 상세 조회
	 * @return
	 */
	public ArrayList<Faq> selectFaqListU() {
		Connection conn = getConnection();
		ArrayList<Faq> list = new AdminDao().selectFaqListU(conn);
		close(conn);
		return list;
	}

	/**업체 FAQ 목록 / 상세 조회
	 * @return
	 */
	public ArrayList<Faq> selectFaqListR() {
		Connection conn = getConnection();
		ArrayList<Faq> list = new AdminDao().selectFaqListR(conn);
		close(conn);
		return list;
	}

	
	/**FAQ 카테고리 (아직..안씀,,,)
	 * @return
	 */
	public Faq selectCategoryList() {
		Connection conn = getConnection();
		Faq f = new AdminDao().selectCategoryList(conn);
		close(conn);
		return f;
	}

	
	/**FAQ 등록
	 * @param f
	 * @return
	 */
	public int insertFaq(Faq f) {
		Connection conn = getConnection();
		int result = new AdminDao().insertFaq(conn, f);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	
	/**FAQ 조회
	 * @param faqNo
	 * @return
	 */
	public Faq selectFaq(int faqNo) {
		Connection conn = getConnection();
		Faq f = new AdminDao().selectFaq(conn, faqNo);
		close(conn);
		return f;
	}
	
	/**FAQ 수정
	 * @return
	 */
	public int updateFaq(Faq f) {
		Connection conn = getConnection();
		int result = new AdminDao().updateFaq(conn, f);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}


	/**FAQ 삭제
	 * @param faqNo
	 * @return
	 */
	public int deleteFaq(int faqNo) {
		Connection conn = getConnection();
		int result = new AdminDao().deleteFaq(conn, faqNo);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	








	
	
	
	
}
