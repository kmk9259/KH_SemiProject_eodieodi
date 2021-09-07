package semiProject.com.kh.planAdmin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semiProject.com.kh.place.model.vo.Place;
import semiProject.com.kh.planAdmin.model.service.AdminPlanService;

/**
 * Servlet implementation class adminPlan_Detail
 */
@WebServlet("/adminPlan_Detail")
public class adminPlan_DetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminPlan_DetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	ArrayList<Place> list = new AdminPlanService().selectList();
	request.setAttribute("list", list);
	
	request.getRequestDispatcher("views/plan/adminPlansave.jsp").forward(request, response);
	
	}
 
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
