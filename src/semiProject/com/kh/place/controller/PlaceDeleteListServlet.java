package semiProject.com.kh.place.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import semiProject.com.kh.area.model.service.AreaService;
import semiProject.com.kh.area.model.vo.Area;
import semiProject.com.kh.course.model.service.CourseService;
import semiProject.com.kh.course.model.vo.Course;
import semiProject.com.kh.place.model.service.PlaceService;
import semiProject.com.kh.place.model.vo.Place;

/**
 * Servlet implementation class PlaceDeleteServlet
 */
@WebServlet("/deleteP.pl")
public class PlaceDeleteListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PlaceDeleteListServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		ArrayList<Area> alist = new AreaService().selectAreaList();
		request.setAttribute("alist", alist);
		String placeNo = request.getParameter("pNo");
		if(placeNo != null)
		{
			int pNo = Integer.parseInt(placeNo);
			int result = new PlaceService().deletePlace(pNo);
			if(result>0)
			{
				response.sendRedirect("list.pl");
				return;
			}
			else
			{
				request.setAttribute("msg", "일정 삭제에 실패하였습니다.");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
		}
		request.getRequestDispatcher("views/admin/placeDelete.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
