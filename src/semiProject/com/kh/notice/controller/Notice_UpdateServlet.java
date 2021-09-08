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

//게시글 수정 처리 서블렛 
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
				
		// getparameter은 항상 스트링형태로 반환해줘서 형변환 해주는데 뭐가 문제임 ㅠ 
		
		int nno = Integer.parseInt(request.getParameter("nno"));  // 조회한 게시글 가져오기 
		
//		System.out.println(nno + "nno 잘들고 오는지 ");
//		System.out.println(nno + "nno 잘들고 오는지 ");
//		System.out.println(nno + "nno 잘들고 오는지 ");
//		System.out.println(nno + "nno 잘들고 오는지 ");

		String title = request.getParameter("title");
		String content = request.getParameter("content");
	
		System.out.println(title+content+"컨텐츠랑 타이틀 잘 들ㅇ고오는지 ");
		
	 		Notice notice = new Notice(); 
			notice.setNoticeNo(nno);
			notice.setNoticeTitle(title);
			notice.setNoticeContent(content.replaceAll("\n", "<br>"));
			
			int result = new NoticeService().updateNotice(notice);
		
		if(result > 0) {
			request.getSession().setAttribute("msg", "공지사항이 성공적으로 수정되었습니다.");
			response.sendRedirect("detail.no?nno=" + nno);
			//수정된 내용을 상세페이지에 보여줄려고 nno를 같이 넘긴다. 
			

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
