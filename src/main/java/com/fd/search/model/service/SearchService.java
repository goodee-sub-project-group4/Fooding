package com.fd.search.model.service;

import static com.fd.common.JDBCTemplate.close;
import static com.fd.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import static com.fd.common.JDBCTemplate.*;
import com.fd.common.model.vo.Attachment;
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
	
	public int insertRes(Restaurant r, Attachment at) {
		
		Connection conn = getConnection();
		
		int result1 = new SearchDao().insertRes(conn, r);
		
		int result2 = 1;
		if(at != null) {
			result2 = new SearchDao().insertAttachment(conn, at);
		}
		
		if(result1 > 0 && result2 > 0) {
			commit(conn); 
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1 * result2;
		
	}
	
		public int keywordListCount(String keyword) {
		
		Connection conn = getConnection();
		int listCount = new SearchDao().keywordListCount(conn, keyword); 
		close(conn); 
		return listCount; 
	}
		
		public ArrayList<Restaurant> keywordList(PageInfo pi, String keyword){ //currentPage에 보여질 게시물 리스
			
			Connection conn = getConnection();
			ArrayList<Restaurant> list= new SearchDao().keywordList(conn, pi, keyword); 
			close(conn); 
			return list;
		}
		
}
