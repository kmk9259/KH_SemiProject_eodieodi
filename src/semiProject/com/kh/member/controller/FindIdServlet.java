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
 * Servlet implementation class FindIdServlet
 */
@WebServlet("/findId.me")
public class FindIdServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindIdServlet() {
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
         String email = request.getParameter("email");
         String userName = request.getParameter("userName");
         System.out.println("서블릿 돌리기 전 email--->" + email);
         System.out.println("서블릿 돌리기 전 userName--->" + userName);
         
         Member findId = new MemberService().findUserId(email, userName);
         System.out.println("서블릿 돌리기 전 findId--->" + findId);

         request.getParameter("findId");
         
         int result = new MemberService().emailCheck(email);
         System.out.println("서블릿 돌리기 전 result--->" + result);

         if(findId != null) {
            
            request.getSession().setAttribute("msg", "아이디 찾기 성공!");

               HttpSession session = request.getSession();
               session.setAttribute("findId", findId);
               System.out.println("session =========" + findId);
            System.out.println("서블릿 돌린 후 findId--->" + findId);
            
               response.sendRedirect(request.getContextPath());
         }else {
            request.setAttribute("msg", "아이디 찾기에 실패했습니다."); 
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