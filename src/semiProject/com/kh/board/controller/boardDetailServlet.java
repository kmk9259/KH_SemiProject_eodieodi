package semiProject.com.kh.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semiProject.com.kh.board.model.service.BoardService;
import semiProject.com.kh.board.model.vo.Attachment;
import semiProject.com.kh.board.model.vo.Board;

/**
 * Servlet implementation class boardDetailServlet
 */
@WebServlet("/detail.bo")
public class boardDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public boardDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));
		Board b = new BoardService().selectBoard(bno);
		Attachment at = new BoardService().selectAttachment(bno);
		
		if(b != null) {
			request.setAttribute("b", b);
			request.setAttribute("at", at);
			request.getRequestDispatcher("views/board/boardDetailView.jsp").forward(request, response);
		}else {
		
		request.setAttribute("msg", "게시판 상세조회 실패");
        
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
