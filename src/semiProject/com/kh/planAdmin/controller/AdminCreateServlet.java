package semiProject.com.kh.planAdmin.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semiProject.com.kh.board.model.vo.PlaceAttachment;
import semiProject.com.kh.member.model.vo.Member;
import semiProject.com.kh.place.model.vo.Place;
import semiProject.com.kh.planAdmin.model.service.AdminPlanService;
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
	
		
		int userNo = ((Member) request.getSession().getAttribute("loginUser")).getUserNo(); // 1. 로그인유저번호
		
		String themeNo = request.getParameter("theme"); // 2. 테마 가져옴 1,2,3 
		String areaNo = request.getParameter("area"); // 3. 위치가져옴
	
		if(themeNo != null && areaNo !=null) {
			
		int theme =Integer.parseInt(request.getParameter("theme"));  //테마 
		int area = Integer.parseInt(request.getParameter("area"));  // 위치
			
			String bDate = request.getParameter("chooseDate"); // 선택된 날짜
			String m = bDate.substring(0, 2);
			String d = bDate.substring(3, 5);
			String y = bDate.substring(6);
			String aDate = y + "-" + m + "-" + d;
			// Date planDate= java.sql.Date.valueOf(aDate);
			Date adminDate = Date.valueOf(aDate);
				
			// ArrayList<Course> list = new CourseService().selectCList();	
			
			AdminPlan ap = new AdminPlan();
			ap.setUserNo(userNo);
			ap.setThemeNo(theme);
			ap.setAreaNo(area);
			ap.setChooseDate(adminDate);
			
			//테마랑 area 를 가지고 코스를 조회하고? 
			//AdminPlan aplist = new AdminPlanDao().
			
			//테마랑 애리어 가지로 코스를 랜덤으로 조회하는 다오 
			//ArrayList<Place> courseList = new AdminPlanService().selectCourse(area,theme);-이건아님 

			//장소 3개가 들어오는애를 정의해둬야됨 rset을 해놔서 
			ArrayList<Place> pList = new AdminPlanService().selectPList(area,theme);
			
		
		
//		//	int result = new AdminPlanService().insertAdminPlan(courseList);
//			
//			//request.setAttribute("courseList", courseList);
		
//			if(result > 0) {
//				
//				request.setAttribute("msg", "추천일정조회를 성공적으로 완료 하였습니다.");
//				//request.getRequestDispatcher("adminList.pl").forward(request, response);
//				response.sendRedirect("totalList.pl");
//		
//				return;
//				
//			}else {
//				request.setAttribute("msg", "추천일정 조회에 실패했습니다.");
//				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
//				
//			}
		
	//==	}else {
//			System.out.println(tmp+ tmp1+" 널포인트 잡히냐?");
		
		}
		
		//request.getRequestDispatcher("adminList.pl").forward(request, response);;
		request.getRequestDispatcher("totalList.pl").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
