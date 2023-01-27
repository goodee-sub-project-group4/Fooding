package com.fd.search.model.dao;

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

import static com.fd.common.JDBCTemplate.*;
import com.fd.search.model.vo.Search;

public class SearchDao {
	
	private Properties prop = new Properties();
	
	public SearchDao() {
		
		try {
			prop.loadFromXML(new FileInputStream(SearchDao.class.getResource("/db/sql/search-mapper.xml").getPath()));
		} catch (InvalidPropertiesFormatException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Search> selectSearch(Connection conn, String keyword){
		
		ArrayList<Search> list = new ArrayList<>(); 
		PreparedStatement pstmt = null; 
		ResultSet rset = null; 
		
		String sql = prop.getProperty("selectSearch");
		try {
			pstmt = conn.prepareStatement(sql); // 미완성된 sql문 
			pstmt.setString(1, keyword); // sql문 완성시키기 
			
			rset = pstmt.executeQuery(); // 실행 
			
			while(rset.next()) {
				list.add(new Search(
									rset.getInt("res_no"),
									rset.getString("res_name"),
									rset.getString("ceo"),
									rset.getString("permit_no"),
									rset.getString("address"),
									rset.getString("local_ct"),
									rset.getString("dlocal_ct"),
									rset.getString("phone"),
									rset.getString("celphone"),
									rset.getString("email"),
									rset.getDate("apply_date"),
									rset.getString("longtitude"),
									rset.getString("latitude"),
									rset.getString("food_ct")
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
}
