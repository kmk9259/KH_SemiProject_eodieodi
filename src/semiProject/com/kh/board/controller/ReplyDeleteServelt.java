package semiProject.com.kh.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semiProject.com.kh.board.model.service.BoardService;

/**
 * Servlet implementation class ReplyDeleteServelt
 */
@WebServlet("/deleteComment.bo")
public class ReplyDeleteServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReplyDeleteServelt() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String reply = request.getParameter("rno");
		
		if( reply != null) {
			
			int rno = Integer.parseInt(request.getParameter("rno"));
			
			int result = new BoardService().deleteReply(rno);
			
			if(result > 0) {
				response.sendRedirect("rList.bo");
			}else {
				request.setAttribute("msg", "댓글 삭제에 실패하였습니다.");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
	            
			}
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
