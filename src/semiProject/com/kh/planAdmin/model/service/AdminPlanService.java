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


	//테마와 코스를 이용해서 셀렉트 해오는거 
	public AdminPlan selectCourse(int area, int theme ) {
	
		
		Connection conn = getConnection();
		
		AdminPlan ap = new AdminPlanDao().selectCourse(conn, area, theme);
		close(conn);
		
		return ap;
	}

	//
	public int insertAdminPlan(AdminPlan courseList) {
		
		Connection conn = getConnection();
		
		int result = new AdminPlanDao().insertAdminPlan(conn, courseList);
		
		if(result > 0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}close(conn);
		
		
		return result;
		
		
	}

	
	//상세페이지에 뿌려주는 것 
	public ArrayList<AdminPlan> totalList() {
	
		Connection conn = getConnection();

		ArrayList<AdminPlan> totalList = new AdminPlanDao().totalList(conn);
		close(conn);
		
		return totalList;
	}

	

	

}
  