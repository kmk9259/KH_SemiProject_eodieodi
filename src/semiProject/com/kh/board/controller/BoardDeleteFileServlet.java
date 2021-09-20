package semiProject.com.kh.board.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import semiProject.com.kh.board.model.service.BoardService;
import semiProject.com.kh.common.MyFileRenamePolicy;

/**
 * Servlet implementation class BoardDeleteFileServlet
 */
@WebServlet("/deleteFile.bo")
public class BoardDeleteFileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDeleteFileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//int bno = Integer.parseInt(request.getParameter("bno"));
		
		
		int maxSize = 10 * 1024 * 1024;  //파일크기 설정
        
        //1_2. 전달된 파일을 저장할 서버의 폴더 경로 알아내기
        String resources = request.getSession().getServletContext().getRealPath("/resources");
        String savePath = resources + "\\board_upFiles\\";
        System.out.println("savePAath" + savePath);
        
        
        MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
		
//		String removeFile1 = request.getParameter("file1");
//		String removeFile2 = request.getParameter("file2");
//		String removeFile3 = request.getParameter("file3");
//		String removeFile4 = request.getParameter("file4");
//		
		//int originFileNo1 = Integer.parseInt(request.getParameter("originFileNo1"));
		
		//ArrayList<Attachment> fileList = new ArrayList<>();
		
		
		
		for(int i=1; i <5; i++)
		{
			String originFileNo = request.getParameter("originFileNo"+i);
			
		
		
				if(originFileNo+i != null) {
					int fileno = Integer.parseInt(request.getParameter("originFileNo" + i));
					
					File deleteFile = new File(savePath + multiRequest.getParameter("originFile" +i));
		   		    deleteFile.delete();
					int result = new BoardService().deleteFile(fileno);
					
					System.out.println("++++++++++++++++딜리트 서블릿까지 오긴 하나? 오지 못하니? "+ result);
					
					if(result > 0) 
					 {
						 //파일 삭제되면 그대로 수정 페이지 보여 주어야
					 response.sendRedirect("updateForm.bo"); 
					
					 }else
					 {
					 request.setAttribute("msg", "파일 삭제에 실패하였습니다.");
					 request.getRequestDispatcher("views/common/errorPage.jsp").forward(request,response); 
					 }
				}
		
		
		}
		
	
	
    	// 파일 모두 돌면서 뭐가 비워지는지 알려면 모두 확인 
			
			//파일이 지워지면 (어느것중 하나라도 지워지면 파일번호를 지워지게)
	/*		if(multiRequest.getOriginalFileName("originFile1") == null ||
			   multiRequest.getOriginalFileName("originFile2") == null ||
			   multiRequest.getOriginalFileName("originFile3") == null ||
			   multiRequest.getOriginalFileName("originFile4") == null 
					
					)
			{
				//파일번호를 담아서 그번호를 삭제하면되지 않나? 
				int result = new BoardService().deleteFile(originFileNo);
				
				if(result > 0) 
				 {
					 //파일 삭제되면 그대로 수정 페이지 보여 주어야
				 response.sendRedirect("updateForm.bo"); 
				
				 }else
				 {
				 request.setAttribute("msg", "파일 삭제에 실패하였습니다.");
				 request.getRequestDispatcher("views/common/errorPage.jsp").forward(request,response); 
				 }
			}
			
		
		*/
		
		
		
		 
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
