package semiProject.com.kh.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semiProject.com.kh.member.model.service.MemberService;
import semiProject.com.kh.member.model.vo.Member;

/**
 * Servlet implementation class MemberUpdateServlet
 */
@WebServlet("/update.me")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//post방식은 인코딩을 해줘야한다 (한글이 있을 경우)
	    request.setCharacterEncoding("UTF-8");
	    
	    String userId = request.getParameter("userId");
		String userName = request.getParameter("userName");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		
		
		Member updateMem = new MemberService().updateMember(new Member(userId, userName, phone, email));
		if(updateMem != null) {
			request.getSession().setAttribute("msg", "성공적으로 회원정보를 수정하였습니다.");
			request.getSession().setAttribute("loginUser", updateMem);
	         RequestDispatcher view = request.getRequestDispatcher("/mypage.me");
	         view.forward(request, response);
		}else {
	         request.setAttribute("msg", "회원 정보 수정에 실패했습니다.");
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
