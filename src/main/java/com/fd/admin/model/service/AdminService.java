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
import com.fd.book.model.vo.Book;
import com.fd.book.model.vo.BookMenu;
import com.fd.book.model.vo.Payment;
import com.fd.book.model.vo.Point;
import com.fd.common.model.vo.Attachment;
import com.fd.member.model.vo.Member;
import com.fd.restaurant.model.dao.RestaurantDao;
import com.fd.restaurant.model.vo.Restaurant;

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


// ==========================================================================

	/**메인배너 사진 등록
	 * @param list
	 * @return
	 */
	public int insertBanner(ArrayList<Attachment> list) {
		Connection conn = getConnection();
		int result = new AdminDao().insertBanner(conn, list);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	/**메인배너 사진 조회
	 * @return
	 */
	public ArrayList<Attachment> selectBanner() {
		Connection conn = getConnection();
		ArrayList list = new AdminDao().selectBanner(conn);
		close(conn);
		return list;
	}


	/**메인배너 삭제
	 * @return
	 */
	public int deleteBanner() {
		Connection conn = getConnection();
		int result = new AdminDao().deleteBanner(conn);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}


	/**메인배너 수정
	 * @param at
	 * @return
	 */
	public int updateBanner(Attachment at) {
		Connection conn = getConnection();
		int result = 1;
		if(at != null) {
			if(at.getFileNo() != 0) {
				result = new AdminDao().updateBanner(conn, at);
			}
		}
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

// ==========================================================================

	
	/**회원 리스트 조회
	 * @return
	 */
	public ArrayList<Member> selectMemberList() {
		Connection conn = getConnection();
		ArrayList<Member> list = new AdminDao().selectMemberList(conn);
		close(conn);
		return list;
	}


	/**회원 상세 조회
	 * @param userNo
	 * @return
	 */
	public Member selectMember(int userNo) {
		Connection conn = getConnection();
		Member m = new AdminDao().selectMember(conn, userNo);
		close(conn);
		return m;
	}


	/**회원 상세 수정
	 * @param userNo
	 * @return
	 */
	public int updateMember(Member u) {
		Connection conn = getConnection();
		int result = new AdminDao().updateMember(conn, u);
		if(result>0){
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}


	/**회원 이용내역 조회
	 * @param userNo
	 * @return
	 */
	public ArrayList<Member> selectUseList(int userNo) {
		Connection conn = getConnection();
		ArrayList<Member> list = new AdminDao().selectUseList(conn, userNo);
		close(conn);
		return list;
	}

	
	/**회원 적립금 지급
	 * @param p
	 * @return
	 */
	public int givePoint(Point p) {
		Connection conn = getConnection();
		int result = new AdminDao().givePoint(conn, p);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	
// ==========================================================================

	/**업체 리스트 조회
	 * @return
	 */
	public ArrayList<Restaurant> selectRestList() {
		Connection conn = getConnection();
		ArrayList<Restaurant> list = new AdminDao().selectRestList(conn);
		close(conn);
		return list;
	}


	/**업체 상세 조회
	 * @param resNo
	 * @return
	 */
	public Restaurant selectRest(int resNo) {
		Connection conn = getConnection();
		Restaurant r = new AdminDao().selectRest(conn, resNo);
		close(conn);
		return r;
	}


	/**업체 예약 리스트 조회
	 * @param resNo
	 * @return
	 */
	public ArrayList<Book> selectReserveList(int resNo) {
		Connection conn = getConnection();
		ArrayList<Book> list = new AdminDao().selectReserveList(conn, resNo);
		close(conn);
		return list;
	}


	/**업체 예약 리스트 상세 조회
	 * @param bookNo
	 * @return
	 */
	public Book selectBook(int bookNo) {
		Connection conn = getConnection();
		Book b = new RestaurantDao().selectBook(conn, bookNo);
		close(conn);
		return b;
	}

	public ArrayList<BookMenu> selectBookMenu(int bookNo) {
		Connection conn = getConnection();
		ArrayList<BookMenu> list = new RestaurantDao().selectBookMenu(conn, bookNo);
		close(conn);
		return list;
	}

	public Payment selectPayment(int bookNo) {
		Connection conn = getConnection();
		Payment p = new RestaurantDao().selectPayment(conn, bookNo);
		close(conn);
		return p;
	}


	// ==========================================================================

	/**업체 등록 요청 리스트
	 * @return
	 */
	public ArrayList<Restaurant> selectRegisterList() {
		Connection conn = getConnection();
		ArrayList<Restaurant> list = new AdminDao().selectRegisterList(conn);
		close(conn);
		return list;
	}

	
	// 업체 등록 상세 조회
	/**조회수
	 * @param resNo
	 * @return
	 */
	public int increseCountRes(int resNo) {
		Connection conn = getConnection();
		int result = new AdminDao().increseCountRegister(conn, resNo);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	/**업체 등록 게시물 상세 조회
	 * @param resNo
	 * @return
	 */
	public Restaurant selectRegister(int resNo) {
		Connection conn = getConnection();
		Restaurant r = new AdminDao().selectRegister(conn, resNo);
		close(conn);
		return r;
	}

	/**업체 등록 승인(Y)
	 * @param resNo
	 * @return
	 */
	public int restStatusY(int resNo) {
		Connection conn = getConnection();
		int result = new AdminDao().restStatusY(conn, resNo);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	/**업체 등록 승인(N)
	 * @param resNo
	 * @return
	 */
	public int restStatusN(int resNo) {
		Connection conn = getConnection();
		int result = new AdminDao().restStatusN(conn, resNo);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}




	
	
}
