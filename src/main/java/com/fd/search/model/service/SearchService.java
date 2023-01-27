package com.fd.search.model.service;

import static com.fd.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.fd.search.model.dao.SearchDao;
import com.fd.search.model.vo.Search;

public class SearchService {
	
	public ArrayList<Search> selectSearch(String keyword) {
		Connection conn = getConnection(); 
		ArrayList<Search> list = new SearchDao().selectSearch(conn, keyword); 
		close(conn); 
		
		return list; 
	}
}
