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
	
	public int insertRes(Restaurant r/*, Attachment at*/) {
		
		Connection conn = getConnection();
		
		int result1 = new SearchDao().insertRes(conn, r);
		
		/* 원래있던 코드1 일단 주석처리 
		int result2 = 1;
		if(at != null) {
			result2 = new SearchDao().insertAttachment(conn, at);
		}
		*/
		
		/* 원래있던 코드2 일단 주석처리
		if(result1 > 0 && result2 > 0) {
			commit(conn); 
		}else {
			rollback(conn);
		}
		*/
		
		// 추가한 코드1 
		if(result1 > 0) {
			commit(conn); 
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1 /** result2*/;
		
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
		
		
		public int insertGood(int resNo, int userNo) {
			Connection conn = getConnection(); 
			int result = new SearchDao().insertGood(conn, resNo, userNo); 
			if(result > 0) {
				commit(conn); 
			}else {
				rollback(conn); 
			}
			close(conn); 
			return result; 
	}
	
		public int deleteGood(int resNo, int userNo) {
			Connection conn = getConnection(); 
			int result = new SearchDao().deleteGood(conn, resNo, userNo); 
			if(result > 0) {
				commit(conn); 
			}else {
				rollback(conn); 
			}
			close(conn); 
			return result; 
	}
		
		// jsp파일 만들면 사용할  메소드 
		public int selectGoodCount(int userNo) {
			
			Connection conn = getConnection();
			int listCount = new SearchDao().selectGoodCount(conn, userNo); 
			close(conn); 
			return listCount; 
		}
		
		// jsp 파일 만들면 사용할 메소드 
		public ArrayList<Restaurant> selectGoodList(PageInfo pi, int userNo){ //currentPage에 보여질 게시물 리스
			
			Connection conn = getConnection();
			ArrayList<Restaurant> list= new SearchDao().selectGoodList(conn, pi, userNo); 
			close(conn); 
			return list;
		}
		

		
}
