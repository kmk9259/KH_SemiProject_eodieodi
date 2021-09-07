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
 * Servlet implementation class NoticeDetailSevlet
 */
@WebServlet("/detail.no")
public class NoticeDetailSevlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDetailSevlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		// script 에서 조회하는 nno 를 get 방식으로 가져온다
		
		int nno = Integer.parseInt(request.getParameter("nno"));
		
		
		Notice notice = new NoticeService().selelctNotice(nno); //nno 받아온걸 조회메소드로 가지고 감  
	
		String view ="";
		if(notice !=null) {
			request.setAttribute("notice",notice); 
			view = "views/notice/admin_Notice_DetailPage.jsp"; //널이 아니면 상세페이지로 넘어감
			
		}else {
			
			request.setAttribute("msg", "공지사항 조회에 실패 하였습니다.");
			view="view/common/errorPage.jsp";
		}
		request.getRequestDispatcher(view).forward(request, response);
		//다시 조회페이지로 돌아오기 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
