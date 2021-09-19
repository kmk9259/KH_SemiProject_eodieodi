package semiProject.com.kh.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semiProject.com.kh.member.model.vo.Member;
import semiProject.com.kh.notice.model.service.NoticeService;
import semiProject.com.kh.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeInsertServlet
 */
@WebServlet("/insert.no")
public class NoticeInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
     
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	      request.setCharacterEncoding("UTF-8");
 
	
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String writer = String.valueOf(((Member)request.getSession().getAttribute("loginUser")).getUserNo()); //작성한 사람만 수정할수있다면
		//작성한 사람만 작성할 수 있게 
	
		Notice n = new Notice(title,writer,content);
		//		Notice n = new Notice(title,writer,content.replaceAll("\n", "<br>"));

		
		int result = new NoticeService().insertNotice(n);
		
		if(n.getNoticeContent() != null) {
			n.setNoticeContent(n.getNoticeContent().replaceAll("<br>","\n"));
		}
		
		
		if(result>0) {
			request.getSession().setAttribute("msg", "공지사항이 성공적으로 등록되었습니다. ");
			response.sendRedirect("list.no"); // 다시 조회하면 호출해서 리스트로 돌아감 
			
		}else {
			request.setAttribute("msg", "공지사항 등록 실패");
			
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
