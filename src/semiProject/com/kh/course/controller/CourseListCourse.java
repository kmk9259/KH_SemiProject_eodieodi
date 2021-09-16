package semiProject.com.kh.course.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.Gson;

import semiProject.com.kh.course.model.service.CourseService;
import semiProject.com.kh.course.model.vo.Course;

/**
 * Servlet implementation class CourseListCourse
 */
@WebServlet("/cList.co")
public class CourseListCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CourseListCourse() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int aNo = Integer.parseInt(request.getParameter("aNo"));
		ArrayList<Course> list = new CourseService().selectCList(aNo);
		
		JSONObject jsonCourse = null;
		JSONArray cArr = new JSONArray();
		for(Course c : list)
		{
			jsonCourse = new JSONObject();
			jsonCourse.put("courseNo", c.getCourseNo());
			jsonCourse.put("areaNo", c.getAreaNo());
			jsonCourse.put("themeNo", c.getThemeNo());
			jsonCourse.put("courseTitle", c.getCourseTitle());
			jsonCourse.put("status", c.getStatus());
			jsonCourse.put("titleImg", c.getTitleImg());
			cArr.add(jsonCourse);
		}
		JSONObject jsonMap = new JSONObject();
		jsonMap.put("cArr", cArr);
		
		
		//==================1 step=====================
		String courseNo = request.getParameter("cNo");
		if(courseNo != null)
		{
			int cNo = Integer.parseInt(courseNo);
			ArrayList<Course> clist = new CourseService().selectCourseAttachment(cNo,aNo);
			JSONObject jsonTitleImg = null;
			JSONArray tArr = new JSONArray();
			for(Course c : clist)
			{
				jsonTitleImg = new JSONObject();
				jsonTitleImg.put("courseNo", c.getCourseNo());
				jsonTitleImg.put("areaNo", c.getAreaNo());
				jsonTitleImg.put("themeNo", c.getThemeNo());
				jsonTitleImg.put("courseTitle", c.getCourseTitle());
				jsonTitleImg.put("status", c.getStatus());
				jsonTitleImg.put("titleImg", c.getTitleImg());
				tArr.add(jsonTitleImg);
			}
			jsonMap.put("tArr", tArr);
		}
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(jsonMap);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
