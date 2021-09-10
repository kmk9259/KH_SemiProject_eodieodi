package semiProject.com.kh.planAdmin.model.service;

import static semiProject.com.kh.common.JDBCTemplate.*;

import java.sql.Connection;

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

	//받은 리스트를 저장 
	public int checkAdminPlan(AdminPlan apList) {

		Connection conn= getConnection();
		
		int result = new AdminPlanDao().checkAdminPlan(conn, apList);
		
		if(result > 0) {
			commit(conn);
			
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}


	
	

}
  