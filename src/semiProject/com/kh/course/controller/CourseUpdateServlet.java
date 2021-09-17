package semiProject.com.kh.course.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semiProject.com.kh.course.model.service.CourseService;
import semiProject.com.kh.course.model.vo.Course;
import semiProject.com.kh.course.model.vo.CoursePlace;

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
		int cNo = Integer.parseInt(request.getParameter("cNo"));
		System.out.println(cNo+"cNo");
		ArrayList<CoursePlace> cpno = new CourseService().selectCPno(cNo);
		System.out.println("업데이트 전 cpno$$$$$$$$$    "+cpno);
		
		String textarea = request.getParameter("pNo");
		System.out.println("업데이트 할 pnopno"+textarea);
		
		String[] pNo = textarea.split(",");
		int[] cpNo = new int[cpno.size()];
		Course c = new Course();
		c.setCourseNo(cNo);
		c.setAreaNo(Integer.parseInt(request.getParameter("aNo")));
		c.setThemeNo(Integer.parseInt(request.getParameter("themeNo")));
		c.setCourseTitle(request.getParameter("courseTitle"));
		int result=0;
		for(int i=0; i<cpno.size(); i++) 	
		{
			cpNo[i] = cpno.get(i).getCpNo();
			
			
			System.out.println("최종 pno  "+pNo[i]+"\n");
			System.out.println("최종 cpNo  "+cpNo[i]);
			result = new CourseService().updateCourse(c,cNo,pNo[i],cpNo[i]);
			
		}
		if(result >0)
			response.sendRedirect("list.co");
		else
		{
			request.setAttribute("msg", "코스 수정에 실패하였습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
