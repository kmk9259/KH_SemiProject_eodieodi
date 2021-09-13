package semiProject.com.kh.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import semiProject.com.kh.board.model.service.BoardService;
import semiProject.com.kh.board.model.vo.Reply;

/**
 * Servlet implementation class ReplyListSerjvlet
 */
@WebServlet("/rList.bo")
public class ReplyListSerjvlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReplyListSerjvlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		ArrayList<Reply> list = new BoardService().selectRList(bno);
		
		response.setContentType("application/json; charset=utf-8");
		//new Gson().toJson(list, response.getWriter());
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy년MM월dd일").create();
		gson.toJson(list, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
