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
 * Servlet implementation class MemberUpdateAdminServlet
 */
@WebServlet("/updateMember.ad")
public class MemberUpdateAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateAdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mId2 = request.getParameter("mId2");
		System.out.println("mId2 : "+mId2);
		int result = new MemberService().updateMemberAdmin(mId2);
		if(result > 0)
		{
			response.sendRedirect("adminPage.ad");
		}
		else
		{			
			request.setAttribute("msg", "회원복구에 실패했습니다");
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
