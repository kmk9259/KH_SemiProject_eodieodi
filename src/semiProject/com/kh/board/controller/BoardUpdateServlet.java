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
		         
		        
		         //사진들을 리스트로 받아서 
		         ArrayList<Attachment> fileList = new ArrayList<>();
		         
		        
		         
		         // for문을 돌면서 무언가 잘 못되고 있다. .. 
		         for(int i = 0; i<= 3; i++)
	        	 {
		         
			         if(multiRequest.getParameter("originFile"+i) != multiRequest.getOriginalFileName("upFile" + i)) // 새 파일이 들어온다. 
			        	 System.out.println( "====++====+++=====업파일에 값을 담을려명? "+ multiRequest.getOriginalFileName("upFile"+i));
			        
			         { 

		        	 //담는 과정이 잘못된거? 
		        		 
		        		 Attachment at = new Attachment();
			        	 
			        	 at.setOriginName(multiRequest.getOriginalFileName("upFile"+i));
			        	 at.setChangeName(multiRequest.getFilesystemName("upFile"+i));
			        	// at.setFileNo(Integer.parseInt(multiRequest.getParameter("fno")));
			        	 at.setFilePath(savePath);
			        	 
			        	 fileList.add(at);
			        	 
			        	 //이미 여기서 부터 파일 번호는 모두 12번만 가져오고 있으면 안된다. 
			        	 System.out.println("서블릿에서 어떤 파일이 잡히고 있나? " + fileList);
		        		 
		        	 
		        	  System.out.println("==============originFile=============="+ multiRequest.getParameter("originFile" +i));
		        	  System.out.println("==============upFile=============="+ multiRequest.getParameter("upFile" +i));
		        	 
		        	  
			        	 if(multiRequest.getParameter("originFile" +i) != multiRequest.getOriginalFileName("upFile" +i)  ) // 기존에 파일 있다면 지우고 다시  
			        	 {
			        		 File deleteFile = new File(savePath + multiRequest.getParameter("originFile"+i));
			        		 
			        		 System.out.println("originFile 서블릿에서 어떤 파일이 잡히고 있나? " + deleteFile);
			        		 
			        		 deleteFile.delete();
			        		 
			        		 fileList.get(i).setFileNo(Integer.parseInt(multiRequest.getParameter("originFileNo")));
			        		 
			        	 }
			        	 else
			        	 {
			        		 fileList.get(i).setRefBoardNo(bno); // 새 파일이 들어오면 넣어준다. 보드 번호에 맞게 (bno)
			        	 }
			        	 
	    
			        	 }
		        	 
		        	 
		       
		         	
		         }
		         
		         //위에 로직돌고 가져와야 하는 거 아님? 
		         //왜 여기에 파일 번호 12번으로 모두 들어오는 것일까? 
		         int result = new BoardService().updateBoard(b, fileList);
		         System.out.println("서비스,다오에 보낼 파일들이 있는데?  " + fileList);
		         
		         if(result > 0) {
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
