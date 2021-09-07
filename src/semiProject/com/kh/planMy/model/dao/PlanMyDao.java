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
		
		System.out.println("list11 : "+list);
		
		String sql = prop.getProperty("selectPlaceList");
		//하나의 BOARD에 사진 여러 개 등록했을 경우로 짠 쿼리인데 될 것 같아서 그대로 넣음
//		selectPlaceList=SELECT PLACE_NO, AREA_NO, CATEGORY_NO, PLACE_TITLE, ADDRESS, DESCRIPTION, COUNT, CHANGE_NAME \
//		FROM PLACE JOIN (SELECT * FROM PLACE_ATTACHMENT \
//		WHERE FILE_NO IN( \
//		SELECT MIN(FILE_NO) FILE_NO FROM PLACE_ATTACHMENT WHERE STATUS='Y' GROUP BY REF_PNO)) ON (REF_PNO = PLACE_NO) \
//		WHERE PLACE.STATUS='Y' ORDER BY PLACE_NO DESC
		
		System.out.println("list22 : "+list);
		
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
		
//		PLAN_NO
//		USER_NO
//		AREA_NO
//		PLAN_TITLE
//		PLAN_DATE

//		MEMO
//		CREATE_DATE
//		STATUS
		String sql = prop.getProperty("insertPlanMy");
		//insertPlanMy = INSERT INTO MYPLAN VALUES(SEQ_MPNO.NEXTVAL, ?, ?, ?, ?, ?, SYSDATE, DEFAULT)
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pm.getUserNo());
			pstmt.setInt(2, pm.getAreaNo());
			pstmt.setString(3, pm.getPlanTitle());
			pstmt.setDate(4, pm.getPlanDate());
//			pstmt.setString(5, pm.getplanPlace());
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
//		WHERE P.STATUS='Y' AND T2.RNUMM=1 AND USER_NO=3;
		
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

	
}
