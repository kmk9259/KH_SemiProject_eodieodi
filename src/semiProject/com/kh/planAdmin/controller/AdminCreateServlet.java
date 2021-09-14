package semiProject.com.kh.planAdmin.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semiProject.com.kh.member.model.vo.Member;
import semiProject.com.kh.planAdmin.model.dao.AdminPlanDao;
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
		System.out.println(userNo+"서블렛쪽 유저넘ㅇ버-------------");
		
		String themeNo = request.getParameter("theme"); // 2. 테마 가져옴 1,2,3 
		String areaNo = request.getParameter("area"); // 3. 위치가져옴
	
		if(themeNo != null && areaNo !=null) {
			
		int theme =Integer.parseInt(request.getParameter("theme"));  //테마 
		int area = Integer.parseInt(request.getParameter("area"));  // 위치
			
		System.out.println(theme+"------------theme");
		System.out.println(area+"------------area");
		
			String bDate = request.getParameter("chooseDate"); // 선택된 날짜
			String m = bDate.substring(0, 2);
			String d = bDate.substring(3, 5);
			String y = bDate.substring(6);
			String aDate = y + "-" + m + "-" + d;
			// Date planDate= java.sql.Date.valueOf(aDate);
			Date adminDate = Date.valueOf(aDate);
			
			System.out.println(adminDate+"------------adminDate");

				
			// ArrayList<Course> list = new CourseService().selectCList();	
			
			
			
			AdminPlan ap = new AdminPlan();
			ap.setUserNo(userNo);
			ap.setThemeNo(theme);
			ap.setAreaNo(area);
			ap.setChooseDate(adminDate);
			
			System.out.println(ap+"---------------서블렛쪽 apList");
			
			
			//테마랑 area 를 가지고 코스를 조회하고? 
			AdminPlan aplist = new AdminPlanDao().
			
			int result = new AdminPlanService().
			
			
			
//			
//			Theme th = new Theme();
//			th.setThemeNo(theme);
//			
//			Area a = new Area();
//			a.setAreaNo(area);
//			
//			AdminPlan apList = new AdminPlan(th,a);
//			
			

//			
//			
//			
//			AdminPlan apList = new AdminPlan(userNo, area, adminDate); 
//			
//			//코스랑, 네임으로 받아온 값 넘겨주기 
//			int result = new AdminPlanService().insertAdminPlan();
//			
//			
//			request.setAttribute("apList", apList);
//			request.setAttribute("cList", cosList);
//
//			System.out.println(apList+"--------apList-------");
			

//			
//			if(result > 0) {
//				
//				request.setAttribute("msg", "추천일정 등록 되었습니다.");
//				//request.getRequestDispatcher("adminList.pl").forward(request, response);
//				request.getRequestDispatcher("views/plan/adminPlan_detail.jsp").forward(request, response);
//				//response.sendRedirect("views/plan/adminPlanSave.jsp");// 조회가 끝나면 저장함으로 돌아가는것.. 
//		
//				return;
//				
//			}else {
//				request.setAttribute("msg", "추천일정 등록에 실패했습니다.");
//				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
//				
//			}
		
		}else {
//			System.out.println(tmp+ tmp1+" 널포인트 잡히냐?");
		
		}
		
		//request.getRequestDispatcher("adminList.pl").forward(request, response);;
		request.getRequestDispatcher("views/plan/adminPlan_detail.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
