package semiProject.com.kh.planMy.model.service;

import static semiProject.com.kh.common.JDBCTemplate.close;
import static semiProject.com.kh.common.JDBCTemplate.commit;
import static semiProject.com.kh.common.JDBCTemplate.getConnection;
import static semiProject.com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Arrays;

import semiProject.com.kh.area.model.vo.Area;
import semiProject.com.kh.board.model.vo.PageInfo;
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
	public ArrayList<PlanMy> selectPlanSaveList(int userNo, PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<PlanMy> list = new PlanMyDao().selectPlanSaveList(conn, userNo, pi);
		
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

	//일정 수정
	public int updatePlanMy(PlanMy pm, int planNo, String[] update) {  //업데이트하려는 장소번호 배열 ex)update : ["7","8"]
		
		Connection conn = getConnection();

		int result1 = new PlanMyDao().updatePlanMy(conn, pm);
		int result2 = 1;  //추가해줘야 하는 장소
		int result3 = 1;  //update해줘야 하는 장소
		
		ArrayList<Place> originPlace = selectPlace_planMy(planNo);  //현재 DB에 저장된 장소들 가져오기
		
		String[] origin = new String[originPlace.size()];	//현재 DB에 저장된 장소번호 담는 배열 ex)origin : ["5","6","7"]
		for(int i=0; i<originPlace.size(); i++) {
			origin[i] = String.valueOf(originPlace.get(i).getPlaceNo());
		}
		
		//현재 DB에 저장된 장소들과 update하려는 장소들이 다른 경우
		if(!Arrays.equals(origin, update)) {			
			ArrayList<String> insertDB = new ArrayList<>();
			ArrayList<String> deleteDB = new ArrayList<>();
			
			for(String u:update) {
				if(!Arrays.asList(origin).contains(u)) {  //update에서 origin 내용 포함하고 있지 않다면
					insertDB.add(u);                      //insertDB : ["8"] -> 새롭게 추가해줘야 한다.
				}
			}
			for(String o:origin) {
				if(!Arrays.asList(update).contains(o)) {  //origin에서 update된 내용 포함하고 있지 않다면
					deleteDB.add(o);                      //deleteDB " ["5","6"] 
				}
			}
			System.out.println(insertDB);
			System.out.println(deleteDB);
			
			//추가해줘야 하는 장소가 있다면(1개 이상이라면)         insertDB : ["8"]
			if(insertDB.size() != 0) {
				result2 = new PlanMyDao().updateAddPlace(conn, planNo, insertDB);
			}
			
			//update로 삭제해줘야 할 장소가 있다면(1개 이상이라면)  deleteDB " ["5","6"] 
			if(deleteDB.size() != 0) {
				result3 = new PlanMyDao().updateDelPlace(conn, planNo, deleteDB);
			}
		}
		
		if(result1 > 0 && result2 > 0 && result3 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result1 * result2 * result3;
	}

	public ArrayList<Place> areaNoPlaceList(int areaNo) {
		Connection conn = getConnection();
		ArrayList<Place> pList = new PlanMyDao().areaNoPlaceList(conn, areaNo);
		
		close(conn);
		return pList;
	}

	public int getListCount(int userNo) {
		Connection conn = getConnection();
		
		int listCount = new PlanMyDao().getListCount(conn, userNo);
		close(conn);
		return listCount;
	}

	public ArrayList<Place> categoryPlaceList(int areaNo, int categoryNo) {
		Connection conn = getConnection();
		ArrayList<Place> pList = new PlanMyDao().categoryPlaceList(conn, areaNo, categoryNo);
		
		close(conn);
		return pList;
	}

	public ArrayList<PlanMy> addPlanList(int userNo, int placeNo) {
		Connection conn = getConnection();
		ArrayList<PlanMy> list = new PlanMyDao().addPlanList(conn, userNo, placeNo);
		
		close(conn);
		return list;
	}

	public int addPlanPlace(int planNo, ArrayList<String> placeNo) {
		Connection conn = getConnection();
		
		int result = new PlanMyDao().updateAddPlace(conn, planNo, placeNo);
		close(conn);
		return result;
	}

}
