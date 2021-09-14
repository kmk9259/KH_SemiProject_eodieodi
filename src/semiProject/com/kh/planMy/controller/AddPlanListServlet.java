package semiProject.com.kh.planMy.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import semiProject.com.kh.member.model.vo.Member;
import semiProject.com.kh.planMy.model.service.PlanMyService;
import semiProject.com.kh.planMy.model.vo.PlanMy;

/**
 * Servlet implementation class AddPlanListServlet
 */
@WebServlet("/addPlanlist.do")
public class AddPlanListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPlanListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int placeNo = Integer.parseInt(request.getParameter("placeNo"));
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		
		ArrayList<PlanMy> planList = new PlanMyService().addPlanList(userNo,placeNo);
		
		response.setContentType("application/json; charset=utf-8");
	        
	    new Gson().toJson(planList, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
