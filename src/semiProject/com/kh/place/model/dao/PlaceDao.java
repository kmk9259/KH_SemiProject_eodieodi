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
		
		//String sql = prop.getProperty("selectAttachment");
		String sql = "SELECT FILE_NO, ORIGIN_NAME, CHANGE_NAME FROM PLACE_ATTACHMENT WHERE REF_PNO=? AND STATUS='Y'";
				
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(pNo, pNo);
			
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
		
		//String sql = prop.getProperty("increaseCount");
		String sql = "UPDATE PLACE SET COUNT=COUNT+1 WHERE PLACE_NO=?";
		
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

	public Place selectPlace(Connection conn, int pno) {
		// TODO Auto-generated method stub
		return null;
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
