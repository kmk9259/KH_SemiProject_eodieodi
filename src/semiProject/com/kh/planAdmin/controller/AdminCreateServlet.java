package semiProject.com.kh.planAdmin.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semiProject.com.kh.course.model.vo.CoursePlace;
import semiProject.com.kh.member.model.vo.Member;
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

		//라디오버튼으로 선택된 코스를 가져옴 
		int userNo = ((Member) request.getSession().getAttribute("loginUser")).getUserNo(); // 1. 로그인유저번호
		String tmp =request.getParameter("course"); // 2.코스 가져옴
		String tmp1 = request.getParameter("which"); // 3. 위치가져옴

	
		if(tmp != null && tmp !=null) {
			
		int course =Integer.parseInt(request.getParameter("course")); 
		int area = Integer.parseInt(request.getParameter("area")); // 3. 위치가져옴
			
			String bDate = request.getParameter("chooseDate"); // 4. 날짜
			String m = bDate.substring(0, 2);
			String d = bDate.substring(3, 5);
			String y = bDate.substring(6);
			String aDate = y + "-" + m + "-" + d;
			// Date planDate= java.sql.Date.valueOf(aDate);
			Date adminDate = Date.valueOf(aDate);
			
			
			//코스 리스트 가져와서 넣어주기 
			ArrayList<CoursePlace> cList = new AdminPlanService().CourseList();
			
			AdminPlan apList = new AdminPlan(userNo, course, area, adminDate);
			
			//코스랑, 네임으로 받아온 값 넘겨주기 
			int result = new AdminPlanService().insertAdminPlan(apList, cList);
			
			
			request.setAttribute("apList", apList);
			request.setAttribute("cList", cList);

			System.out.println(apList+"--------apList-------");
			System.out.println(cList+"--------코스리스트--------");

			
			if(result > 0) {
				
				request.setAttribute("msg", "추천일정 등록 되었습니다.");
				//request.getRequestDispatcher("adminList.pl").forward(request, response);
				request.getRequestDispatcher("views/plan/adminPlan_detail.jsp").forward(request, response);
				//response.sendRedirect("views/plan/adminPlanSave.jsp");// 조회가 끝나면 저장함으로 돌아가는것.. 
		
				return;
				
			}else {
				request.setAttribute("msg", "추천일정 등록에 실패했습니다.");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
				
			}
		
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
