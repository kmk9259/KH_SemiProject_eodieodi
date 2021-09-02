package semiProject.com.kh.planMy.model.dao;

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

import semiProject.com.kh.place.model.vo.Place;

public class PlanMyDao {
	
	private Properties prop = new Properties();

	public PlanMyDao() {
		String fileName = PlanMyDao.class.getResource("/semiProject/sql/planMy/plan-query.properties").getPath();
		System.out.println("fileName   " + fileName);
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

	public ArrayList<Place> selectList(Connection conn) {
		ArrayList<Place> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		//selectPList=SELECT PLACE_NO, PLACE_TITLE, ADDRESS, COUNT, CHANGE_NAME \
//		FROM PLACE JOIN (SELECT * FROM PLACE_ATTACHMENT \
//				WHERE FILE_NO IN( \
//				SELECT MIN(FILE_NO) FILE_NO FROM ATTACHMENT WHERE STATUS='Y' GROUP BY REF_BNO)) ON (REF_BNO = PLACE_NO) \
//				WHERE PLACE.STATUS='Y' ORDER BY BOARD_NO DESC
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next())
			{
				Place place = new Place();
				place.setPlaceNo(rset.getInt("PLACE_NO"));
				place.setPlaceTitle(rset.getString("PLACE_TITLE"));
				place.setPlaceAddress(rset.getString("ADDRESS"));
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

}
