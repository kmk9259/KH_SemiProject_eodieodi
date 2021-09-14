package semiProject.com.kh.planMy.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semiProject.com.kh.planMy.model.service.PlanMyService;

/**
 * Servlet implementation class AddPlanPlaceServlet
 */
@WebServlet("/addPlanPlace.do")
public class AddPlanPlaceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPlanPlaceServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int planNo = Integer.parseInt(request.getParameter("planNo"));
		
		String b_placeNo = request.getParameter("placeNo");
		ArrayList<String> placeNo = new ArrayList<String>();
		placeNo.add(b_placeNo);
		
		System.out.println("planNo 어레이리스트 사이즈: " + placeNo.size() + " 뭐 들었나?" + placeNo.get(0));
		
		int result = new PlanMyService().addPlanPlace(planNo, placeNo);
		response.setCharacterEncoding("UTF-8");
		
		if(result > 0) {
			response.getWriter().print(true);  //선택한 일정에 장소추가 성공
		}else {
			response.getWriter().print(false); //선택한 일정에 장소추가 실패
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
