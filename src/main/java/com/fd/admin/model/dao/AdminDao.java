package com.fd.admin.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;
import static com.fd.common.JDBCTemplate.*;

import com.fd.admin.model.vo.Faq;
import com.fd.admin.model.vo.Notice;
import com.fd.book.model.vo.Book;
import com.fd.book.model.vo.Point;
import com.fd.common.model.vo.Attachment;
import com.fd.member.model.vo.Member;
import com.fd.restaurant.model.vo.Restaurant;


public class AdminDao {

	private Properties prop = new Properties();
	
	public AdminDao() {
		String filePath = AdminDao.class.getResource("/db/sql/admin-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}
		
	/**
	 * 관리자 로그인
	 * @param conn
	 * @param adminId
	 * @param adminPwd
	 * @return
	 */
	public Member loginAdmin(Connection conn, String adminId, String adminPwd) {
		// select문 => ResultSet객체 (한행) => Member객체
		Member a = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("loginAdmin");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, adminId);
			pstmt.setString(2, adminPwd);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				a = new Member(rset.getInt("user_no"),
							   rset.getString("user_id"),
							   rset.getString("user_pwd"),
							   rset.getString("user_name"),
							   rset.getString("status")
							  );
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return a;
	}

	
	/**회원 공지사항 목록 조회
	 * @param conn
	 * @return
	 */
	public ArrayList<Notice> selectNoticeListU(Connection conn) {
		// select문 => ResultSet(여러행)
		ArrayList<Notice> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectNoticeListU");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Notice(rset.getInt("notice_no"),
									rset.getString("notice_title"),
									rset.getString("user_name"),
									rset.getInt("count"),
									rset.getDate("create_date")));
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	/**업체 공지사항 목록 조회
	 * @param conn
	 * @return
	 */
	public ArrayList<Notice> selectNoticeListR(Connection conn) {
		// select문 => ResultSet(여러행)
		ArrayList<Notice> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectNoticeListR");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Notice(rset.getInt("notice_no"),
									rset.getString("notice_title"),
									rset.getString("user_name"),
									rset.getInt("count"),
									rset.getDate("create_date")));
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	
	//공지사항 등록
	/**1.회원 공지사항 등록(제목, 내용, 작성자)
	 * @param conn
	 * @param n
	 * @return
	 */
	public int insertNotice(Connection conn, Notice n) {
		int result=0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNotice");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, n.getNoticeTitle());
			pstmt.setString(2, n.getNoticeContent());
			pstmt.setString(3, n.getUserNo());
			pstmt.setString(4, n.getToWhom());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}	
		return result;
	}

	/**2.회원 공지사항 등록(첨부파일)
	 * @param conn
	 * @param at
	 * @return
	 */
	public int insertNoticeAttachment(Connection conn, Attachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNoticeAttachment");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	// 공지사항 상세 조회
	/**1.공지사항 조회수 증가
	 * @param conn
	 * @param noticeNo
	 * @return
	 */
	public int increseCountNotice(Connection conn, int noticeNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increseCountNotice");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, noticeNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	/**2.공지사항 게시글 정보 조회
	 * @param conn
	 * @param noticeNo
	 * @return
	 */
	public Notice selectNotice(Connection conn, int noticeNo) {
		Notice n = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectNotice");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, noticeNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				n = new Notice(rset.getInt("notice_no")
							 , rset.getString("notice_title")
							 , rset.getString("notice_content")
							 , rset.getString("user_name")
							 , rset.getDate("create_date"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return n;
	}

	/**3. 공지사항 첨부파일 정보 조회
	 * @param conn
	 * @param noticeNo
	 * @return
	 */
	public Attachment selectNoticeAttachment(Connection conn, int noticeNo) {
		Attachment at = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectNoticeAttachment");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, noticeNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				at = new Attachment(rset.getInt("file_no")
								  , rset.getString("origin_name")
								  , rset.getString("change_name")
								  , rset.getString("file_path"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return at;
	}
	
	// 공지사항 수정
	/**1. 게시글 정보만 수정
	 * @param conn
	 * @param n
	 * @return
	 */
	public int updateNotice(Connection conn, Notice n) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateNotice");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, n.getNoticeTitle());
			pstmt.setString(2, n.getNoticeContent());
			pstmt.setInt(3, n.getNoticeNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	/**2. 기존 첨부파일 있었을 경우 첨부파일 업데이트
	 * @param conn
	 * @param n
	 * @return
	 */
	public int updateNoticeAttachment(Connection conn, Attachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateNoticeAttachment");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			pstmt.setInt(4, at.getFileNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	/**3. 기존 첨부파일 없었을 경우 첨부파일 업데이트
	 * @param conn
	 * @param n
	 * @return
	 */
	public int insertNewNoticeAttachment(Connection conn, Attachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNewNoticeAttachment");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, at.getRefBoardNo());
			pstmt.setString(2, at.getOriginName());
			pstmt.setString(3, at.getChangeName());
			pstmt.setString(4, at.getFilePath());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn);
		}		
		return result;
	}

	/**공지사항 삭제
	 * @param conn
	 * @param noticeNo
	 * @return
	 */
	public int deleteNotice(Connection conn, int noticeNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteNotice");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, noticeNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

// ==========================================================================

	/**회원 FAQ 목록 / 상세 조회
	 * @param conn
	 * @return
	 */
	public ArrayList<Faq> selectFaqListU(Connection conn) {
		ArrayList<Faq> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectFaqListU");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Faq(rset.getInt("faq_no"),
								 rset.getString("category"),
								 rset.getString("faq_title"),
								 rset.getString("faq_content")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	/**업체 FAQ 목록 / 상세 조회
	 * @param conn
	 * @return
	 */
	public ArrayList<Faq> selectFaqListR(Connection conn) {
		ArrayList<Faq> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectFaqListR");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Faq(rset.getInt("faq_no"),
								 rset.getString("category"),
								 rset.getString("faq_title"),
								 rset.getString("faq_content")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	
	/**FAQ 카테고리 (아직..안씀,,,)
	 * @param conn
	 * @return
	 */
	public Faq selectCategoryList(Connection conn) {
		Faq f = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCategoryList");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				f = new Faq(rset.getString("category"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return f;
	}

	
	/**FAQ 등록
	 * @param conn
	 * @param f
	 * @return
	 */
	public int insertFaq(Connection conn, Faq f) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertFaq");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, f.getUserNo());
			pstmt.setString(2, f.getCategory());
			pstmt.setString(3, f.getFaqTitle());
			pstmt.setString(4, f.getFaqContent());
			pstmt.setString(5, f.getWho());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
	/**FAQ 조회
	 * @param conn
	 * @param faqNo
	 * @return
	 */
	public Faq selectFaq(Connection conn, int faqNo) {
		Faq f = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectFaq");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, faqNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				f = new Faq(rset.getInt("faq_no"),
						rset.getString("category"),
						rset.getString("faq_title"),
						rset.getString("faq_content"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return f;
	}
	
	/**FAQ 수정
	 * @return
	 */
	public int updateFaq(Connection conn, Faq f) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateFaq");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, f.getCategory());
			pstmt.setString(2, f.getFaqTitle());
			pstmt.setString(3, f.getFaqContent());
			pstmt.setInt(4, f.getFaqNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	
	/**FAQ 삭제
	 * @param conn
	 * @param faqNo
	 * @return
	 */
	public int deleteFaq(Connection conn, int faqNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteFaq");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, faqNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	
	
// ==========================================================================

	/**메인배너 사진 등록
	 * @param conn
	 * @param list
	 * @return
	 */
	public int insertBanner(Connection conn, ArrayList<Attachment> list) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertBanner");
		try {
			for(Attachment at : list) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, at.getOriginName());
				pstmt.setString(2, at.getChangeName());
				pstmt.setString(3, at.getFilePath());
				result = pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	
	/**메인배너 사진 조회
	 * @param conn
	 * @return
	 */
	public ArrayList selectBanner(Connection conn) {
		ArrayList<Attachment> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectBanner");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Attachment at = new Attachment();
				at.setChangeName(rset.getString("change_name"));
				at.setFilePath(rset.getString("file_path"));
				list.add(at);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	
	/**메인배너 삭제
	 * @param conn
	 * @return
	 */
	public int deleteBanner(Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteBanner");
		try {
			pstmt = conn.prepareStatement(sql);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updateBanner(Connection conn, Attachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateBanner");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			pstmt.setInt(4, at.getFileNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	
// ==========================================================================

	/**회원 리스트 조회
	 * @param conn
	 * @return
	 */
	public ArrayList<Member> selectMemberList(Connection conn) {
		ArrayList<Member> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMemberList");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Member(rset.getInt("USER_NO"),
									rset.getString("USER_ID"),
									rset.getString("USER_NAME"),
									rset.getString("USER_PHONE"),
									rset.getString("GENDER"),
									rset.getString("BOOK_COUNT"),
									rset.getString("REVIEW_COUNT"),
									rset.getString("BLACK_COUNT"),
									rset.getString("STATUS")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	
	/**회원 상세 조회
	 * @param conn
	 * @return
	 */
	public Member selectMember(Connection conn, int userNo) {
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMember");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				m = new Member(rset.getInt("user_no"),
							   rset.getString("user_id"),
							   rset.getString("user_name"),
							   rset.getString("nickname"),
							   rset.getString("user_phone"),
							   rset.getString("user_email"),
							   rset.getString("birth"),
							   rset.getString("gender"),
							   rset.getDate("enroll_date"),
							   rset.getInt("point_now"),
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
	

	/**회원 상세 수정
	 * @param conn
	 * @param u
	 * @return
	 */
	public int updateMember(Connection conn, Member u) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateMember");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, u.getUserName());
			pstmt.setString(2, u.getNickname());
			pstmt.setString(3, u.getUserPhone());
			pstmt.setString(4, u.getUserEmail());
			pstmt.setString(5, u.getStatus());
			pstmt.setInt(6, u.getUserNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	
	/**회원 이용내역 조회
	 * @param conn
	 * @param userNo
	 * @return
	 */
	public ArrayList<Member> selectUseList(Connection conn, int userNo) {
		ArrayList<Member> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectUseList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Member(rset.getInt("user_no"),
								    rset.getString("user_id"),
								    rset.getString("book_date"),
								    rset.getString("res_name"),
								    rset.getString("book_time"),
								    rset.getInt("people"),
								    rset.getInt("pay_total"),
								    rset.getInt("pay_point"),
								    rset.getInt("pay_final"),
								    rset.getInt("plus_point"),
								    rset.getString("pay_op")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	
	/**회원 적립금 지급
	 * @param conn
	 * @param p
	 * @return
	 */
	public int givePoint(Connection conn, Point p) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("givePoint");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, p.getUserNo());
			pstmt.setString(2, p.getPointName());
			pstmt.setInt(3, p.getPointTrade());
			pstmt.setInt(4, p.getUserNo());
			pstmt.setInt(5, p.getPointTrade());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	
// ==========================================================================

	/**업체 리스트 조회
	 * @param conn
	 * @return
	 */
	public ArrayList<Restaurant> selectRestList(Connection conn) {
		ArrayList<Restaurant> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectRestList");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Restaurant(rset.getInt("res_no"),
										rset.getString("res_name"),
										rset.getString("book_count"),
										rset.getString("review_count"),
										rset.getString("black_count"),
										rset.getString("status")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	
	/**업체 상세 조회
	 * @param conn
	 * @param resNo
	 * @return
	 */
	public Restaurant selectRest(Connection conn, int resNo) {
		Restaurant r = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;	
		String sql = prop.getProperty("selectRest");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, resNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				r = new Restaurant(rset.getInt("res_no"),
								   rset.getString("res_name"),
								   rset.getString("ceo"),
								   rset.getString("permit_no"),
								   rset.getString("address"),
								   rset.getString("d_address"),
								   rset.getString("phone"),
								   rset.getString("cellphone"),
								   rset.getString("email"),
								   rset.getString("food_ct"),
								   rset.getString("parking"),
								   rset.getString("open"),
								   rset.getString("close"),
								   rset.getString("break_s"),
								   rset.getString("break_e"),
								   rset.getString("enroll_Date"),
								   rset.getString("status"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return r;
	}

	
	/**업체 예약 리스트 조회
	 * @param conn
	 * @param resNo
	 * @return
	 */
	public ArrayList<Book> selectReserveList(Connection conn, int resNo) {
		ArrayList<Book> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReserveList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, resNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Book b = new Book();
				b.setBookNo(rset.getInt("book_no"));
				b.setBookA(rset.getString("book_a"));
				b.setBookName(rset.getString("book_name"));
				b.setBookDate(rset.getString("book_date"));
				b.setBookTime(rset.getString("book_time"));
				b.setStatus(rset.getString("status"));
				list.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	

	
}
