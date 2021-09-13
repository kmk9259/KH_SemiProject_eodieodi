package semiProject.com.kh.course.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semiProject.com.kh.board.model.vo.PlaceAttachment;
import semiProject.com.kh.course.model.service.CourseService;
import semiProject.com.kh.course.model.vo.Course;
import semiProject.com.kh.place.model.service.PlaceService;
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
		int cNo = Integer.parseInt(request.getParameter("cNo"));
		System.out.println("cNo???"+cNo);
		
		ArrayList<Place> list = new CourseService().selectCoursePlaceList(cNo);
		
		if(list != null)
		{
			request.setAttribute("list", list);
			request.getRequestDispatcher("views/course/coursePlaceDetailView.jsp").forward(request, response);
		}
		else
		{
		request.setAttribute("msg",	"코스일정 상세보기 실패"); 
			RequestDispatcher view =request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request, response); 
		}
		/*
		 * request.getRequestDispatcher("views/course/coursePlaceDetailView.jsp").
		 * forward(request, response);
		 */
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
