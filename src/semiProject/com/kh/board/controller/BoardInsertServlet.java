package semiProject.com.kh.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

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
 * Servlet implementation class BoardInsertServlet
 */
@WebServlet("/insert.bo")
public class BoardInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardInsertServlet() {
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
	         
	         int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
	         
	         Board b = new Board();
	         
	         b.setBoardTitle(multiRequest.getParameter("title"));
	         b.setBoardContent(multiRequest.getParameter("content"));
	        // b.setBoardWriter(multiRequest.getParameter("writer"));
	         b.setBoardWriter(String.valueOf(userNo));
	         
	         
	         request.setAttribute("b", b);
	         
	         ArrayList<Attachment> fileList = new ArrayList<>();
	         
	         request.setAttribute("fileList", fileList);
	         
	         for(int i = 1; i <=4; i++) {
	        	 
	        	 String name  = "file" + i;
	        	 if(multiRequest.getOriginalFileName(name) != null) {
	        		 
	        		 String originName = multiRequest.getOriginalFileName(name);
	        		 String changeName = multiRequest.getFilesystemName(name);
	        		 
	        		 Attachment at = new Attachment();
	        		 
	        		 at.setFilePath(savePath);
	        		 at.setChangeName(changeName);
	        		 at.setOriginName(originName);
	        		 
	        		 fileList.add(at);
	        		 
	        		 System.out.println("fileList 객체 안에 : "+ fileList);
	        		 
	        	 }
	         }
	         
	         int result = new BoardService().insertThumbnail(b, fileList);
	        
	  
	         if(result > 0) {
	        	 
	        	 response.sendRedirect("list.bo");
	        	 
	         }else {
	        	 for(int i=0; i<fileList.size(); i++) {
	        		 File failedFile = new File(savePath + fileList.get(i).getChangeName());
	        		 failedFile.delete();
	        	 }
	        	 
	        	 request.setAttribute("msg", "사진 등록실패하였습니다.");
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
