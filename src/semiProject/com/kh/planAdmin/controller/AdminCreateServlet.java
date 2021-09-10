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
 * Servlet implementation class AdminCreateServlet
 */
@WebServlet("/adminCreate.pl")
public class AdminCreateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminCreateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//라디오버튼으로 선택된 코스를 가져옴 
		int userNo = ((Member) request.getSession().getAttribute("loginUser")).getUserNo(); // 1. 로그인유저번호
		int course =Integer.parseInt(request.getParameter("course")); // 코스 가져옴
		int which = Integer.parseInt(request.getParameter("which")); // 위치가져옴

		String bDate = request.getParameter("chooseDate"); // 날짜
		String m = bDate.substring(0, 2);
		String d = bDate.substring(3, 5);
		String y = bDate.substring(6);
		String aDate = y + "-" + m + "-" + d;
		
		// Date planDate= java.sql.Date.valueOf(aDate);
		Date adminDate = Date.valueOf(aDate);
		
		AdminPlan apList = new AdminPlan(userNo,course, which, adminDate);
		
		//리퀘스트에 aplist 데이터 담기 
		request.setAttribute("apList", apList);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
