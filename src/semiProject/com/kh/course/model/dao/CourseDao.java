package semiProject.com.kh.course.model.dao;

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

import semiProject.com.kh.course.model.vo.Course;
import semiProject.com.kh.place.model.dao.PlaceDao;
import semiProject.com.kh.place.model.vo.Place;

public class CourseDao {
	private Properties prop = new Properties();
	public CourseDao() {
		String fileName = PlaceDao.class.getResource("/semiProject/sql/course/course-query.properties").getPath();
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

	public int insertCourse(Connection conn, Course c) {
		int result =0;
		PreparedStatement pstmt = null;
		//insertCourse=INSERT INTO COURSE VALUES(SEQ_CONO.NEXTVAL,?,?,?,DEFAULT)
		String sql = prop.getProperty("insertCourse");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c.getAreaNo());
			pstmt.setInt(2, c.getThemeNo());
			pstmt.setString(3, c.getCourseTitle());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int insertCoursePlace(Connection conn, String[] pNo) {
		int result =0;
		PreparedStatement pstmt = null;
		
		
		String sql = prop.getProperty("insertCoursePlace");
		try {
			pstmt = conn.prepareStatement(sql);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}

	public int insertCoursePlace(Connection conn, int placeNum) {
		int result =0;
		PreparedStatement pstmt = null;
		//insertCoursePlace=INSERT INTO COURSE_PLACE VALUES(SEQ_CPNO.NEXTVAL,SEQ_CONO.CURRVAL,?,DEFAULT)
		System.out.println("다오의 placeNum : "+placeNum);
		String sql = prop.getProperty("insertCoursePlace");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, placeNum);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<Course> selectCList(Connection conn, int areaNo) {
		ArrayList<Course> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		/*
		 * COURSE_NO AREA_NO THEME_NO COURSE_TITLE STATUS
		 */
		//selectCList=SELECT * FROM COURSE WHERE AREA_NO=?
		String sql = prop.getProperty("selectCList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, areaNo);
			rset = pstmt.executeQuery();
			while(rset.next())
			{
				Course c = new Course();
				c.setCourseNo(rset.getInt("COURSE_NO"));
				c.setAreaNo(rset.getInt("AREA_NO"));
				c.setThemeNo(rset.getInt("THEME_NO"));
				c.setCourseTitle(rset.getString("COURSE_TITLE"));
				c.setStatus(rset.getString("STATUS"));
				list.add(c);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<Place> selectCoursePlaceList(Connection conn, int cNo) {
		ArrayList<Place> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		/*
		 * selectCoursePlaceList=SELECT A.PLACE_NO,PLACE_TITLE, PLACE_PHONE,
		 * DESCRIPTION, BSHOUR, PRICE, ADDRESS \ FROM COURSE_PLACE A JOIN PLACE B ON
		 * (A.PLACE_NO = B.PLACE_NO) WHERE REF_COURSE=?
		 */
		String sql = prop.getProperty("selectCoursePlaceList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cNo);
			rset = pstmt.executeQuery();
			while(rset.next())
			{
				Place p = new Place();
				p.setPlaceNo(rset.getInt("PLACE_NO"));
				p.setPlaceTitle(rset.getString("PLACE_TITLE"));
				p.setPlacePhone(rset.getString("PLACE_PHONE"));
				p.setDescription(rset.getString("DESCRIPTION"));
				p.setBsHour(rset.getString("BSHOUR"));
				p.setPrice(rset.getInt("PRICE"));
				p.setAddress(rset.getString("ADDRESS"));
				list.add(p);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

}
