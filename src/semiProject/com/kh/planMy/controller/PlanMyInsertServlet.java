package semiProject.com.kh.planMy.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semiProject.com.kh.member.model.vo.Member;
import semiProject.com.kh.planMy.model.service.PlanMyService;
import semiProject.com.kh.planMy.model.vo.PlanMy;

/**
 * Servlet implementation class PlanMyCreate
 */
@WebServlet("/create.pl")
public class PlanMyInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlanMyInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();  //1. 로그인유저번호
		String planTitle = request.getParameter("planTitle");			  //2. 제목
		String bDate = request.getParameter("planDate");     			  //3. 날짜 -> sql.Date로 변환
		String m = bDate.substring(0,2);
		String d = bDate.substring(3,5);
		String y = bDate.substring(6);
		String aDate = y+"-"+m+"-"+d;
		//Date planDate=  java.sql.Date.valueOf(aDate);
		Date planDate = Date.valueOf(aDate);
		String planMemo = request.getParameter("planMemo");  			  //4. 메모
		int areaNo = Integer.parseInt(request.getParameter("planArea"));  //5.지역	
		
		PlanMy pm = new PlanMy(userNo, areaNo, planTitle, planDate, planMemo);
		
		//planPlace -> MYPLAN_PLACE 테이블에 넣어주기
		String[] planPlaces = request.getParameterValues("placeNo");

		
		int result = new PlanMyService().insertPlanMy(pm, planPlaces);
		
		if(result > 0) {
			request.getSession().setAttribute("msg", "일정이 등록되었습니다.");
			response.sendRedirect("list.ps");  	//일정저장함으로 이동
		}else {
			request.setAttribute("msg", "일정 등록 실패");
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
