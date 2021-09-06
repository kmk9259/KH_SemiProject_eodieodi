package semiProject.com.kh.place.model.dao;

import static semiProject.com.kh.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import semiProject.com.kh.board.model.vo.PlaceAttachment;
import semiProject.com.kh.place.model.vo.Place;

public class PlaceDao {
	private Properties prop = new Properties();

	public PlaceDao() {
		String fileName = PlaceDao.class.getResource("/semiProject/sql/place/place-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//일정 전체 조회
	public ArrayList<Place> selectPList(Connection conn) {
		ArrayList<Place> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		/*
		 * selectPATList=SELECT PLACE_NO,AREA_NO,CATEGORY_NO,
		 * PLACE_TITLE,PLACE_PHONE,DESCRIPTION,BSHOUR,PRICE, ADDRESS,COUNT,PLACE.STATUS,
		 * CHANGE_NAME \ FROM PLACE JOIN (SELECT * FROM PLACE_ATTACHMENT \ WHERE FILE_NO
		 * IN( \ SELECT MIN(FILE_NO) FILE_NO FROM PLACE_ATTACHMENT WHERE STATUS='Y'
		 * GROUP BY REF_PNO)) ON (REF_PNO = PLACE_NO) \ WHERE PLACE.STATUS='Y' ORDER BY
		 * PLACE_NO
		 */

		String sql = prop.getProperty("selectPATList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next())
			{
				Place p = new Place();
				p.setPlaceNo(rset.getInt("PLACE_NO"));
				p.setAreaNo(rset.getInt("AREA_NO"));
				p.setCategoryNo(rset.getInt("CATEGORY_NO"));
				p.setPlaceTitle(rset.getString("PLACE_TITLE"));
				p.setPlacePhone(rset.getString("PLACE_PHONE"));				
				p.setDescription(rset.getString("DESCRIPTION"));
				p.setBsHour(rset.getString("BSHOUR"));
				p.setPrice(rset.getInt("PRICE"));
				p.setAddress(rset.getString("ADDRESS"));			
				p.setCount(rset.getInt("COUNT"));
				p.setStatus(rset.getString("STATUS"));
				p.setTitleImg(rset.getString("CHANGE_NAME"));
				
				list.add(p);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	//일정 등록
	public int insertPlace(Connection conn, Place p) {
		int result = 0;
		PreparedStatement pstmt = null;
		//insertPlace=INSERT INTO PLACE VALUES(SEQ_PNO.NEXTVAL,?,?,?,?,?,?,?,?,DEFAULT,DEFAULT)
		String sql = prop.getProperty("insertPlace");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, p.getAreaNo());
			pstmt.setInt(2, p.getCategoryNo());
			pstmt.setString(3, p.getPlaceTitle());
			pstmt.setString(4, p.getPlacePhone());
			pstmt.setString(5, p.getDescription());
			pstmt.setString(6, p.getBsHour());
			pstmt.setInt(7, p.getPrice());
			pstmt.setString(8, p.getAddress());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

  public PlaceAttachment selectAttachment(Connection conn, int pNo) {
		PlaceAttachment pAttachment = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAttachment");
		//selectAttachment="SELECT FILE_NO, ORIGIN_NAME, CHANGE_NAME FROM PLACE_ATTACHMENT WHERE REF_PNO=? AND STATUS='Y'";
				
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				pAttachment = new PlaceAttachment();
				pAttachment.setFileNo(rset.getInt("FILE_NO"));
				pAttachment.setOriginName(rset.getString("ORIGIN_NAME"));
				pAttachment.setChangeName(rset.getString("CHANGE_NAME"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return pAttachment;
  }
  
	public int increaseCount(Connection conn, int pno) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("increaseCount");
		//increaseCount = "UPDATE PLACE SET COUNT=COUNT+1 WHERE PLACE_NO=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		return result;
	}
	//일정 첨부파일 등록
	public int insertPAttachment(Connection conn, PlaceAttachment pat) {
		int result =0;
		PreparedStatement pstmt = null;
		
		//insertPAttachment=INSERT INTO PLACE_ATTACHMENT VALUES(SEQ_PANO.NEXTVAL, SEQ_PNO.CURRVAL, ?, ?, ?, SYSDATE, DEFAULT) 
		String sql = prop.getProperty("insertPAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pat.getOriginName());
			pstmt.setString(2, pat.getChangeName());
			pstmt.setString(3, pat.getFilePath());	
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}		
		return result;	
	}

	public Place selectPlace(Connection conn, int pno) {  //조회수(COUNT)도 들고와서 화면에 뿌릴까?(09.05)
		Place p = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPlace");
		
		System.out.println("p에 값이 아예 안들어가는거같은데...11111 : " + p);	
		
//		SELECT PLACE_NO, PLACE_TITLE, ADDRESS, BSHOUR, PLACE_PHONE, PRICE, DESCRIPTION, CHANGE_NAME
//		FROM PLACE A JOIN (SELECT * FROM PLACE_ATTACHMENT WHERE STATUS='Y') ON (PLACE_NO = REF_PNO) 
//		WHERE A.STATUS='Y' AND PLACE_NO=?;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pno);
			
			rset = pstmt.executeQuery();
			System.out.println("p에 값이 아예 안들어가는거같은데...222222 : " + p);	
			
			if(rset.next()) {
				p = new Place(rset.getInt("PLACE_NO"),rset.getString("PLACE_TITLE"), rset.getString("PLACE_PHONE"), 
							  rset.getString("DESCRIPTION"), rset.getString("BSHOUR"), rset.getInt("PRICE"), 
							  rset.getString("ADDRESS"), rset.getString("CHANGE_NAME")
							 );
			System.out.println("p에 값이 아예 안들어가는거같은데...33333 : " + p);	
			/*Place(int placeNo, String placeTitle, String placePhone, String description,
			String bsHour, int price, String address, String titleImg)*/
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
	
		return p;
	}
	public int deletePlace(Connection conn, int pno) {
		int result =0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deletePlace");
		//deletePlace=UPDATE PLACE SET STATUS='N' WHERE PLACE_NO=?
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pno);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}		
		return result;
	}
	public int deletePAttachment(Connection conn, int pno) {
		int result =0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deletePAttachment");
		//deletePAttachment=UPDATE PLACE_ATTACHMENT SET STATUS='N' WHERE REF_PNO=?
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			close(pstmt);
		}
		
		return result;
	}
	
	
}
