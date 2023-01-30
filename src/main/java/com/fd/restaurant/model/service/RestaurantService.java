package com.fd.restaurant.model.service;

import static com.fd.common.JDBCTemplate.close;
import static com.fd.common.JDBCTemplate.commit;
import static com.fd.common.JDBCTemplate.getConnection;
import static com.fd.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.fd.restaurant.model.dao.RestaurantDao;
import com.fd.restaurant.model.vo.Menu;
import com.fd.restaurant.model.vo.Restaurant;

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
	

}
