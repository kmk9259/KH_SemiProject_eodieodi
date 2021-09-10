package semiProject.com.kh.board.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import semiProject.com.kh.board.model.service.BoardService;
import semiProject.com.kh.board.model.vo.Attachment;
import semiProject.com.kh.board.model.vo.Board;
import semiProject.com.kh.common.MyFileRenamePolicy;

/**
 * Servlet implementation class BoardUpdateServlet
 */
@WebServlet("/update.bo")
public class BoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			     int maxSize = 10 * 1024 * 1024;  //파일크기 설정
		         
		         //1_2. 전달된 파일을 저장할 서버의 폴더 경로 알아내기
		         String resources = request.getSession().getServletContext().getRealPath("/resources");
		         String savePath = resources + "\\board_upFiles\\";
		         System.out.println("savePAath" + savePath);
		         
		         //MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		         MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
		         
		         int bno = Integer.parseInt(multiRequest.getParameter("bno"));
		         
		         Board b = new Board();
		         
		         b.setBoardContent(multiRequest.getParameter("content"));
		         b.setBoardTitle(multiRequest.getParameter("title"));
		         b.setBoardNo(bno);
		         
		         Attachment at = null;
		         
		         
		         if(multiRequest.getOriginalFileName("file1") != null) { //새 파일이 생기면 
		        	 
		        	 at = new Attachment();
		        	 
		        	 at.setOriginName(multiRequest.getOriginalFileName("file1"));
		        	 at.setChangeName(multiRequest.getFilesystemName("file1"));
		        	 at.setFilePath(savePath);
		        	 
		        	 if(multiRequest.getParameter("originFile") != null) {
		        		 File deleteFile = new File(savePath + multiRequest.getParameter("originFile"));
		        		 
		        		 deleteFile.delete();
		        		 
		        		 at.setFileNo(Integer.parseInt(multiRequest.getParameter("originFileNo")));
		        	 }else {
		        		 at.setRefBoardNo(bno); // 새 파일이 들어오면 넣어준다. 보드 번호에 맞게 (bno)
		        	 }
		        	 
		         }
		         
		         int result = new BoardService().updateBoard(b, at);
		         
		         if(result > 0) {
		        	 
		        	 response.sendRedirect("detail.bo?bno="+bno);
		         }else {
		        	 request.setAttribute("msg", "업데이트 실패하였습니다.");
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
