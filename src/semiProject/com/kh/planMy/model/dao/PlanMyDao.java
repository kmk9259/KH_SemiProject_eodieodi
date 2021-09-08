package semiProject.com.kh.planMy.model.dao;

import static semiProject.com.kh.common.JDBCTemplate.*;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import semiProject.com.kh.place.model.vo.Place;
import semiProject.com.kh.planMy.model.vo.PlanMy;

public class PlanMyDao {
	
	private Properties prop = new Properties();

	public PlanMyDao() {
		String fileName = PlanMyDao.class.getResource("/semiProject/sql/planMy/plan-query.properties").getPath();
		System.out.println("fileName   " + fileName);
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public ArrayList<Place> selectList(Connection conn) {
		ArrayList<Place> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPlaceList");
		//하나의 BOARD에 사진 여러 개 등록했을 경우로 짠 쿼리인데 될 것 같아서 그대로 넣음
//		selectPlaceList=SELECT PLACE_NO, AREA_NO, CATEGORY_NO, PLACE_TITLE, ADDRESS, DESCRIPTION, COUNT, CHANGE_NAME \
//		FROM PLACE JOIN (SELECT * FROM PLACE_ATTACHMENT \
//		WHERE FILE_NO IN( \
//		SELECT MIN(FILE_NO) FILE_NO FROM PLACE_ATTACHMENT WHERE STATUS='Y' GROUP BY REF_PNO)) ON (REF_PNO = PLACE_NO) \
//		WHERE PLACE.STATUS='Y' ORDER BY PLACE_NO DESC
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next())
			{
				Place place = new Place();
				place.setPlaceNo(rset.getInt("PLACE_NO"));
				place.setAreaNo(rset.getInt("AREA_NO"));
				place.setCategoryNo(rset.getInt("CATEGORY_NO"));
				place.setPlaceTitle(rset.getString("PLACE_TITLE"));
				place.setAddress(rset.getString("ADDRESS"));
				place.setDescription(rset.getString("DESCRIPTION"));
				place.setCount(rset.getInt("COUNT"));
				place.setTitleImg(rset.getString("CHANGE_NAME"));
				
				list.add(place);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		System.out.println("list33 : "+list);
		return list;
	}

	public int insertPlanMy(Connection conn, PlanMy pm) {
		int result =0;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("insertPlanMy");
		//insertPlanMy = INSERT INTO MYPLAN VALUES(SEQ_MPNO.NEXTVAL, ?, ?, ?, ?, ?, SYSDATE, DEFAULT)
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pm.getUserNo());
			pstmt.setInt(2, pm.getAreaNo());
			pstmt.setString(3, pm.getPlanTitle());
			pstmt.setDate(4, pm.getPlanDate());
			pstmt.setString(5, pm.getPlanMemo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int insertPlanMy_Place(Connection conn, String[] planPlaces) {
		
		int result = 0;
		PreparedStatement pstmt = null;

	    String sql = prop.getProperty("insertPlanMy_Place");
	    //insertPlanMy_Place=INSERT INTO MYPLAN_PLACE VALUES(SEQ_MPPNO.NEXTVAL, SEQ_MPNO.CURRVAL, ?, DEFAULT)
	    
	    try {
			for(int i=0; i<planPlaces.length; i++) {
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, Integer.parseInt(planPlaces[i]));
				
				System.out.println("planPlaces[i] : " + planPlaces[i]);
				
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
	    
		return result;
	}

	//유저에 맞는 일정보관함 불러오기
	public ArrayList<PlanMy> selectPlanSaveList(Connection conn, int userNo) {
		ArrayList<PlanMy> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPlanSaveList");
//		selectPlanSaveList=
//		SELECT PLAN_NO, PLAN_TITLE, T2.CHANGE_NAME
//		FROM MYPLAN P
//		JOIN (SELECT REF_MPNO, PLACE_NO, CHANGE_NAME, 
//		       ROW_NUMBER() OVER (PARTITION BY REF_MPNO ORDER BY PLACE_NO DESC) AS RNUMM
//		       FROM MYPLAN_PLACE
//		       JOIN PLACE_ATTACHMENT
//		       ON (PLACE_NO = REF_PNO)
//		       WHERE PLACE_ATTACHMENT.STATUS='Y') T2
//		ON (T2.REF_MPNO = PLAN_NO)
//		WHERE P.STATUS='Y' AND T2.RNUMM=1 AND USER_NO=?;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				PlanMy planMy = new PlanMy(rset.getInt("PLAN_NO"),rset.getString("PLAN_TITLE"),rset.getString("CHANGE_NAME"));
				
				list.add(planMy);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		System.out.println("planSaveList보기 : " + list);
		
		return list;
	}

	public int deletePlanMy(Connection conn, String[] planNo) {
		int result = 0;
		PreparedStatement pstmt = null;

	    String sql = prop.getProperty("deletePlanMy");
	    //deletePlanMy=UPDATE MYPLAN SET STATUS='N' WHERE PLAN_NO=?
	    
	    try {
			for(int i=0; i<planNo.length; i++) {
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, Integer.parseInt(planNo[i]));
				
				System.out.println("일정 삭제하기------planNO[i] : " + planNo[i]);
				
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
	    
		return result;
	}

	public int deletePlanMy_Place(Connection conn, String[] planNo) {
		int result = 0;
		PreparedStatement pstmt = null;

	    String sql = prop.getProperty("deletePlanMy_Place");
	    //deletePlanMy_Place=UPDATE MYPLAN_PLACE SET STATUS='N' WHERE REF_MPNO=?
	    
	    try {
			for(int i=0; i<planNo.length; i++) {
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, Integer.parseInt(planNo[i]));
				
				System.out.println("일정 삭제하기------planNO[i] : " + planNo[i]);
				
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public PlanMy selectPlanMy(Connection conn, int planNo) {
		PlanMy pm = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPlanMy");
		//selectPlanMy=SELECT PLAN_NO, PLAN_TITLE, PLAN_DATE, MEMO, AREA_NO FROM MYPLAN WHERE PLAN_NO=?
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, planNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				pm = new PlanMy(rset.getInt("PLAN_NO"),rset.getString("PLAN_TITLE"),rset.getDate("PLAN_DATE"),rset.getString("MEMO"));
				pm.setAreaNo(rset.getInt("AREA_NO"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return pm;
	}

	public ArrayList<Place> selectPlace_planMy(Connection conn, int planNo) {
		ArrayList<Place> plist = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPlace_planMy");
//		selectPlace_planMy=
//		SELECT PLACE_NO, PLACE_TITLE, ADDRESS, PRICE 
//		FROM PLACE
//		WHERE PLACE_NO IN (SELECT PLACE_NO 
//		                  FROM MYPLAN_PLACE
//		                  WHERE REF_MPNO=?);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, planNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Place p = new Place();
				p.setPlaceNo(rset.getInt("PLACE_NO"));
				p.setPlaceTitle(rset.getString("PLACE_TITLE"));
				p.setAddress(rset.getString("ADDRESS"));
				p.setPrice(rset.getInt("PRICE"));
				
				plist.add(p);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return plist;
	}

	
}
