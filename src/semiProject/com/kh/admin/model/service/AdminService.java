package semiProject.com.kh.admin.model.service;

import static semiProject.com.kh.common.JDBCTemplate.close;
import static semiProject.com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;

import semiProject.com.kh.admin.model.dao.AdminDao;
import semiProject.com.kh.course.model.vo.Course;
import semiProject.com.kh.place.model.vo.Place;
import semiProject.com.kh.planAdmin.model.vo.AdminPlan;

public class AdminService {

	// 홍대,강남 등 위치 리스트 가져오기 
	public ArrayList<Place> selectPlist() {
		Connection conn = getConnection();
		ArrayList<Place> list = new AdminDao().selectPlist(conn);
		
		close(conn);
		return list;
	}

	

}
