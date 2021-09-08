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
 * Servlet implementation class Notice_UpdateFormServlet
 */

//게시글 수정 
@WebServlet("/updateForm.no")
public class Notice_UpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Notice_UpdateFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    } 

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//조회할 게시글을 가져오기 
		int nno = Integer.parseInt(request.getParameter("nno")); 
		Notice notice = new NoticeService().selectUpdateNotice(nno);
		
		String view ="";
		
		if(notice != null) {
			//리퀘스트에 노티스 데이터 담기 
			request.setAttribute("notice", notice);
			view = "views/notice/admin_Notice_Form.jsp"; 
			// 만약 널이 아니라면 공지사항 수정 상세페이지로 넘어가고 
			
			 
		}else {
			request.setAttribute("msg", "공지사항 수정조회 실패");
			view = "views/common/errorPage.jsp";

		}
		request.getRequestDispatcher(view).forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
