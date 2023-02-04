package com.fd.search.model.dao;

import static com.fd.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import com.fd.common.model.vo.Attachment;
import com.fd.common.model.vo.PageInfo;
import com.fd.restaurant.model.vo.Restaurant;

public class SearchDao {
	
	private Properties prop = new Properties(); 
	
	public SearchDao() {
		String filePath = SearchDao.class.getResource("/db/sql/search-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (InvalidPropertiesFormatException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 카테고리 검색시, 검색결과 총 갯수를 반환하는 메소드 (검색된 음식점의 총 갯수)
	 * @param conn
	 * @param localCt
	 * @param dLocalCt
	 * @param foodCt
	 * @return int listCount
	 */
	public int selectListCount(Connection conn, String localCt, String dLocalCt, String foodCt) {
		// select => ResultSet(숫자 한 개 ) => int 
		
		int listCount = 0; // 총 검색결과 갯수
		PreparedStatement pstmt = null; 
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount"); 
		
		try {
			pstmt = conn.prepareStatement(sql); // 미완성된 sql문 
			
			pstmt.setString(1, localCt);
			pstmt.setString(2, dLocalCt);
			pstmt.setString(3, foodCt);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count"); 
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount; 
		
	}
	
	/**
	 * 카테고리 검색시, 검색된 업체의 '업체번호, 업체명, 주소(주소+상세주소), 이미지경로, 업종(음식카테고리명), 별점평균, 조회수'가 담긴 객체들의 리스트를 반환하는 메소드
	 * @param conn
	 * @param pi
	 * @param localCt
	 * @param dLocalCt
	 * @param foodCt
	 * @return ArrayList<Restaurant> list
	 */
	public ArrayList<Restaurant> selectList(Connection conn,PageInfo pi, String localCt, String dLocalCt, String foodCt){
		ArrayList<Restaurant> list = new ArrayList<>();
		PreparedStatement pstmt = null; 
		ResultSet rset = null; 
		String sql = prop.getProperty("selectList"); 
		
		try {
			pstmt = conn.prepareStatement(sql); // 미완성된 sql문 
			
			// 사용자로부터 입력받은 값으로 sql문 채우기 
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1; 
			int endRow = startRow + pi.getBoardLimit() - 1;  
			
			pstmt.setString(1, localCt);
			pstmt.setString(2, dLocalCt);
			pstmt.setString(3, foodCt);
			pstmt.setString(4, localCt);
			pstmt.setString(5, dLocalCt);
			pstmt.setString(6, foodCt);
			pstmt.setInt(7, startRow);
			pstmt.setInt(8, endRow);
			
			rset = pstmt.executeQuery(); 
			
			while(rset.next()) {
				list.add(new Restaurant(
										rset.getInt("res_no"),
										rset.getString("res_name"),
										rset.getString("address"),
										rset.getString("r_img"),
										rset.getString("food_ct"),
										rset.getDouble("review_avg"),
										rset.getInt("count"),
										rset.getInt("total_review")
										)); 		
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt); 
		}
		
		return list; 
		
	}
	
	/**
	 * 업체등록요청폼 메소드1 (성공적으로 등록이 되었을 경우 result 값으로 1 반환)
	 * @param conn
	 * @param r
	 * @return int result
	 */
	public int insertRes(Connection conn, Restaurant r) {
		
		int result = 0; 
		PreparedStatement pstmt = null; 
		String sql = prop.getProperty("insertRes"); 
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, r.getResName()); 
			pstmt.setString(2, r.getCeo());
			pstmt.setString(3, r.getPermitNo());
			pstmt.setString(4, r.getAddress());
			pstmt.setString(5, r.getdAddress());
			// localCt
			pstmt.setString(6, r.getLocalCt());
			// dLocalCt 
			pstmt.setString(7, r.getdLocalCt());
			pstmt.setString(8, r.getPhone()); 
			pstmt.setString(9, r.getCellphone());
			pstmt.setString(10, r.getEmail()); 
			pstmt.setString(11, r.getFoodCt());
			pstmt.setString(12, r.getParking());
			pstmt.setString(13, r.getOpen());
			pstmt.setString(14, r.getClose());
			pstmt.setString(15, r.getBreakS());
			pstmt.setString(16, r.getBreakE());
			pstmt.setString(17, r.getLongtitude());
			pstmt.setString(18, r.getLatitude());
			
			result = pstmt.executeUpdate(); 
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt); 
		}
		
		return result; 
	}
	
	/**
	 * 업체등록폼 메소드 2 (업체의 첨부파일 사진을 저장하는 메소드)
	 * @param conn
	 * @param at
	 * @return int result
	 */
	public int insertAttachment(Connection conn, Attachment at) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAttachment");
		
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
	
	/**
	 * 키워드 검색시, 해당 키워드로 검색된 업체의 총 갯수를 반환하는 메소드 
	 * @param conn
	 * @param keyword
	 * @return int listCount 
	 */
	public int keywordListCount(Connection conn, String keyword) {
		// select => ResultSet(숫자 한 개 ) => int 
		
		int listCount = 0; // 총 검색결과 갯수
		PreparedStatement pstmt = null; 
		ResultSet rset = null;
		String sql = prop.getProperty("keywordListCount"); 
		
		try {
			pstmt = conn.prepareStatement(sql); // 미완성된 sql문 
			
			pstmt.setString(1, keyword);
			pstmt.setString(2, keyword);
			pstmt.setString(3, keyword);
			pstmt.setString(4, keyword);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count"); 
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount; 
		
	}
	
	
		/**
		 * 키워드 검색시, 해당 키워드로 검색된 업체들의 정보를 담은 객체들이 담긴 리스트를 반환하는 메소드 
		 * @param conn
		 * @param pi
		 * @param keyword
		 * @return ArrayList<Restraunt> list
		 */
		public ArrayList<Restaurant> keywordList(Connection conn, PageInfo pi, String keyword){
		
			ArrayList<Restaurant> list = new ArrayList<>();
			PreparedStatement pstmt = null; 
			ResultSet rset = null; 
			String sql = prop.getProperty("keywordList"); 
			
			try {
				pstmt = conn.prepareStatement(sql); // 미완성된 sql문 
				
				// 사용자로부터 입력받은 값으로 sql문 채우기 
				
				int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1; 
				int endRow = startRow + pi.getBoardLimit() - 1;  
				
				pstmt.setString(1, keyword);
				pstmt.setString(2, keyword);
				pstmt.setString(3, keyword);
				pstmt.setString(4, keyword);
				pstmt.setString(5, keyword);
				pstmt.setString(6, keyword);
				pstmt.setString(7, keyword);
				pstmt.setString(8, keyword);
				pstmt.setInt(9, startRow);
				pstmt.setInt(10, endRow);
				
				rset = pstmt.executeQuery(); 
				
				while(rset.next()) {
					list.add(new Restaurant(
											rset.getInt("res_no"),
											rset.getString("res_name"),
											rset.getString("address"),
											rset.getString("r_img"),
											rset.getString("food_ct"),
											rset.getDouble("review_avg"),
											rset.getInt("count"),
											rset.getInt("total_review")
											)); 		
					
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt); 
			}
			
			return list; 
		
		}
		
		
		
		/**
		 * 사용자가 찜하기를 눌렀을 경우, GOOD 테이블에 해당 정보를 INSERT하는 메소드 
		 * @param conn
		 * @param resNo
		 * @param userNo
		 * @return int result
		 */
		public int insertGood(Connection conn, int resNo, int userNo) {
			int result = 0; 
			PreparedStatement pstmt = null; 
			String sql = prop.getProperty("insertGood"); 
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, resNo);
				pstmt.setInt(2, userNo);
				pstmt.setInt(3, resNo);
				pstmt.setInt(4, userNo);
				
				result = pstmt.executeUpdate(); 
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt); 
			}
			
			return result; 
		}
		
	
	
	
	

}
