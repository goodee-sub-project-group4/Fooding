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

import com.fd.common.model.vo.PageInfo;
import com.fd.restaurant.model.vo.Restaurant;

public class SearchDao {
	
	private Properties prop = new Properties(); 
	
	public SearchDao() {
		
		try {
			prop.loadFromXML(new FileInputStream( SearchDao.class.getResource("db/sql/search-mapper.xml").getPath() ));
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
		int listCount = 0; 
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
			
			// 사용자로부터 입력받은 값으로 sql문 채우기 (5개 빈칸 중 3개)
			pstmt.setString(1, localCt);
			pstmt.setString(2, dLocalCt);
			pstmt.setString(3, foodCt);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1; 
			int endRow = startRow + pi.getBoardLimit() - 1;  
			
			// 나머지 빈칸 채우기 (5개 빈칸 중 2개)
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery(); 
			
			while(rset.next()) {
				list.add(new Restaurant(
										rset.getString("res_name"),
										rset.getString("address"),
										rset.getString("food_ct")
										//rset.getDouble("star"),
										//rset.getInt("count")
										)); 
			}
			
			// 문제점 : 화면에 뿌려져야 할 값들이 들어있는 컬럼들은 
			// res_name 컬럼, address 컬럼, food_ct 컬럼, star 컬럼, count 컬럼인데, 
			// 이 컬럼값 5개를 뽑아줄 수는 있지만, 
			// 얘네를 하나의 객체로 만들어서 ArrayList에 담아줄 수가 없음 
			// res_name컬럼값, address컬럼값, food_ct컬럼값 => Restaurant 객체 
			// star컬럼값, count컬럼값 => Review 객체 
			
			// 우선은 임시방편으로 res_name컬럼값, address컬럼값, food_ct컬럼값만 뽑아서 
			// Restaurant 객체로 만들겠음 (매개변수생성자 이용) 
			
			
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
			pstmt.setString(5, r.getd)
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		
	}
	

}
