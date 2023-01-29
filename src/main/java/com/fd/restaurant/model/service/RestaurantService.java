package com.fd.restaurant.model.service;

import java.sql.Connection;

import com.fd.restaurant.model.dao.RestaurantDao;
import com.fd.restaurant.model.vo.Restaurant;
import static com.fd.common.JDBCTemplate.*;

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
	

}
