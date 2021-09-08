package semiProject.com.kh.planAdmin.controller;

import java.io.IOException;

import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semiProject.com.kh.member.model.vo.Member;
import semiProject.com.kh.planAdmin.model.vo.AdminPlan;

/**
 * Servlet implementation class adminPlan
 */
@WebServlet("/adminPlan.ap")
public class adminPlanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminPlanServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();//로그인유저 
		
		String planTitle= request.getParameter("title");
		int theme = Integer.valueOf(request.getParameter("theme")); //테마 
		int which = Integer.valueOf(request.getParameter("which")); //위치
		
		
		String bDate = request.getParameter("choose_date"); 
		String m = bDate.substring(0,2);
		String d = bDate.substring(3,5);
		String y = bDate.substring(6);
		String aDate = y+"-"+m+"-"+d;
		//Date planDate=  java.sql.Date.valueOf(aDate);
		Date adminDate = Date.valueOf(aDate);
		
		 
	//	AdminPlan ap = new AdminPlan(theme,which, planTitle, adminDate);
	}
 
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
