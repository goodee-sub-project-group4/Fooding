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

}
