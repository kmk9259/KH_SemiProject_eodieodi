package semiProject.com.kh.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

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
		         
		         
		         MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
		         
		         //보드 넘버로 안에 담긴 내용이 불러와 진다. 
		         int bno = Integer.parseInt(multiRequest.getParameter("bno"));
		        
		         
		         Board b = new Board();
		         
		         b.setBoardContent(multiRequest.getParameter("content"));
		         b.setBoardTitle(multiRequest.getParameter("title"));
		         b.setBoardNo(bno);
		         
		        
		         //사진들을 어레이 리스트로 받아서 
		         ArrayList<Attachment> fileList = new ArrayList<>();
		         
		        
		         for(int i = 1; i<= 4; i++) {
		         
		         if(multiRequest.getOriginalFileName("upFile"+ i) != null) { //새 파일이 생기면 
		        	 
		        	 Attachment at = new Attachment();
		        	 
		        	 at.setOriginName(multiRequest.getOriginalFileName("upFile" + i));
		        	 at.setChangeName(multiRequest.getFilesystemName("upFile" + i));
		        	 at.setFilePath(savePath);
		        	 
		        	 fileList.add(at);
		        	 
		        	 if(multiRequest.getParameter("originFile" + i) != null) {
		        		 File deleteFile = new File(savePath + multiRequest.getParameter("originFile" +i));
		        		 
		        		 deleteFile.delete();
		        		 
		        		 at.setFileNo(Integer.parseInt(multiRequest.getParameter("originFileNo" + i)));
		        	 }else {
		        		 at.setRefBoardNo(bno); // 새 파일이 들어오면 넣어준다. 보드 번호에 맞게 (bno)
		        	 }
		        	 
		         }

		         }
		         

		        
		        	 int result = new BoardService().updateBoard(b, fileList);
		         

		         
		         System.out.println("서비스,다오에 보낼 파일들이 있는데?  " + fileList);
		         
		         if(result > 0 ) {
		        	 request.getSession().setAttribute("msg", "게시글이 수정되었습니다.");
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
