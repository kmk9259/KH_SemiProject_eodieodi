package semiProject.com.kh.course.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semiProject.com.kh.course.model.service.CourseService;
import semiProject.com.kh.course.model.vo.Course;

/**
 * Servlet implementation class CourseUpdateServlet
 */
@WebServlet("/update.co")
public class CourseUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CourseUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String textarea = request.getParameter("pNo");
		System.out.println("넘어가니?"+textarea);
		String[] pNo = textarea.split(",");
		for(int i=0; i<pNo.length; i++) 
		{
			
			System.out.println("1111111111pNo"+pNo[i]);
			Course c = new Course();
			c.setCourseNo(Integer.parseInt(request.getParameter("cNo")));
			c.setAreaNo(Integer.parseInt(request.getParameter("aNo")));
			c.setThemeNo(Integer.parseInt(request.getParameter("themeNo")));
			c.setCourseTitle(request.getParameter("courseTitle"));
			
			int result = new CourseService().updateCourse(c,pNo);
			System.out.println("result"+result); 
			if(result>0) {
			  response.sendRedirect("list.co");
			  return;
			}
			 
			else 
			{ 
				request.setAttribute("msg", "코스 수정에 실패하였습니다.");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request,	response); 
			}
			 
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
