package semiProject.com.kh.course.model.service;

import static semiProject.com.kh.common.JDBCTemplate.close;
import static semiProject.com.kh.common.JDBCTemplate.commit;
import static semiProject.com.kh.common.JDBCTemplate.getConnection;
import static semiProject.com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import semiProject.com.kh.course.model.dao.CourseDao;
import semiProject.com.kh.course.model.vo.Course;
import semiProject.com.kh.place.model.dao.PlaceDao;
import semiProject.com.kh.place.model.vo.Place;

public class CourseService {
	
	public int insertCourse(Course c, String[] pNo) {
		Connection conn = getConnection();
		int result1 = new CourseDao().insertCourse(conn, c);
		int result2 =0;
		
		for(int i=0; i<pNo.length; i++)
		{
			int placeNum =Integer.parseInt(pNo[i]);
			System.out.println(placeNum+"  placeNum");
			result2 = new CourseDao().insertCoursePlace(conn,placeNum);
			System.out.println("서비스 result2  "+result2);
		}
		if(result1 > 0 && result2>0)
		{
			commit(conn);
		}
		else {
			rollback(conn);
		}
		close(conn);
		return result1 * result2;
	}

	public ArrayList<Course> selectCList(int areaNo) {
		Connection conn = getConnection();
		ArrayList<Course> list = new CourseDao().selectCList(conn, areaNo);
		
		close(conn);
		return list;
	}
	
	public ArrayList<Place> selectCoursePlaceList(int cNo) {
		Connection conn = getConnection();
		ArrayList<Place> list = new CourseDao().selectCoursePlaceList(conn, cNo);
		
		close(conn);
		return list;
	}

	public ArrayList<Course> selectCourseAttachment(int areaNo, int courseNo) {
		Connection conn = getConnection();
		ArrayList<Course> list = new CourseDao().selectCourseAttachment(conn, areaNo, courseNo);
		
		close(conn);
		return list;
	}

	public int delectCourse(int cNo) {
		Connection conn = getConnection();
		int result = new CourseDao().delectCourse(conn, cNo);
		if(result >0 )
		{
			commit(conn);
		}
		else
			rollback(conn);
		close(conn);
		return result;
	}

	
}
