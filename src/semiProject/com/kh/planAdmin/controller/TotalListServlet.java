package semiProject.com.kh.planAdmin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semiProject.com.kh.member.model.vo.Member;
import semiProject.com.kh.place.model.vo.Place;
import semiProject.com.kh.planAdmin.model.service.AdminPlanService;
import semiProject.com.kh.planAdmin.model.vo.AdminPlan;

/**
 * Servlet implementation class SelectCourseServlet
 */
@WebServlet("/totalList.pl")
public class TotalListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TotalListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
 
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userNo = ((Member) request.getSession().getAttribute("loginUser")).getUserNo(); // 1. 로그인유저번호

		//ArrayList<Place> pList = new AdminPlanService().selectPList();
		
		//request.setAttribute("pList", pList);
		
		
		request.getRequestDispatcher("views/adminPlan/admin_Plan_detail.jsp").forward(request, response);
	}
 
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
