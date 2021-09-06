package semiProject.com.kh.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semiProject.com.kh.notice.model.service.NoticeService;
import semiProject.com.kh.notice.model.vo.Notice;

/**
 * Servlet implementation class Notice_UpdateServlet
 */
@WebServlet("/update.no")
public class Notice_UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Notice_UpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int nno= Integer.parseInt(request.getParameter("nno")); // 조회한 게시글 가져오기 
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		Notice n = new Notice(); 
		n.setNoticeNo(nno);
		n.setNoticeTitle(title);
		n.setNoticeContent(content.replaceAll("\n", "<br>")); //replaceAll 특수문자를치환..?
		
		int result = new NoticeService().updateNotice(n);
		
		if(result > 0) {
			request.getSession().setAttribute("msg", "공지사항이 성공적으로 수정되었습니다.");
			response.sendRedirect("detail.no?nno="+nno);
			//수정된 페이지의 번호 상세페이지로 보여줄려고 
		}else {
			request.setAttribute("msg", "공지사항 수정에 실패하였습니다 ");
			
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
