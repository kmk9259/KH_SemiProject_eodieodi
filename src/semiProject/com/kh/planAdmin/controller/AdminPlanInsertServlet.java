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
import semiProject.com.kh.member.model.vo.Member;
import semiProject.com.kh.place.model.vo.Place;

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
	
		//adminRecommand jsp에서 속성 가져와야됨 네임으로 
		
		//내가 가져와야될꺼는 로그인한 유저, (랜덤으로 배정된) 코스, 위치, 날짜 -> ap 객체 사용자한테 받아서 
		//장소를 받아서 detail로 넘기는 애를 어레이리스트로 받는다  담는 바구니 arraylist -> 결과값 
		
		
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();  //1. 로그인유저번호
		int which = Integer.valueOf(request.getParameter("area")); //위치(홍대,강남)등 
		int randomCourse =  Integer.valueOf(request.getParameter("course")); 
		// 라디오버튼 인트로 받아도 되는가...? 
		
	
		//	String planTitle= request.getParameter("title"); //혹시모르니 제목..? 
		// 체크드를 하나 옵션값을 
			
		// 널값 제어를 하고 파스인트를 한번 해봐라 
		
		
		String bDate = request.getParameter("chooseDate");  // 날짜 
		String m = bDate.substring(0,2);
		String d = bDate.substring(3,5);
		String y = bDate.substring(6);
		String aDate = y+"-"+m+"-"+d;
		//Date planDate=  java.sql.Date.valueOf(aDate);
		Date adminDate = Date.valueOf(aDate);

		//AdminPlan ap = new AdminPlan(userNo, which, randomCourse, adminDate);
		//플레이스도 받ㅇ는? 
		
		//위치리스트랑 
	//	ArrayList<Place> pList = new AdminService().selectpList();
		
		//코스 리스트를 가져와야되는감 
		//위에서 받은 ap,와 테이블에 저장할 adminPlace를 넣는다 
		
		//객체로 받아라 
		
		//int result = new AdminPlanService()
		
	//각각의 속성들을 가져온뒤에 (코스,날짜,위치)등 이후 이것들을 담는 걸 객체로 생성해야됨 뷰로 넘겨주는 객체들도 생성해야됨 
		
	
//		if( result > 0) {
//			
			request.getSession().setAttribute("msg", "추천일정이 저장되었습니다. 일정 상세보기로 넘어갑니다");
			response.sendRedirect("views/plan/adminPlan_detail"); 
			// 상세보기jsp로 넘어감 
			
			
			
//		}else {
//			request.setAttribute("msg", "추천일정 조회 실패 ");
//			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
//		}
//		
	}
 
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
