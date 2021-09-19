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
 * Servlet implementation class PlaceUpdateServlet
 */
@WebServlet("/update.pl")
public class PlaceUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlaceUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(ServletFileUpload.isMultipartContent(request))
		{
			int maxSize = 10 * 1024 * 1024;
			
			String resources = request.getSession().getServletContext().getRealPath("/resources");
			String savePath = resources + "\\place_upFiles\\";
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			int pNo = Integer.parseInt(multiRequest.getParameter("pNo"));
		
			Place p = new Place();
			p.setPlaceNo(pNo);
			p.setAreaNo(Integer.parseInt(multiRequest.getParameter("areaNo")));
			p.setCategoryNo(Integer.parseInt(multiRequest.getParameter("categoryNo")));
			p.setPlaceTitle(multiRequest.getParameter("placeTitle"));
			p.setPlacePhone(multiRequest.getParameter("placePhone"));
			p.setDescription(multiRequest.getParameter("description"));
			p.setBsHour(multiRequest.getParameter("bsHour"));
			p.setPrice(Integer.parseInt(multiRequest.getParameter("price")));
			p.setAddress(multiRequest.getParameter("address"));
			p.setTitleImg(multiRequest.getParameter("titleImg"));
			
			PlaceAttachment pa = null;
			
			if(multiRequest.getOriginalFileName("upFile") != null)
			{
				//값 있으면 새로운 파일 선택한거고 없으면 선택 안함
				pa = new PlaceAttachment();
				pa.setOriginName(multiRequest.getOriginalFileName("upFile"));
				pa.setChangeName(multiRequest.getFilesystemName("upFile"));
				pa.setFilePath(savePath);
				
				if(multiRequest.getParameter("originFile") != null)//기존파일이 있으면
				{
					File deleteFile = new File(savePath+multiRequest.getParameter("originFile"));
					deleteFile.delete();
					
					pa.setFileNo(Integer.parseInt(multiRequest.getParameter("originFileNo")));
					
				}else//기존에 파일이 없었다가 update 하면 파일이 추가된것
				{
					pa.setRefBoardNo(pNo);
				}
			}
			
			int result = new PlaceService().updatePlace(p,pa);
			
			if(result >0)
			{
				response.sendRedirect("list.pl");
			}
			else
			{
				request.setAttribute("msg", "일정 수정에 실패하였습니다.");
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
