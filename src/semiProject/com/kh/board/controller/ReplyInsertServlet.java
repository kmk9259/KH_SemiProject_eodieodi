package semiProject.com.kh.board.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semiProject.com.kh.board.model.service.BoardService;
import semiProject.com.kh.board.model.vo.Reply;
import semiProject.com.kh.member.model.vo.Member;

/**
 * Servlet implementation class ReplyInsertServlet
 */
@WebServlet("/rInsert.bo")
public class ReplyInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReplyInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String content = request.getParameter("content");
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		int writer = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		
		Reply r = new Reply();
		r.setReplyContent(content.replaceAll("\n", "<br>"));
		r.setRefBoardId(bno);
		r.setReplyWriter(String.valueOf(writer));
		
		int result = new BoardService().insertReply(r);
		
		//Prints formatted representations of objects to a text-output stream. 
		//Thisclass implements all of the print methods 
		//found in PrintStream. 
		//It does not contain methods for writing raw bytes, 
		//for whicha program should use unencoded byte streams.
		PrintWriter out = response.getWriter();
		if(result > 0 ) {
			out.print("success");
		}else {
			out.print("fail");
		}
		
		out.flush();
		out.close();
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
