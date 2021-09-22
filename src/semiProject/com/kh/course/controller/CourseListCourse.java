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
		
		//step.1 - course 객체 정보를 list로 받아 json 파싱 후 화면에 뿌리기
		
		JSONObject jsonCourse = null;				//list로 부터 각각의 Course 객체를 JSON객체로 파싱 하기 위해서 JSONObject 선언
		JSONArray cArr = new JSONArray();			//JSONObject를 담기 위해 JSONArray 선언
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
		JSONObject jsonMap = new JSONObject();		//JSONArray를 다시 jsp에 뿌려주기 위해 JSONObject 선언
		jsonMap.put("cArr", cArr);					
		
		//step.2 - aNo와 cNo에 해당하는 코스 객체의 사진 src 뽑아오기
		
		String courseNo = request.getParameter("cNo");		//화면 단에서 selectbox에서 선택되지 않았을 경우 null값이 저장되므로 string으로 먼저 받기
		if(courseNo != null)
		{
			int cNo = Integer.parseInt(courseNo);
			ArrayList<Course> clist = new CourseService().selectCourseAttachment(cNo,aNo);
			JSONObject jsonTitleImg = null;					//clist에 저장된 course객체의 titleImg를 저장하기 위해 jsonobject 선언
			JSONArray tArr = new JSONArray();				//JSONObject를 담기 위해 JSONArray 선언
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
			jsonMap.put("tArr", tArr);					//step.1에서 만들어준 JSONObject에 tArr 추가
		}
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(jsonMap);				//cArr과 tArr이 담긴 JSONObject 전달

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
