package semiProject.com.kh.place.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import static semiProject.com.kh.common.JDBCTemplate.*;
import semiProject.com.kh.place.model.vo.Place;

public class PlaceDao {

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

}
