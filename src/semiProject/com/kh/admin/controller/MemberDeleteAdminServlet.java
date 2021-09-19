package semiProject.com.kh.admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semiProject.com.kh.member.model.service.MemberService;

/**
 * Servlet implementation class MemberDeleteAdminServlet
 */
@WebServlet("/deleteMember.ad")
public class MemberDeleteAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberDeleteAdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mId = request.getParameter("mId");
		System.out.println("mid : "+mId);
		int result = new MemberService().deleteMember(mId);
		if(result > 0)
		{
			response.sendRedirect("allmemberList.me");
		}
		else
		{			
			request.setAttribute("msg", "회원삭제에 실패했습니다");
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
