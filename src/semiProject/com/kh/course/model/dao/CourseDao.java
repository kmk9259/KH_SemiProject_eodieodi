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
		//selectCList=SELECT * FROM COURSE WHERE AREA_NO=? AND STATUS='Y'
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
		 * SELECT PLACE_NO,AREA_NO,CATEGORY_NO,
		 * PLACE_TITLE,PLACE_PHONE,DESCRIPTION,BSHOUR,PRICE, ADDRESS,COUNT,PLACE.STATUS,
		 * CHANGE_NAME 
		 * 
		 * FROM PLACE JOIN COURSE_PLACE USING (PLACE_NO) JOIN (SELECT * FROM
		 * PLACE_ATTACHMENT WHERE FILE_NO IN ( SELECT MIN(FILE_NO) FILE_NO FROM
		 * PLACE_ATTACHMENT WHERE STATUS='Y' GROUP BY REF_PNO)) ON (REF_PNO = PLACE_NO)
		 * 
		 * WHERE PLACE.STATUS='Y' AND REF_COURSE=? ORDER BY PLACE_NO
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
				p.setAreaNo(rset.getInt("AREA_NO"));
				p.setCategoryNo(rset.getInt("CATEGORY_NO"));
				p.setPlaceTitle(rset.getString("PLACE_TITLE"));
				p.setPlacePhone(rset.getString("PLACE_PHONE"));
				p.setDescription(rset.getString("DESCRIPTION"));
				p.setBsHour(rset.getString("BSHOUR"));
				p.setPrice(rset.getInt("PRICE"));
				p.setAddress(rset.getString("ADDRESS"));
				p.setCount(rset.getInt("COUNT"));
				p.setStatus(rset.getString("STATUS"));
				p.setTitleImg(rset.getString("CHANGE_NAME"));
				list.add(p);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		System.out.println(list);
		return list;
	}

	public ArrayList<Course> selectCourseAttachment(Connection conn, int cNo, int aNo) {
		ArrayList<Course> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		/*
		 * selectCourseAttachment=SELECT ROWNUM,B.*, CHANGE_NAME 
		 * \ FROM COURSE_PLACE A  JOIN COURSE B ON B.COURSE_NO = A.REF_COURSE 
		 * \ JOIN (SELECT * FROM  PLACE_ATTACHMENT WHERE FILE_NO IN \ ( SELECT MIN(FILE_NO) FILE_NO FROM
		 * PLACE_ATTACHMENT WHERE STATUS='Y' GROUP BY REF_PNO)) \ ON (REF_PNO =
		 * A.PLACE_NO) \ WHERE B.STATUS='Y' AND AREA_NO=? AND COURSE_NO=? AND ROWNUM=1
		 */
		String sql = prop.getProperty("selectCourseAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, aNo);
			pstmt.setInt(2, cNo);
			rset = pstmt.executeQuery();
			while(rset.next())
			{
				Course c = new Course();
				c.setCourseNo(rset.getInt("COURSE_NO"));
				c.setAreaNo(rset.getInt("AREA_NO"));
				c.setThemeNo(rset.getInt("THEME_NO"));
				c.setCourseTitle(rset.getString("COURSE_TITLE"));
				c.setStatus(rset.getString("STATUS"));
				c.setTitleImg(rset.getString("CHANGE_NAME"));
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

	public int delectCourse(Connection conn, int cNo) {
		int result =0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("delectCourse");
		
		//delectCourse=UPDATE COURSE SET STATUS='N' WHERE COURSE_NO=?
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cNo);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}		
		return result;
	}

	public Course selectCourse(Connection conn, int cNo) {
		Course c = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		//selectCourse = SELECT * FROM COURSE WHERE COURSE_NO=? AND STATUS='Y'
		String sql = prop.getProperty("selectCourse");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				c= new Course();
				c.setCourseNo(rset.getInt("COURSE_NO"));
				c.setAreaNo(rset.getInt("AREA_NO"));
				c.setThemeNo(rset.getInt("THEME_NO"));
				c.setCourseTitle(rset.getString("COURSE_TITLE"));
				c.setStatus(rset.getString("STATUS"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
	
		return c;
	}
	public int updateCourse(Connection conn, Course c) {
		int result =0;
		PreparedStatement pstmt = null;
		//updateCourse=UPDATE COURSE SET THEME_NO=? ,COURSE_TITLE=? WHERE COURSE_NO=?
		String sql = prop.getProperty("updateCourse");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c.getThemeNo());
			pstmt.setString(2, c.getCourseTitle());
			pstmt.setInt(3, c.getCourseNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int updateCoursePlace(Connection conn, Course c, int placeNum) {
		int result =0;
		PreparedStatement pstmt = null;
		//updateCoursePlace=UPDATE COURSE_PLACE SET PLACE_NO=?  WHERE REF_COURSE=?
		String sql = prop.getProperty("updateCoursePlace");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, placeNum);
			pstmt.setInt(2, c.getCourseNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}


	
	

}
