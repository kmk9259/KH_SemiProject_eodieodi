package semiProject.com.kh.planAdmin.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semiProject.com.kh.admin.model.service.AdminService;
import semiProject.com.kh.area.model.service.AreaService;
import semiProject.com.kh.area.model.vo.Area;
import semiProject.com.kh.course.model.vo.Course;
import semiProject.com.kh.member.model.vo.Member;
import semiProject.com.kh.place.model.vo.Place;
import semiProject.com.kh.planAdmin.model.vo.AdminPlan;

/**
 * Servlet implementation class adminPlan
 */
@WebServlet("/insertAdmin.pl")
public class AdminPlanInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminPlanInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		// 코스 리스트를 들고옴
		ArrayList<Course> cosList = new AdminService().selectCosList();
		// 위치 (홍대,강남) 리스트 들고옴
		//ArrayList<Place> pList = new AdminService().selectPlist();
		
		//ArrayList<Area> alist = new AreaService().selectAreaList();		

		int userNo = ((Member) request.getSession().getAttribute("loginUser")).getUserNo(); // 1. 로그인유저번호
		int which = Integer.valueOf(request.getParameter("area")); // 위치(홍대,강남)등
		
		String bDate = request.getParameter("chooseDate"); // 날짜
		String m = bDate.substring(0, 2);
		String d = bDate.substring(3, 5);
		String y = bDate.substring(6);
		String aDate = y + "-" + m + "-" + d;
		// Date planDate= java.sql.Date.valueOf(aDate);
		Date adminDate = Date.valueOf(aDate);
		
		
		ArrayList<AdminPlan> aplist = new AdminService().apList(cosList, userNo, which, adminDate);

		request.getSession().setAttribute("msg", "추천일정이 저장되었습니다. 일정 상세보기로 넘어갑니다");
		response.sendRedirect("views/plan/adminPlan_detail");
		// 상세보기jsp로 넘어감

//		}else {
//			request.setAttribute("msg", "추천일정 조회 실패 ");
//			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
//		}

	}
 
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
