package semiProject.com.kh.planAdmin.model.service;

import static semiProject.com.kh.common.JDBCTemplate.close;
import static semiProject.com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import semiProject.com.kh.place.model.vo.Place;
import semiProject.com.kh.planMy.model.dao.PlanMyDao;

public class AdminPlanService {

	
	public ArrayList<Place> selectList() {
		
		Connection conn = getConnection();
		
		
		ArrayList<Place> list = new PlanMyDao().selectList(conn);
		
		close(conn);
		return list;
		
	}

	
	
	

}
  