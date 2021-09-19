package semiProject.com.kh.course.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semiProject.com.kh.area.model.service.AreaService;
import semiProject.com.kh.area.model.vo.Area;
import semiProject.com.kh.course.model.service.CourseService;
import semiProject.com.kh.course.model.vo.Course;
import semiProject.com.kh.course.model.vo.CoursePlace;
import semiProject.com.kh.theme.model.vo.Theme;
import semiProject.com.kh.theme.service.ThemeService;

/**
 * Servlet implementation class CourseUpdateFormServlet
 */
@WebServlet("/updateForm.co")
public class CourseUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CourseUpdateFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Theme> tlist = new ThemeService().selectThemeList();	
		ArrayList<Area> alist = new AreaService().selectAreaList();
		request.setAttribute("tlist", tlist);
		request.setAttribute("alist", alist);
		
		int cNo = Integer.parseInt(request.getParameter("cNo"));
		Course c = new CourseService().selectUpdateCourse(cNo);
		ArrayList<CoursePlace> cpno = new CourseService().selectCPno(cNo);
		int cpnoSize = cpno.size();
		
		
		if(c!= null)
		{
			request.setAttribute("c", c);
			request.setAttribute("cpnoSize", cpnoSize);
			request.getRequestDispatcher("views/course/courseUpdateForm.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
