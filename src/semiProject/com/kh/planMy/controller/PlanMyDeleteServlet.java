package semiProject.com.kh.planMy.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semiProject.com.kh.planMy.model.service.PlanMyService;

/**
 * Servlet implementation class PlanMyDeleteServlet
 */
@WebServlet("/deleteP.ps")
public class PlanMyDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlanMyDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String[] planNo = request.getParameterValues("planNo");

		System.out.println("내가 보낸 값 : " +request.getParameterValues("planNo"));
		System.out.println("deleteServlet에서 받는 값 planNo[]: " + planNo);
//		
//		int result = new PlanMyService().deleltePlanMy(planNo);
		
		int result = new PlanMyService().deletePlanMy(planNo);
		
		if(result > 0) {
			request.setAttribute("msg", "선택된 일정이 삭제되었습니다.");
			response.sendRedirect("list.ps");
		}else {
			request.setAttribute("msg", "게시글 삭제에 실패했습니다.");
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
