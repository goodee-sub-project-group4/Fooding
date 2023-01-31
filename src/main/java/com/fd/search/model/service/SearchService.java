package com.fd.search.model.service;

import static com.fd.common.JDBCTemplate.close;
import static com.fd.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.fd.common.model.vo.PageInfo;
import com.fd.restaurant.model.vo.Restaurant;
import com.fd.search.model.dao.SearchDao;

public class SearchService {
	
	public int selectListCount(String localCt, String dLocalCt, String foodCt) {
		
		Connection conn = getConnection();
		int listCount = new SearchDao().selectListCount(conn, localCt, dLocalCt, foodCt); 
		close(conn); 
		return listCount; 
	}
	
	public ArrayList<Restaurant> selectList(PageInfo pi, String localCt, String dLocalCt, String foodCt){ //currentPage에 보여질 게시물 리스
		
		Connection conn = getConnection();
		ArrayList<Restaurant> list= new SearchDao().selectList(conn, pi, localCt, dLocalCt, foodCt); 
		close(conn); 
		return list;
	}
	
	public int insertRes(Restaurant r) {
		
		Connection conn = getConnection(); 
		int result = new SearchDao().insertRes(conn, r);
		close(conn); 
		return result; 
	}
}
