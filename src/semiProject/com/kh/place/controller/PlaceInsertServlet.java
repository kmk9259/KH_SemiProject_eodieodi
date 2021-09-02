package semiProject.com.kh.place.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import semiProject.com.kh.board.model.vo.PlaceAttachment;
import semiProject.com.kh.common.MyFileRenamePolicy;
import semiProject.com.kh.place.model.service.PlaceService;
import semiProject.com.kh.place.model.vo.Place;

/**
 * Servlet implementation class PlaceInsertServlet
 */
@WebServlet("/insert.pl")
public class PlaceInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlaceInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
				
		if(ServletFileUpload.isMultipartContent(request))
		{
			int maxSize = 10 * 1024 * 1024;
			String resources = request.getSession().getServletContext().getRealPath("/resources");
			String savePath = resources + "\\place_upFiles\\";
			System.out.println("savePath "+savePath);
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			System.out.println(multiRequest);
			Place p = new Place();
			p.setAreaNo(Integer.parseInt(multiRequest.getParameter("areaNo")));
			p.setCategoryNo(Integer.parseInt(multiRequest.getParameter("categoryNo")));
			p.setPlaceTitle(multiRequest.getParameter("placeTitle"));
			p.setPlacePhone(multiRequest.getParameter("placePhone"));
			p.setDescription(multiRequest.getParameter("description"));
			p.setBsHour(multiRequest.getParameter("bsHour"));
			p.setPrice(Integer.parseInt(multiRequest.getParameter("price")));
			p.setAddress(multiRequest.getParameter("address"));

			PlaceAttachment pat = new PlaceAttachment();
			String name = "file01";
			if(multiRequest.getOriginalFileName(name) != null)
			{
				String originName = multiRequest.getOriginalFileName(name);
				String changeName = multiRequest.getFilesystemName(name);
				
				
				pat.setFilePath(savePath);
				pat.setChangeName(changeName);
				pat.setOriginName(originName);			
			}
			int result = new PlaceService().insertPlace(p, pat);
			
			if(result > 0)
			{
//				response.sendRedirect("list.pl");
				request.setAttribute("msg", "일정 등록에 성공하였습니다.");
			}
				
			else
			{
				File failedFile = new File(savePath+pat.getChangeName());
				failedFile.delete();
				request.setAttribute("msg", "일정 등록에 실패하였습니다.");
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
