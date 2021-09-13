package semiProject.com.kh.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semiProject.com.kh.member.model.service.MemberService;
import semiProject.com.kh.member.model.vo.Member;

/**
 * Servlet implementation class FindPwdServlet
 */
@WebServlet("/findPwd.me")
public class FindPwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindPwdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//post방식은 인코딩을 해줘야한다 (한글이 있을 경우)
	      request.setCharacterEncoding("UTF-8");
	      
	      //앞에 폼에서 넘겨주는 name으로 getParameter 해주기 getParameter(String name)
			String email = request.getParameter("email2");
			String userId = request.getParameter("userId");
			System.out.println("서블릿 돌리기 전 email--->" + email);
			System.out.println("서블릿 돌리기 전 userId--->" + userId);
			
			Member findPwd = new MemberService().findUserPwd(email, userId);
			System.out.println("서블릿 돌리기 전 findPwd--->" + findPwd);

			request.getParameter("findPwd");
			
			int result = new MemberService().emailCheck(email);
			System.out.println("서블릿 돌리기 전 result--->" + result);

			//PrintWriter out = response.getWriter();
			if(findPwd != null) {
			
			//if(result > 0) {
				//out.print("fail");
				//if(findPwd != null) {
				//System.out.println("서블릿 돌린 후의 result--->" + result);
				
				request.getSession().setAttribute("msg", "비밀번호 찾기 성공!");

		         HttpSession session = request.getSession();
		         session.setAttribute("findPwd", findPwd);
		         System.out.println("session =========" + findPwd);
				//request.getSession().setAttribute("findPwd", findPwd);
				System.out.println("서블릿 돌린 후 findPwd--->" + findPwd);
				
			//	request.getSession().setAttribute("result", result);
			//	System.out.println("서블릿 돌린 후 result--->" + result);
		         response.sendRedirect(request.getContextPath());
		         //RequestDispatcher view = request.getRequestDispatcher("/findId.me");
		         //view.forward(request, response);
				
			}else {
				//out.print("success");
				
				request.setAttribute("msg", "비밀번호 찾기에 실패했습니다.");
				RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
				view.forward(request, response);
			}
			//out.flush();
			//out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
