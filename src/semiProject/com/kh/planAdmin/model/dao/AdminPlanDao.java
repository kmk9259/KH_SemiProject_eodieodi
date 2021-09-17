package semiProject.com.kh.planAdmin.model.dao;

import static semiProject.com.kh.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import semiProject.com.kh.course.model.vo.Course;
import semiProject.com.kh.place.model.vo.Place;
import semiProject.com.kh.planAdmin.model.vo.AdminPlan;
import semiProject.com.kh.planMy.model.dao.PlanMyDao;
import semiProject.com.kh.theme.model.vo.Theme;

public class AdminPlanDao {
	
	private Properties prop = new Properties();


 public AdminPlanDao() {
		String fileName = PlanMyDao.class.getResource("/semiProject/sql/adminPlan/adminPlan-query.properties").getPath();
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

	
	//adminPlan에 인서트하는 
//	public int insertAdminPlan(Connection conn, AdminPlan courseList) {
//
//		PLAN_NO	NUMBER
//		USER_NO	NUMBER
//		AREA_NO	NUMBER
//		THEME_NO	NUMBER
//		COURSE_NO	NUMBER
//		CHOOSE_DATE	DATE
//		STATUS	VARCHAR2(1 BYTE)
		
//insertAdminPlan=insert into admin_plan VALUES(SEQ_APNO.NEXTVAL,?,?,?,SYSDATE,DEFAULT);
		
//		
//		int result = 0;
//		PreparedStatement pstmt = null;
//
//		String sql = prop.getProperty("insertAdminPlan");
//		
//		try {
//			pstmt = conn.prepareStatement(sql);
//			
//			pstmt.setInt(2, courseList.getAreaNo());
//			pstmt.setInt(3, courseList.getThemeNo());
//			pstmt.setInt(4, courseList.getCourseNo());
//			pstmt.setDate(5, courseList.getChooseDate());
//	
//			result = pstmt.executeUpdate();
//			
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}finally {
//			close(pstmt);
//		}
//		
//		
//		
//		return result;
//	}



	//상세페이지에 뿌려주는 애 	
//	public ArrayList<AdminPlan> totalList(Connection conn) {
//		
//		
//		ArrayList<AdminPlan> apList = new ArrayList<>();
//		PreparedStatement pstmt = null;
//		ResultSet rset = null;
//		
//		//totalList=select USER_NO, COURSE_NO, CHOOSE_DATE FROM ADMIN_PLAN;
//		String sql = prop.getProperty("totalList");
//
//		
//		try {
//			pstmt = conn.prepareStatement(sql);
//			rset = pstmt.executeQuery();
//			
//			while(rset.next()) {
//				
//				AdminPlan ap = new AdminPlan();
//				
//				ap.setUserNo(rset.getInt("USER_NO"));
//				ap.setCourseNo(rset.getInt("COURSE_NO"));
//				ap.setChooseDate(rset.getDate("CHOOSE_DATE"));
//			}
//			
//			
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	
//		
//		return apList;
//	}

	public ArrayList<Place> selectPList(Connection conn, int area, int theme) {

	
//		SELECT REF_COURSE,PLACE_NO, PLACE_TITLE, DESCRIPTION, CHANGE_NAME
//		FROM PLACE
//		JOIN PLACE_ATTACHMENT ON(PLACE_NO=REF_PNO)
//		JOIN (SELECT REF_COURSE,PLACE_NO
//		        FROM COURSE_PLACE
//		        WHERE REF_COURSE = (SELECT COURSE_NO
//		                            FROM (SELECT * FROM COURSE ORDER BY DBMS_RANDOM.VALUE)
//		                            WHERE AREA_NO=? AND THEME_NO=? AND ROWNUM<2))
//		USING(PLACE_NO);
		
		
		ArrayList<Place> pList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("areaThemeCourse");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, area);
			pstmt.setInt(2, theme);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				
				Place p = new Place();
				
				p.setCourseNo(rset.getInt("REF_COURSE")); // 없어서 추가함 
				p.setPlaceNo(rset.getInt("PLACE_NO"));
				p.setPlaceTitle(rset.getString("PLACE_TITLE"));
				p.setDescription(rset.getString("DESCRIPTION"));
				p.setTitleImg(rset.getString("CHANGE_NAME"));
			

				pList.add(p);// 추가하기 
				
				
			}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
		
	
		System.out.println("--------테마번호----"+ theme);
		System.out.println("------위치번호 ------"+ area);

		System.out.println(pList+"=========pList 다오에서 찍히나? ");

	return pList;
		
		
	}


	
}
