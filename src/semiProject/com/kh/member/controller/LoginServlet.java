package semiProject.com.kh.member.controller;

import java.io.IOException;

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
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login.me")
public class LoginServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
      String userId = request.getParameter("userId");
      String userPwd = request.getParameter("userPwd");
      String originPwd = request.getParameter("userPwd");
     // String originPwd = (String)request.getParameter("originPwd");

      System.out.println(userPwd);
      System.out.println(originPwd);
      
      Member loginUser = new MemberService().loginMember(userId, userPwd);
      System.out.println("로그인 전" + loginUser);
      if(loginUser != null)//로그인 성공시
      {
         HttpSession session = request.getSession();
         session.setAttribute("loginUser", loginUser);
         session.setAttribute("originPwd", originPwd);

         System.out.println("로그인 성공" + loginUser);
         response.sendRedirect(request.getContextPath());
      }else
      {
          request.setAttribute("msg", "로그인에 실패했습니다.");
          RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
          view.forward(request, response);
         System.out.println("로그인 실패" + loginUser);
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