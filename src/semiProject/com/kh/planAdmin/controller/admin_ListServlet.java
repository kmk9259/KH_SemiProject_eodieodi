package semiProject.com.kh.planAdmin.controller;

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
import semiProject.com.kh.theme.model.vo.Theme;
import semiProject.com.kh.theme.service.ThemeService;

/**
 * Servlet implementation class admin_ListServlet
 */
@WebServlet("/admin_List.pl")
public class admin_ListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public admin_ListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
 
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		ArrayList<Theme> tList = new ThemeService().selectThemeList(); // 테마 리스트 1,2,3 
		ArrayList<Area> aList = new AreaService().selectAreaList(); //위치 리스트 

		request.setAttribute("tList", tList);
		request.setAttribute("aList", aList);
		  
//		System.out.println(aList+"------------aList");
		
		request.getRequestDispatcher("views/plan/adminRecommend.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
