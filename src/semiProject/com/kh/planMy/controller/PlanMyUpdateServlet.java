package semiProject.com.kh.planMy.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semiProject.com.kh.planMy.model.service.PlanMyService;
import semiProject.com.kh.planMy.model.vo.PlanMy;

/**
 * Servlet implementation class PlanMyUpdateServlet
 */
@WebServlet("/update.ps")
public class PlanMyUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlanMyUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int planNo = Integer.parseInt(request.getParameter("planNo"));    //1. plan번호
		String planTitle = request.getParameter("planTitle");			  //2. 제목
		
		String bDate = request.getParameter("planDate");     			  //3. 날짜 -> sql.Date로 변환
		String m = bDate.substring(0,2);
		String d = bDate.substring(3,5);
		String y = bDate.substring(6);
		String aDate = y+"-"+m+"-"+d;
		Date planDate = Date.valueOf(aDate);
		
		String planMemo = request.getParameter("planMemo");  			  //4. 메모
		int areaNo = Integer.parseInt(request.getParameter("planArea"));  //5. 지역	
		
		
		//PlanMy pm = new PlanMy(planNo, areaNo, planTitle, planDate, planMemo.replaceAll("\n","<br>"));  //1.pm -> MYPLAN 테이블에 넣어주기
		PlanMy pm = new PlanMy();
		pm.setPlanNo(planNo);
		pm.setAreaNo(areaNo);
		pm.setPlanTitle(planTitle);
		pm.setPlanDate(planDate);
		pm.setPlanMemo(planMemo.replaceAll("\n","<br>"));

		String[] planPlaces = request.getParameterValues("placeNo");            //2.planPlace -> MYPLAN_PLACE 테이블에 넣어주기
		
		int result = new PlanMyService().updatePlanMy(pm, planNo, planPlaces);  //planNo도 같이 넘기자->MYPLAN_PLACE에 추가할때를 위해서
		
		
//		System.out.println("updateServlet__ pm : " + pm);
//		System.out.println("updateServlet__ planNo : " + planNo);
		
//		for(String s: planPlaces) {
//			System.out.println("updateServlet__ planPlaces(장소번호) : " + s);
//		}

		
		if(result > 0) {
			request.getSession().setAttribute("msg", "일정이 수정되었습니다.");
			response.sendRedirect("list.ps");  	//일정저장함으로 이동
		}else {
			request.setAttribute("msg", "일정 수정 실패");
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
