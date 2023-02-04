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
			pstmt.setInt(4, startRow);
			pstmt.setInt(5, endRow);
			
			rset = pstmt.executeQuery(); 
			
			while(rset.next()) {
				list.add(new Restaurant(
										rset.getInt("res_no"),
										rset.getString("res_name"),
										rset.getString("address"),
										rset.getString("r_img"),
										rset.getString("food_ct"),
										rset.getDouble("star"),
										rset.getInt("count")
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
			pstmt.setString(5, keyword);
			
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
				pstmt.setInt(6, startRow);
				pstmt.setInt(7, endRow);
				
				rset = pstmt.executeQuery(); 
				
				while(rset.next()) {
					list.add(new Restaurant(
											rset.getInt("res_no"),
											rset.getString("res_name"),
											rset.getString("address"),
											rset.getString("r_img"),
											rset.getString("food_ct"),
											rset.getDouble("star"),
											rset.getInt("count")
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
