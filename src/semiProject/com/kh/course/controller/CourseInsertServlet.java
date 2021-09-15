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
import semiProject.com.kh.category.model.service.CategoryService;
import semiProject.com.kh.category.model.vo.Category;
import semiProject.com.kh.course.model.service.CourseService;
import semiProject.com.kh.course.model.vo.Course;
import semiProject.com.kh.theme.model.vo.Theme;
import semiProject.com.kh.theme.service.ThemeService;

/**
 * Servlet implementation class CourseInsertServlet
 */
@WebServlet("/cInsert.co")
public class CourseInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CourseInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		ArrayList<Theme> tlist = new ThemeService().selectThemeList();
		ArrayList<Area> alist = new AreaService().selectAreaList();
		ArrayList<Category> clist = new CategoryService().selectCategoryList();
	
		request.setAttribute("tlist", tlist);
		request.setAttribute("alist", alist);
		request.setAttribute("clist", clist);
	
		//코스 등록 버튼 눌렀을 때
		String courseTitle = request.getParameter("courseTitle");	//코스이름
		String areaNo = request.getParameter("area");				//지역종류 선택한 라디오값(getAreaNo)
		String themeNo = request.getParameter("themeNo");			//테마 종류 선택한 라디오 값(getThemeNo)
		String textarea = request.getParameter("pNo");
		
		System.out.println("courseTitle"+courseTitle);
		System.out.println("areaNo"+areaNo);
		System.out.println("themeNo"+themeNo);
		System.out.println("textarea"+textarea);
		if(textarea!= null && areaNo!=null && themeNo!= null)
		{
			String[] pNo = textarea.split(",");
			for(int i=0; i<pNo.length; i++)
			{
				System.out.println(pNo[i]);
				Course c = new Course();
				c.setAreaNo(Integer.parseInt(areaNo));
				c.setThemeNo(Integer.parseInt(themeNo));
				c.setCourseTitle(courseTitle);
				
				int result = new CourseService().insertCourse(c,pNo);
				
				if(result >0)
				{
					response.sendRedirect("list.co");
					return;
				}
				else
				{
					request.setAttribute("msg", "일정 등록에 실패하였습니다.");
					request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
				}
				
				
			}
		}
		
		
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
