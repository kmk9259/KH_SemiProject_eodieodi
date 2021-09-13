package semiProject.com.kh.planMy.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import semiProject.com.kh.place.model.vo.Place;
import semiProject.com.kh.planMy.model.service.PlanMyService;

/**
 * Servlet implementation class CategoryPlaceListServlet
 */
@WebServlet("/pclist.do")
public class CategoryPlaceListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategoryPlaceListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int areaNo = Integer.parseInt(request.getParameter("areaNo"));
		String category = request.getParameter("category");
		
		int categoryNo = 3;
		if(category.equals("식당")) {
			categoryNo = 1;
		}else if(category.equals("카페주점")) {
			categoryNo = 2;
		}
		
		ArrayList<Place> pcList = new PlanMyService().categoryPlaceList(areaNo, categoryNo);
		
		response.setContentType("application/json; charset=utf-8");
	        
	    new Gson().toJson(pcList, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
