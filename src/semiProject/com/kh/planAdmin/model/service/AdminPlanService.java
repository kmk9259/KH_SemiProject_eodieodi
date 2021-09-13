package semiProject.com.kh.planAdmin.model.service;

import static semiProject.com.kh.common.JDBCTemplate.close;
import static semiProject.com.kh.common.JDBCTemplate.commit;
import static semiProject.com.kh.common.JDBCTemplate.getConnection;
import static semiProject.com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import semiProject.com.kh.course.model.vo.CoursePlace;
import semiProject.com.kh.planAdmin.model.dao.AdminPlanDao;
import semiProject.com.kh.planAdmin.model.vo.AdminPlan;

public class AdminPlanService {

	
	
	//추천 코스, 날짜, 위치 선택하는 (타이틀도 되면..?)  곳 insert 긴 하지..?
//	public int insertAdminPlan(AdminPlan ap, String[] adminPlace) {
//
//		Connection conn= getConnection();
//		
//		int result1 = new AdminPlanDao().insertAdminPlan(conn,ap);
//		int result2 = new AdminPlanDao().insertAdminPlan_Place(conn,adminPlace);
//		
//		if(result1 > 0 & result2 > 0) {
//			commit(conn);
//		}else {
//			rollback(conn);
//		}
//		close(conn);
//		return result1 * result2;
//	}

	
//	public int insertAdminPlan(AdminPlan apList) {
//		
//		Connection conn = getConnection();
//		
//		int result = new AdminPlanDao().insertAdminPlan(conn,apList);
//		
//		System.out.println(result +"값 들어오는지...?");
//		
//		if(result > 0 ) {
//			commit(conn);
//		}else {
//			rollback(conn);
//		}close(conn);
//		
//		
//		return result;
//	}

//	public ArrayList<AdminPlan> selectAdminPlanSaveList(int userNo) {
//		
//		Connection conn = getConnection();
//		
//		
//		return null;
//	}
//


	
	//코스 리스트 가져오기 
	public ArrayList<CoursePlace> CourseList() {

		Connection conn = getConnection();
		ArrayList<CoursePlace> cList = new AdminPlanDao().selectCourseList(conn);
		
		System.out.println("cList 서비스는 잘 돌고 있는가 " + cList);
		
		close(conn);
		
		return cList;
	
	}

	//선택한 리스트 객체랑, 코스(참조번호) 가지고 와서 저장해줘야됨 admin_plan에다가 
	public int insertAdminPlan(AdminPlan apList, ArrayList<CoursePlace> cList) {

		Connection conn = getConnection();
		
		//adminPlan 테이블에 넣기 
		int result1 = new AdminPlanDao().insertAdminPlan(conn, apList, cList);
		//adminPlan_place에 넣기 
		//int result2 = new AdminPlanDao().insertAdminPlanPlace(conn, cList);
		

		if(result1 > 0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}close(conn);
		
		
		return result1;
		
		
		
		
		
//		if(result1>0 && result2>0) {
//			commit(conn);
//
//		} else {
//			rollback(conn);
//
//		}
//		close(conn);
//
//		return result1 * result2;
	}

	public int insertAdminPlan(AdminPlan apList) {
		
		Connection conn = getConnection();
		
		//adminPlan 테이블에 넣기 
		int result = new AdminPlanDao().insertAdminPlan(conn, apList);
		
		if(result > 0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}close(conn);
		
		
		return result;
	}




	

}
  