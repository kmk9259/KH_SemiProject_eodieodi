package semiProject.com.kh.planMy.model.service;

import static semiProject.com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import semiProject.com.kh.place.model.vo.Place;
import semiProject.com.kh.planMy.model.dao.PlanMyDao;
import semiProject.com.kh.planMy.model.vo.PlanMy;

public class PlanMyService {

	public ArrayList<Place> selectList() {
		Connection conn = getConnection();
		ArrayList<Place> list = new PlanMyDao().selectList(conn);
		
		close(conn);
		return list;
	}

	public int insertPlanMy(PlanMy pm, String[] planPlaces) {
		Connection conn = getConnection();

		int result1 = new PlanMyDao().insertPlanMy(conn, pm);
		int result2 = new PlanMyDao().insertPlanMy_Place(conn, planPlaces);
		
		if(result1 > 0 & result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result1 * result2;
	}

	public ArrayList<PlanMy> selectPlanSaveList(int userNo) {
		Connection conn = getConnection();
		ArrayList<PlanMy> list = new PlanMyDao().selectPlanSaveList(conn, userNo);
		
		close(conn);
		return list;
	}

}
