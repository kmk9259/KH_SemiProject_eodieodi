package semiProject.com.kh.planMy.model.service;

import static semiProject.com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import semiProject.com.kh.place.model.vo.Place;
import semiProject.com.kh.planMy.model.dao.PlanMyDao;
import semiProject.com.kh.planMy.model.vo.PlanMy;

public class PlanMyService {

	//place리스트 얻기_list.pm에서 전체 장소들 목록보여줄 때 사용
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

	//일정보관함에서 유저별 저장된 일정 모두 조회
	public ArrayList<PlanMy> selectPlanSaveList(int userNo) {
		Connection conn = getConnection();
		ArrayList<PlanMy> list = new PlanMyDao().selectPlanSaveList(conn, userNo);
		
		close(conn);
		return list;
	}

	public int deletePlanMy(String[] planNo) {
		Connection conn = getConnection();
		
		int result1 = new PlanMyDao().deletePlanMy(conn, planNo);		//MYPLAN테이블
		int result2 = new PlanMyDao().deletePlanMy_Place(conn, planNo); //MYPLAN_PLACE테이블
		
		if(result1 > 0 & result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result1 * result2;
	}

	//일정보관함 -> 일정상세보기
	public PlanMy selectPlanMy(int planNo) {
		Connection conn = getConnection();
		PlanMy pm = new PlanMyDao().selectPlanMy(conn, planNo);
		
		close(conn);
		return pm;
	}

	//일정보관함 -> 일정상세보기
	public ArrayList<Place> selectPlace_planMy(int planNo) {
		Connection conn = getConnection();
		ArrayList<Place> pList = new PlanMyDao().selectPlace_planMy(conn,planNo);
		
		close(conn);
		return pList;
	}

}
