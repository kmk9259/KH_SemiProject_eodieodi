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



	public ArrayList<Place> selectPList(Connection conn, int area, int theme) {
	
//		SELECT REF_COURSE,PLACE_NO, PLACE_TITLE, DESCRIPTION, CHANGE_NAME
//		FROM PLACE
//		JOIN PLACE_ATTACHMENT ON(PLACE_NO=REF_PNO)
//		JOIN (SELECT REF_COURSE,PLACE_NO
//		        FROM COURSE_PLACE
//		        WHERE REF_COURSE = (SELECT COURSE_NO
//		                            FROM (SELECT * FROM COURSE ORDER BY DBMS_RANDOM.VALUE)
//		                            WHERE STATUS='Y' AND AREA_NO=? AND THEME_NO=? AND ROWNUM<2))
//		USING(PLACE_NO);
		
		//삭제된 애들은 가져오면 안되니까 status 조건을 걸어줌  
		
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
				
				p.setCourseNo(rset.getInt("REF_COURSE")); // 코스 참조번호 
				p.setPlaceNo(rset.getInt("PLACE_NO")); // 1번 홍대 2번 강남 을 선택했을떄 글씨 띄워주는것도 해야됨 
				p.setPlaceTitle(rset.getString("PLACE_TITLE"));
				p.setDescription(rset.getString("DESCRIPTION"));
				p.setTitleImg(rset.getString("CHANGE_NAME"));
				p.setBsHour(rset.getString("BSHOUR"));
				p.setPrice(rset.getInt("PRICE"));
				p.setAddress(rset.getString("ADDRESS"));
				p.setPlaceTitle(rset.getString("PLACE_TITLE"));
				p.setPlacePhone(rset.getString("PLACE_PHONE"));
				p.setAreaNo(rset.getInt("AREA_NO"));

				pList.add(p);// 추가하기 
				
				
			}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}

	return pList;
		
		
	}


	
}
