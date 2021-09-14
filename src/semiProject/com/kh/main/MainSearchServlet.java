package semiProject.com.kh.main;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semiProject.com.kh.place.model.service.PlaceService;
import semiProject.com.kh.place.model.vo.Place;

/**
 * Servlet implementation class MainSearchServlet
 */
@WebServlet("/main")
public class MainSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchArea = request.getParameter("search");
		System.out.println("searchArea"+searchArea);
		ArrayList<Place> searchPlace = new PlaceService().searchArea(searchArea);
		System.out.println("searchPlace"+searchPlace);
		
		if(!searchPlace.isEmpty() && !searchArea.equals(""))
		{
			request.setAttribute("searchPlace", searchPlace);
			request.setAttribute("msg", " ");
			request.getRequestDispatcher("searchMain.jsp").forward(request, response);
		}
		else
		{
			request.setAttribute("msg", "검색된 일정이 없습니다. 다시 검색해 주세요");
			request.getRequestDispatcher("searchMain.jsp").forward(request, response);
					
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
