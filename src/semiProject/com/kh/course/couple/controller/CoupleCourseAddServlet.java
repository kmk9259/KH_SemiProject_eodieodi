package semiProject.com.kh.course.couple.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semiProject.com.kh.area.model.service.AreaService;
import semiProject.com.kh.area.model.vo.Area;
import semiProject.com.kh.category.model.service.CategoryService;
import semiProject.com.kh.category.model.vo.Category;
import semiProject.com.kh.place.model.service.PlaceService;
import semiProject.com.kh.place.model.vo.Place;
import semiProject.com.kh.theme.model.vo.Theme;
import semiProject.com.kh.theme.service.ThemeService;

/**
 * Servlet implementation class CoupleCourseAddServlet
 */
@WebServlet("/ccAdd.co")
public class CoupleCourseAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CoupleCourseAddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Place> plist = new PlaceService().selectPList();
		ArrayList<Theme> tlist = new ThemeService().selectThemeList();
		ArrayList<Category> clist = new CategoryService().selectCategoryList();
		ArrayList<Area> alist = new AreaService().selectAreaList();
		
		request.setAttribute("plist", plist);
		request.setAttribute("tlist", tlist);
		request.setAttribute("clist", clist);
		request.setAttribute("alist", alist);
		request.getRequestDispatcher("views/admin/courseAdd.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
