package semiProject.com.kh.course.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semiProject.com.kh.course.model.service.CourseService;
import semiProject.com.kh.place.model.vo.Place;

/**
 * Servlet implementation class CoursePlaceDetail
 */
@WebServlet("/cplaceDetail.co")
public class CoursePlaceDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CoursePlaceDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cno = Integer.parseInt(request.getParameter("cno"));
		System.out.println("나는 머야 cno"+cno);
		ArrayList<Place> cplist = new CourseService().selectCoursePlaceList(cno);
		System.out.println("cplist   "+cplist);
		if(cplist != null)
		{
			System.out.println("Fffffffffffff");
		}
		
		
		
		
	
		
		request.getRequestDispatcher("views/course/coursePlaceDetailView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
