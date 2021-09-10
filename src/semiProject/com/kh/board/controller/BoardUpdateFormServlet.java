package semiProject.com.kh.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semiProject.com.kh.board.model.service.BoardService;
import semiProject.com.kh.board.model.vo.Attachment;
import semiProject.com.kh.board.model.vo.Board;

/**
 * Servlet implementation class BoardUpdateFormServlet
 */
@WebServlet("/updateForm.bo")
public class BoardUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		//보드 번호로 받아서 
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		//보드 번호로 찾아줘야한다.
		Board b = new BoardService().selectUpdateBoard(bno);
		
		//업데이트 폼에 데려갈 파일들 
		ArrayList<Attachment> fileList = new BoardService().selectAttachment(bno);
		
		if(b != null) {
			request.setAttribute("b", b);
			request.setAttribute("fileList", fileList);
			request.getRequestDispatcher("views/board/boardUpdateForm.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "업데이트 실패하였습니다.");
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
