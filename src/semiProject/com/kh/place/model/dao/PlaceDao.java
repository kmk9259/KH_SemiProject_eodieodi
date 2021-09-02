package semiProject.com.kh.place.model.dao;

import static semiProject.com.kh.common.JDBCTemplate.*;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import semiProject.com.kh.place.model.vo.Place;

public class PlaceDao {
	private Properties prop = new Properties();
	
	public PlaceDao() {
		String fileName = PlaceDao.class.getResource("/sql/place/place-query.properties").getPath();
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
		
		//selectPList=SELECT PLACE_NO, PLACE_TITLE, COUNT, CHANGE_NAME \
//		FROM PLACE JOIN (SELECT * FROM ATTACHMENT \
//				WHERE FILE_NO IN( \
//				SELECT MIN(FILE_NO) FILE_NO FROM ATTACHMENT WHERE STATUS='Y' GROUP BY REF_BNO)) ON (REF_BNO = PLACE_NO) \
//				WHERE PLACE.STATUS='Y' ORDER BY BOARD_NO DESC
		String sql = prop.getProperty("selectPList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next())
			{
				Place place = new Place();
				place.setPlaceNo(rset.getInt("PLACE_NO"));
				place.setPlaceTitle(rset.getString("PLACE_TITLE"));
				place.setCount(rset.getInt("COUNT"));
				place.setPlaceImg(rset.getString("CHANGE_NAME"));
				
				list.add(place);
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
	public int insertPlace(Connection conn, Place p) {
		int result = 0;
		PreparedStatement pstmt = null;
		//insertPlace=INSERT INTO PLACE VALUES(SEQ_PNO.NEXTVAL, AREA_NO, CATEGORY_NO, ?,?,?,?,?,?,DEFAULT,DEFAULT)
		String sql = prop.getProperty("insertPlace");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p.getPlaceTitle());
			pstmt.setString(2, p.getPlacePhone());
			pstmt.setString(3, p.getDescription());
			pstmt.setString(4, p.getBsHour());
			pstmt.setInt(5, p.getPrice());
			pstmt.setString(6, p.getAddress());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int increaseCount(Connection conn, int pno) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = "UPDATE PLACE SET ";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		return result;
	}

	public Place selectPlace(Connection conn, int pno) {
		// TODO Auto-generated method stub
		return null;
}
