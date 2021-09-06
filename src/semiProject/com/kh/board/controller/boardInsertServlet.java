package semiProject.com.kh.board.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
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
import semiProject.com.kh.member.model.vo.Member;

/**
 * Servlet implementation class boardInsertServlet
 */
@WebServlet("/insert.bo")
public class boardInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public boardInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//파일 업로드를 위한 라이브러리 : cos.jar http://www.servlets.com/
	      
	      if(ServletFileUpload.isMultipartContent(request)) { //enctype 이 multipart/form-data로 잘 전송되었으면 true
	         // 1. 전송된 파일들을 처리할 작업 내용 (전송되는 파일의 용량 제한, 전달된 파일을 저장할 폴더 경로)
	               
	               // 1_1. 전송파일 용량 제한 (int maxSize)
	      //               : 10Mbyte로 제한  ([참고] cos.jar로 파일 업로드 시 최대 2기가(1.6)까지만 가능)
	      //                 1Kbyte = 1024byte (킬로바이트)
	      //               1Mbyte = 1024Kbyte = 1024 * 1024 byte (메가바이트)
	      //               1Gbyte = 1024Mbyte = 1024 * 1024 * 1024 Byte (기가바이트)
	      //               10Mbyte = 10 * 1024 * 1024 byte 
	         
	         int maxSize = 10 * 1024 * 1024;  //파일크기 설정
	         
	         //1_2. 전달된 파일을 저장할 서버의 폴더 경로 알아내기
	         String resources = request.getSession().getServletContext().getRealPath("/resources");
	         String savePath = resources + "\\board_upfiles\\";
	         System.out.println("savePAath" + savePath);
	         
	         //MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
	         MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
	         //시스템파일명 -> 올린날짜 시간 들어간다. 중복되지 않게
	         
	         
	         String title = multiRequest.getParameter("title");
	         String content = multiRequest.getParameter("content");
	         
	         int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
	         
	         Board b = new Board();
	         b.setBoardTitle(title);
	         b.setBoardContent(content);
	         b.setBoardWriter(String.valueOf(userNo));
	         
	         Attachment at = null;
	         
	         if(multiRequest.getOriginalFileName("files") != null) {
	            String originName = multiRequest.getOriginalFileName("files");
	            String changeName = multiRequest.getFilesystemName("files");  //시스템파일명
	            
	            at = new Attachment();
	            
	            at.setFilePath(savePath);
	            at.setOriginName(originName);
	            at.setChangeName(changeName);
	            
	            
	         }
	         
	         int result = new BoardService().insertBoard(b, at);
	         
	         
	         if(result > 0) {
	            request.getSession().setAttribute("msg", "게시글등록성공");
	            response.sendRedirect("list.bo");
	         }else {
	            if(at != null) {
	               File failedFile = new File(savePath+ at.getChangeName());
	               failedFile.delete();
	            }
	            
	            request.setAttribute("msg", "게시판 등록 실패");
	            
	            RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
	            view.forward(request, response);
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
