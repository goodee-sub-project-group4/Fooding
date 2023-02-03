package com.fd.restaurant.model.service;

import static com.fd.common.JDBCTemplate.close;
import static com.fd.common.JDBCTemplate.commit;
import static com.fd.common.JDBCTemplate.getConnection;
import static com.fd.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.fd.admin.model.vo.Question;
import com.fd.restaurant.model.dao.RestaurantDao;
import com.fd.restaurant.model.vo.Menu;
import com.fd.restaurant.model.vo.Restaurant;
import com.fd.review.model.vo.Review;

public class RestaurantService {
	
	public Restaurant loginRest(int restNo, String userPwd) {
		Connection conn = getConnection();
		Restaurant r = new RestaurantDao().loginRest(conn, restNo, userPwd);
		close(conn);
		return r;
	}
	
	public int updatePwd(int resNo, String userPwd) {
		Connection conn = getConnection();
		int result = new RestaurantDao().updatePwd(conn, resNo, userPwd);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public Restaurant updateHours(Restaurant r) {
		Connection conn = getConnection();
		int result = new RestaurantDao().updateHours(conn, r);
		Restaurant updateRest = null;
		if(result>0) {
			//업데이트 성공시 회원 정보를 다시 조회해온다.
			commit(conn);
			updateRest = new RestaurantDao().selectRest(conn, r.getResNo());
		} else {
			rollback(conn);
		}
		close(conn);
		return updateRest;
	}
	
	public int insertMenu(ArrayList<Menu> list) {
		Connection conn = getConnection();
		int resultTotal = 0;
		for(Menu m : list) { //메뉴 한개씩 insert 실행
			int result = new RestaurantDao().insertMenu(conn, m);
			resultTotal += result;
		}

		if(resultTotal == list.size()) { 
			//모든 결과가 성공일 경우
			commit(conn);
		}else {
			rollback(conn);
			resultTotal = 0; //Controller에서 실패를 인식할 수 있도록 0을 대입
		}
		close(conn);
		return resultTotal;
	}
	
	public ArrayList<Menu> selectMenu(int resNo) {
		Connection conn = getConnection();
		ArrayList<Menu> list = new RestaurantDao().selectMenu(conn, resNo);
		close(conn);
		return list;
	}
	
	public int updateMenu(ArrayList<Menu> oldList, ArrayList<Menu> newList) {
		Connection conn = getConnection();
		//목표 : Update 먼저 수행하고, 결과가 성공적이면 Insert를 수행한다.
		
		//최종 결과를 판별할 변수 선언, 추가된것이 없을수 있으므로 기본 1 설정
		int oldTotal = 1;
		int newTotal = 1; 
		
		//Update 하러가기
		for(Menu m : oldList) { //메뉴 한개씩 실행
			int result = new RestaurantDao().updateMenu(conn, m);
			oldTotal += result;
		}
		if(oldTotal == oldList.size()+1) { //모든 결과가 성공일때
			//Insert 하러가기
			for(Menu m : newList) { //메뉴 한개씩 실행
				int result = new RestaurantDao().insertMenu(conn, m);
				newTotal += result;
			}
			if(newTotal == newList.size()+1) { 
				//모든 결과가 성공일 경우
				commit(conn);
			}else {
				rollback(conn);
				newTotal = 0; //Controller에서 실패를 인식할 수 있도록 0을 대입
			}

		}else {
			rollback(conn);
			oldTotal = 0; //Controller에서 실패를 인식할 수 있도록 0을 대입
		}
		close(conn);
		return oldTotal*newTotal;
	}
	
	public Restaurant updateInfo(Restaurant r) {
		Restaurant updateRest = null;
		Connection conn = getConnection();
		int result = new RestaurantDao().updateInfo(conn, r);
		if(result>0) {
			commit(conn);
			int resNo = r.getResNo();
			updateRest = new RestaurantDao().selectRest(conn, resNo);
		}else {
			rollback(conn);
		}
		close(conn);
		return updateRest;
	}
	
	public int deleteMenu(int menuNo) {
		Connection conn = getConnection();
		int result = new RestaurantDao().deleteMenu(conn, menuNo);
		if(result>0) {
			commit(conn);
		}else {
			close(conn);
		}
		close(conn);
		return result;
	}
	
	public ArrayList<Question> selectQuestion(int resNo){
		Connection conn = getConnection();
		ArrayList<Question> list = new RestaurantDao().selectQuestion(conn, resNo);
		close(conn);
		return list;
	}
	
	public Question selectDetailQuestion(int qNo) {
		Connection conn = getConnection();
		Question q = new RestaurantDao().selectDetailQuestion(conn,qNo);
		close(conn);
		return q;
	}
	
	public int updateQuestion(int qNo, String aContent) {
		Connection conn = getConnection();
		int result = new RestaurantDao().updateQuestion(conn, qNo, aContent);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public ArrayList<Review> selectReview(int resNo){
		Connection conn = getConnection();
		ArrayList<Review> list = new RestaurantDao().selectReview(conn, resNo);
		close(conn);
		return list;
	}
	
	public ArrayList<Question> selectNewQuestion(int resNo){
		Connection conn = getConnection();
		ArrayList<Question> list = new RestaurantDao().selectNewQuestion(conn, resNo);
		close(conn);
		return list;
	}
	public ArrayList<Review> selectNewReview(int resNo){
		Connection conn = getConnection();
		ArrayList<Review> list = new RestaurantDao().selectNewReview(conn, resNo);
		close(conn);
		return list;
	}
	
	public Review selectReviewDatail(int reviewNo) {
		Connection conn = getConnection();
		Review r = new RestaurantDao().selectReviewDatail(conn, reviewNo);
		close(conn);
		return r;
	}
	

}
