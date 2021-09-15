package semiProject.com.kh.place.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semiProject.com.kh.area.model.service.AreaService;
import semiProject.com.kh.area.model.vo.Area;
import semiProject.com.kh.board.model.vo.PlaceAttachment;
import semiProject.com.kh.category.model.service.CategoryService;
import semiProject.com.kh.category.model.vo.Category;
import semiProject.com.kh.place.model.service.PlaceService;
import semiProject.com.kh.place.model.vo.Place;

/**
 * Servlet implementation class PlaceUpdateFormServlet
 */
@WebServlet("/updateForm.pl")
public class PlaceUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlaceUpdateFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Area> alist = new AreaService().selectAreaList();
		ArrayList<Category> clist = new CategoryService().selectCategoryList();
	
		request.setAttribute("alist", alist);
		request.setAttribute("clist", clist);
		
		int pNo = Integer.parseInt(request.getParameter("pNo"));
		System.out.println("pNo============"+pNo);
		
		Place p = new PlaceService().selectUpdatePlace(pNo);
		System.out.println("Place============="+p);
		PlaceAttachment pa = new PlaceService().selectAttachment(pNo);
		
		if(p != null)
		{
			request.setAttribute("p", p);
			request.setAttribute("pa", pa);
			request.getRequestDispatcher("views/place/placeUpdateForm.jsp").forward(request, response);
		}
		else
		{
			request.setAttribute("msg", "일정 수정에 실패하였습니다.");
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