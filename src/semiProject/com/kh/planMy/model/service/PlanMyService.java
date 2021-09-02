package semiProject.com.kh.planMy.model.service;

import static semiProject.com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import semiProject.com.kh.place.model.vo.Place;
import semiProject.com.kh.planMy.model.dao.PlanMyDao;

public class PlanMyService {

	public ArrayList<Place> selectList() {
		Connection conn = getConnection();
		ArrayList<Place> list = new PlanMyDao().selectList(conn);
		
		close(conn);
		return list;
	}

}
