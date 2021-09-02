package semiProject.com.kh.place.model.service;

import static semiProject.com.kh.common.JDBCTemplate.*;
import java.sql.Connection;

import semiProject.com.kh.place.model.dao.PlaceDao;
import semiProject.com.kh.place.model.vo.Place;

public class PlaceService {

	public Place selectPlace(int pno) {
		Connection conn = getConnection();
		
		int result = new PlaceDao().increaseCount(conn, pno);
		
		Place p = null;
		
		if(result > 0) {
			commit(conn);
			p = new PlaceDao().selectPlace(conn, pno);
		}else {
			rollback(conn);
		}
		
		return p;
	}

}
