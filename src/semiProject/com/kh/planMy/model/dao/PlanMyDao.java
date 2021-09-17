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

import semiProject.com.kh.area.model.vo.Area;
import semiProject.com.kh.board.model.vo.PageInfo;
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
	public ArrayList<PlanMy> selectPlanSaveList(Connection conn, int userNo, PageInfo pi) {
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
		
//		SELECT *
//		FROM (SELECT ROWNUM RNUM,
//		      A.* FROM (SELECT PLAN_NO, PLAN_TITLE, PLAN_DATE, T2.CHANGE_NAME 
//		                FROM MYPLAN P JOIN (SELECT REF_MPNO, PLACE_NO, CHANGE_NAME, ROW_NUMBER() OVER (PARTITION BY REF_MPNO ORDER BY PLACE_NO DESC) AS RNUMM 
//		                                    FROM MYPLAN_PLACE JOIN PLACE_ATTACHMENT ON (PLACE_NO = REF_PNO) WHERE PLACE_ATTACHMENT.STATUS='Y' AND MYPLAN_PLACE.STATUS='Y') T2 ON (T2.REF_MPNO = PLAN_NO) 
//		                                    WHERE P.STATUS='Y' AND T2.RNUMM=1 AND USER_NO=? ORDER BY PLAN_NO DESC) A)
//		WHERE RNUM BETWEEN ? AND ?
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				PlanMy planMy = new PlanMy(rset.getInt("PLAN_NO"),rset.getString("PLAN_TITLE"),rset.getString("CHANGE_NAME"));
				planMy.setPlanDate(rset.getDate("PLAN_DATE"));
				
				list.add(planMy);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		System.out.println("planMyDao_selectPlanSaveList_____list : " + list);
		return list;
	}

	//여러 일정 삭제하기 or 일정 한개 삭제하기__MYPLAN테이블에서 삭제하기
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

	//여러 일정 삭제하기 or 일정 한개 삭제하기__MYPLAN_PLACE테이블에서 삭제하기
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
//		                  WHERE REF_MPNO=? AND MYPLAN_PLACE.STATUS='Y');
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

	//일정 업데이트 -> MYPLAN테이블
	public int updatePlanMy(Connection conn, PlanMy pm) {
		int result = 0;
		PreparedStatement pstmt = null;

	    String sql = prop.getProperty("updatePlanMy");
	    //updatePlanMy=UPDATE MYPLAN SET AREA_NO=?, PLAN_TITLE=?, PLAN_DATE=?, MEMO=? WHERE PLAN_NO=?
	    
	    try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pm.getAreaNo());
			pstmt.setString(2, pm.getPlanTitle());
			pstmt.setDate(3, pm.getPlanDate());
			pstmt.setString(4, pm.getPlanMemo());
			pstmt.setInt(5, pm.getPlanNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	//추가해줘야 하는 장소가 있다면(1개 이상이라면) 
	public int updateAddPlace(Connection conn, int planNo, ArrayList<String> insertDB) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateInsPlace");
		//updateInsPlace=INSERT INTO MYPLAN_PLACE VALUES(SEQ_MPPNO.NEXTVAL, ?, ?, DEFAULT)
		
		try {
			for(int i=0; i<insertDB.size(); i++) {
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, planNo);
				pstmt.setInt(2, Integer.parseInt(insertDB.get(i)));
				
				System.out.println("일정 수정_추가하기------insertDB.get(i) : " + insertDB.get(i));
				
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

	//update로 삭제해줘야 할 장소가 있다면(1개 이상이라면)
	public int updateDelPlace(Connection conn, int planNo, ArrayList<String> deleteDB) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateDelPlace");
		//updateDelPlace=UPDATE MYPLAN_PLACE SET STATUS='N' WHERE REF_MPNO=? AND PLACE_NO=? 
		
		try {
			for(int i=0; i<deleteDB.size(); i++) {
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, planNo);
				pstmt.setInt(2, Integer.parseInt(deleteDB.get(i)));
				
				System.out.println("일정 수정_삭제하기------deleteDB.get(i) : " + deleteDB.get(i));
				
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

	public ArrayList<Place> areaNoPlaceList(Connection conn, int areaNo) {
		ArrayList<Place> pList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("areaNoPlaceList");
//		selectPlaceList=SELECT PLACE_NO, AREA_NO, CATEGORY_NO, PLACE_TITLE, ADDRESS, DESCRIPTION, COUNT, CHANGE_NAME \
//		FROM PLACE JOIN (SELECT * FROM PLACE_ATTACHMENT \
//		WHERE FILE_NO IN( \
//		SELECT MIN(FILE_NO) FILE_NO FROM PLACE_ATTACHMENT WHERE STATUS='Y' GROUP BY REF_PNO)) ON (REF_PNO = PLACE_NO) \
//		WHERE PLACE.STATUS='Y' AND PLACE.AREA_NO=? ORDER BY PLACE_NO DESC 
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, areaNo);
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
				
				pList.add(place);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		System.out.println("list33 : "+pList);
		return pList;
	}

	public int getListCount(Connection conn, int userNo) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getListCount");
		//getListCount=SELECT COUNT(*) FROM MYPLAN WHERE STATUS='Y' AND USER_NO = ?
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT(*)");
				
				System.out.println("listCount 확인! : " + listCount);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}

	public ArrayList<Place> categoryPlaceList(Connection conn, int areaNo, int categoryNo) {
		ArrayList<Place> pList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("categoryPlaceList");
//		categoryPlaceList=SELECT PLACE_NO, AREA_NO, PLACE.CATEGORY_NO, PLACE_TITLE, ADDRESS, DESCRIPTION, COUNT, CHANGE_NAME 
//		FROM PLACE JOIN (SELECT * FROM PLACE_ATTACHMENT 
//		                 WHERE FILE_NO IN(SELECT MIN(FILE_NO) FILE_NO FROM PLACE_ATTACHMENT WHERE STATUS='Y' GROUP BY REF_PNO)) ON (REF_PNO = PLACE_NO)
//		JOIN CATEGORY ON (PLACE.CATEGORY_NO=CATEGORY.CATEGORY_NO)
//		WHERE PLACE.STATUS='Y' AND PLACE.AREA_NO=1 AND PLACE.CATEGORY_NO=1
//		ORDER BY PLACE_NO DESC 
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, areaNo);
			pstmt.setInt(2, categoryNo);
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
				
				pList.add(place);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		System.out.println("list33 : "+pList);
		return pList;
	}

	public ArrayList<PlanMy> addPlanList(Connection conn, int userNo, int placeNo) {
		ArrayList<PlanMy> list = new ArrayList<PlanMy>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("addPlanList");
//		addPlanList=SELECT PLAN_NO, PLAN_TITLE, PLAN_DATE
//		FROM MYPLAN
//		JOIN(SELECT DISTINCT REF_MPNO 
//		     FROM MYPLAN_PLACE A
//		     WHERE A.REF_MPNO NOT IN(SELECT B.REF_MPNO FROM MYPLAN_PLACE B 
//		                             WHERE B.PLACE_NO IN(?) AND B.STATUS='Y')
//		     AND A.STATUS='Y')
//		ON (REF_MPNO=PLAN_NO)
//		WHERE USER_NO=?
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, placeNo);
			pstmt.setInt(2, userNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				PlanMy pm = new PlanMy();
				pm.setPlanNo(rset.getInt("PLAN_NO"));
				pm.setPlanTitle(rset.getString("PLAN_TITLE"));
				pm.setPlanDate(rset.getDate("PLAN_DATE"));
				
				list.add(pm);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		System.out.println("addPlanList(dao) : list : " + list);
		return list;
	}

	//내맘대로 일정 detail -> 장소 목록 페이징 처리
	public ArrayList<Place> selectPlace_planMy(Connection conn, int planNo, PageInfo pi) {
		ArrayList<Place> plist = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPlace_planMy_paging");
//		selectPlace_planMy=
//		SELECT PLACE_NO, PLACE_TITLE, ADDRESS, PRICE 
//		FROM PLACE
//		WHERE PLACE_NO IN (SELECT PLACE_NO 
//		                  FROM MYPLAN_PLACE
//		                  WHERE REF_MPNO=? AND MYPLAN_PLACE.STATUS='Y')
//		AND PLACE.STATUS='Y' AND ROWNUM BETWEEN ? AND ?
		
		int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
		int endRow = startRow + pi.getBoardLimit() -1;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, planNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
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
		
		System.out.println("dao_테이블페이징처리 테스트 : " + plist);
		return plist;
	}
	
}
