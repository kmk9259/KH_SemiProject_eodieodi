package semiProject.com.kh.planAdmin.model.dao;

import static semiProject.com.kh.common.JDBCTemplate.close;

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
import semiProject.com.kh.planAdmin.model.vo.AdminPlan;
import semiProject.com.kh.planMy.model.dao.PlanMyDao;

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

	 

//	//코스 리스트 가져오는 애 
//	public ArrayList<CoursePlace> selectCourseList(Connection conn) {
//		//관리자가 짜준 코스가 admin_place에 저장되어있고 
//		//참조하는 번호만 가져오면 되는가..?
//		
////		CP_NO 코스지역번호 -> 시퀀스로 순서대로 들어가는 
////		REF_COURSE 참조하는 코스번호 
////		PLACE_NO 일정번호 
////		STATUS 상태값 
//		
////	adminCList=select ref_course, status from course_place; 
//		
//		ArrayList<CoursePlace> cList = new ArrayList<>();
//		PreparedStatement pstmt= null;
//		ResultSet rset = null;
//		
//		String sql = prop.getProperty("adminCList");
//		
//		
//		try {
//			pstmt = conn.prepareStatement(sql);
//			rset=pstmt.executeQuery();
//
//			//참조번호와(코스가 들어가 있는), y/n상태값 담아줌 
//			while(rset.next()) {
//				
//				CoursePlace cp = new CoursePlace();
//				cp.setRefCourse(rset.getInt("REF_COURSE"));
//				cp.setStatus(rset.getString("STATUS"));
//				
//				cList.add(cp);
//	
//			}
//			
//			
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}finally {
//			close(rset);
//			close(pstmt);
//		}
//		
//		return cList;
//	}
//
//
//	//AdminPlan에 값 넣기 
//	public int insertAdminPlan(Connection conn, AdminPlan apList) {
////insertAdminPlan=insert into admin_plan VALUES(SEQ_APNO.NEXTVAL,?,?,?,?,SYSDATE,DEFAULT);
//
//		int result = 0;
//		PreparedStatement pstmt = null;
//
//		String sql = prop.getProperty("insertAdminPlan");
//
//		try {
//			pstmt = conn.prepareStatement(sql);
//
//			pstmt.setInt(1, apList.getPlanNo());
//			pstmt.setInt(2, apList.getUserNo());
//			pstmt.setInt(3, apList.getAreaNo());
//			pstmt.setInt(4, apList.getCourseNo());
//			pstmt.setString(5, apList.getPlanTitle());
//			pstmt.setDate(6, apList.getCreateDate());
//			pstmt.setString(7, apList.getStatus());
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
//		return result;
//	}
//
//	//admin_plan_place에 값 넣기 
//	public int insertAdminPlanPlace(Connection conn, ArrayList<CoursePlace> cList) {
////insertAdminPlan_Place=INSERT INTO adminPlace_Place VALUES(SEQ_APPNO.NEXTVAL,?, ?, DEFAULT);
//		//왜 부모키를 찾을 수 없다고 뜨는것인가... 
//
////		AP_PLACE_NO
////		REF_ACNO
////		PLACE_NO
////		STATUS
//
//		int result = 0;
//		PreparedStatement pstmt = null;
//
//		String sql = prop.getProperty("insertAdminPlanPlace");
//
//		try {
//			pstmt = conn.prepareStatement(sql);
//
//			for (int i = 0; i < cList.size(); i++) {
//
//				pstmt.setInt(1, Integer.parseInt(cList.get(i).toString()));
//
//				result = pstmt.executeUpdate();
//
//			}
//
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//
//		return result;
//	}


	
	//테마와 위치를 이용해 코스 번호를 (랜덤으로) 조회해온다 
	public AdminPlan selectCourse(Connection conn, int area, int theme) {
		
		AdminPlan ap = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		//selectCourse= select course_no from (select * from course order by dbms_random.value) where theme_no=? and area_no=? and rownum < 2;

		//String sql = "select * from (select * from course) where theme_no=? and area_no=? and rownum < 2;";
		String sql = prop.getProperty("selectCourse");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, area);
			pstmt.setInt(2, theme);
			
			rset = pstmt.executeQuery();

			if (rset.next()) {

				ap = new AdminPlan(
						
						rset.getInt("COURSE_NO")
						
				);

			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		System.out.println(area+"---------------다오 에리아 ");
		System.out.println(theme+"---------------다오 테마 ");
		
		System.out.println(ap + "------------다오에서 조회가 잘되냐? ");
		
		return ap;
	}



	//adminPlan에 인서트하는 
	public int insertAdminPlan(Connection conn, AdminPlan courseList) {
//
//		PLAN_NO	NUMBER
//		USER_NO	NUMBER
//		AREA_NO	NUMBER
//		THEME_NO	NUMBER
//		COURSE_NO	NUMBER
//		CHOOSE_DATE	DATE
//		STATUS	VARCHAR2(1 BYTE)
		
//insertAdminPlan=insert into admin_plan VALUES(SEQ_APNO.NEXTVAL,?,?,?,SYSDATE,DEFAULT);
		
		
		int result = 0;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("insertAdminPlan");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(2, courseList.getAreaNo());
			pstmt.setInt(3, courseList.getThemeNo());
			pstmt.setInt(4, courseList.getCourseNo());
			pstmt.setDate(5, courseList.getChooseDate());
	
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		
		return result;
	}



	//상세페이지에 뿌려주는 애 	
	public ArrayList<AdminPlan> totalList(Connection conn) {
		
		
		ArrayList<AdminPlan> apList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		//totalList=select USER_NO, COURSE_NO, CHOOSE_DATE FROM ADMIN_PLAN;
		String sql = prop.getProperty("totalList");

		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				AdminPlan ap = new AdminPlan();
				
				ap.setUserNo(rset.getInt("USER_NO"));
				ap.setCourseNo(rset.getInt("COURSE_NO"));
				ap.setChooseDate(rset.getDate("CHOOSE_DATE"));
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		
		
		return apList;
	}


	//플레이스 
//	public ArrayList<Place> selectPList(Connection conn) {
//	
////SELECT PLACE_NO, place_title, place_phone, DESCRIPTION, BSHOUR, price, address, CHANGE_NAME 
////FROM PLACE JOIN (SELECT * FROM PLACE_ATTACHMENT 
////WHERE FILE_NO IN(SELECT MIN(FILE_NO) FILE_NO FROM PLACE_ATTACHMENT WHERE STATUS='Y' GROUP BY REF_PNO)) ON (REF_PNO = PLACE_NO) 
////WHERE PLACE.STATUS='Y' AND PLACE.AREA_NO=? ORDER BY PLACE_NO DESC;
//
//
//	ArrayList<Place> pList = new ArrayList<>();
//	PreparedStatement pstmt = null;
//	ResultSet rset = null;
//		
//	 //장소 세개를 뽑 
//	String sql = prop.getProperty("selectPList");
//		
//	try {
//		pstmt = conn.prepareStatement(sql);
//		rset = pstmt.executeQuery();
//		
//		while(rset.next()) {
//			
//			Place p = new Place();
//			
//			p.setPlaceNo(rset.getInt("PLACE_NO"));
//			p.setPlaceTitle(rset.getString("PLACE_TITLE"));
//			p.setPlacePhone(rset.getString("PLACE_PHONE"));
//			p.setDescription(rset.getString("DESCRIPTION"));
//			p.setBsHour(rset.getString("BSHOUR"));
//			p.setPrice(rset.getInt("PRICE"));
//			p.setAddress(rset.getString("ADDRESS"));
//			p.setTitleImg(rset.getString("CHANGE_NAME"));
//			//사진을 띄워줄려면..? 플레이스 어테치먼트도 있어야하나ㅏ..?
//			//->어태치먼트를 조인한 쿼리를 가져와야됨 
//
//			pList.add(p);// 추가하기 
//		}
//
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} finally {
//			close(rset);
//			close(pstmt);
//		}
//	System.out.println(pList+"=========pList 찍히나? ");
//
//		return pList;
//	}
//


	public ArrayList<Place> selectPList(Connection conn, int area, int theme) {
	
		//areaThemeCourse=
//select course_no, theme_no, area_no from course a 
//		join course_place cp on a.course_no = cp.ref_course 
//				where theme_no=1 and area_no=1 and rownum < 2;
		
		ArrayList<Place> pList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("areaThemeCourse");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			

			pstmt.setInt(1, area);
			pstmt.setInt(2, theme);
			
			while(rset.next()) {
				
				Place p = new Place();
				
				
				 
//				p.setPlaceNo(rset.getInt("PLACE_NO"));
//				p.setAreaNo(rset.getInt("AREA_NO"));
//				p.setPlaceTitle(rset.getString("PLACE_TITLE"));
//				p.setPlacePhone(rset.getString("PLACE_PHONE"));
//				p.setDescription(rset.getString("DESCRIPTION"));
//				p.setBsHour(rset.getString("BSHOUR"));
//				p.setPrice(rset.getInt("PRICE"));
//				p.setAddress(rset.getString("ADDRESS"));
//				p.setTitleImg(rset.getString("CHANGE_NAME"));
				//사진을 띄워줄려면..? 플레이스 어테치먼트도 있어야하나ㅏ..?
				//->어태치먼트를 조인한 쿼리를 가져와야됨 

				pList.add(p);// 추가하기 
			}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
		System.out.println(pList+"=========pList 다오에서 찍히나? ");

			return pList;
		
		
	}
	
}
