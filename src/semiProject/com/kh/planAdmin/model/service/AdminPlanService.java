package semiProject.com.kh.planAdmin.model.service;

import static semiProject.com.kh.common.JDBCTemplate.close;
import static semiProject.com.kh.common.JDBCTemplate.commit;
import static semiProject.com.kh.common.JDBCTemplate.getConnection;
import static semiProject.com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;

import semiProject.com.kh.board.model.vo.PlaceAttachment;
import semiProject.com.kh.place.model.dao.PlaceDao;
import semiProject.com.kh.place.model.vo.Place;
import semiProject.com.kh.planAdmin.model.dao.AdminPlanDao;
import semiProject.com.kh.planAdmin.model.vo.AdminPlan;

public class AdminPlanService {


	//다시하는중 - 0915 

	//플레이스


	public ArrayList<Place> selectPList(int area, int theme) {
	
 
		Connection conn = getConnection();
		
		ArrayList<Place> pList = new AdminPlanDao().selectPList(conn, area, theme);
		close(conn);
		
		//System.out.println(pList+ "---------------서비스 리스트단 "); // 안찍히는데 뭐지 ? 
		
		return pList;
	}













	


	

}
  