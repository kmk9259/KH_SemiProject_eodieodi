package semiProject.com.kh.planMy.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semiProject.com.kh.place.model.vo.Place;
import semiProject.com.kh.planMy.model.service.PlanMyService;
import semiProject.com.kh.planMy.model.vo.PlanMy;

/**
 * Servlet implementation class PlanMyUpdateFormServlet
 */
@WebServlet("/updateForm.pl")
public class PlanMyUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlanMyUpdateFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int planNo = Integer.parseInt(request.getParameter("planNo"));
		System.out.println("-------------updateFormServlet에서 planNo : " + planNo);
		
		PlanMy pm = new PlanMyService().selectPlanMy(planNo);
		ArrayList<Place> pList = new PlanMyService().selectPlace_planMy(planNo);
		ArrayList<Place> list = new PlanMyService().selectList();
		
		System.out.println("-------------updateFormServlet에서 pm : " + pm);
		System.out.println("-------------updateFormServlet에서 pList : " + pList);
		
		if(pm != null) {
			request.setAttribute("pm", pm);
			request.setAttribute("pList", pList);
			request.setAttribute("list", list);
			request.getRequestDispatcher("views/plan/planMyUpdateForm.jsp").forward(request, response);;
		}else {
			request.setAttribute("msg", "수정할 일정을 불러오는데 실패했습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
