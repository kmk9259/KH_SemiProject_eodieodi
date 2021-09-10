package semiProject.com.kh.admin.model.dao;

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
import semiProject.com.kh.planMy.model.dao.PlanMyDao;

public class AdminDao {

	private Properties prop = new Properties();

	
	public AdminDao() {
		String fileName = PlanMyDao.class.getResource("/semiProject/sql/adminPlan/adminPlan-query.properties").getPath();
		System.out.println("fileName   " + fileName);
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	}

	public ArrayList<Place> selectPlist(Connection conn) {
		
		ArrayList<Place> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPlaceList");
		//하나의 BOARD에 사진 여러 개 등록했을 경우로 짠 쿼리인데 될 것 같아서 그대로 넣음
//		selectPlaceList=SELECT PLACE_NO, AREA_NO, CATEGORY_NO, PLACE_TITLE, ADDRESS, DESCRIPTION, COUNT, CHANGE_NAME \
//		FROM PLACE JOIN (SELECT * FROM PLACE_ATTACHMENT \
//		WHERE FILE_NO IN( \
//		SELECT MIN(FILE_NO) FILE_NO FROM PLACE_ATTACHMENT WHERE STATUS='Y' GROUP BY REF_PNO)) ON (REF_PNO = PLACE_NO) \
//		WHERE PLACE.STATUS='Y' ORDER BY PLACE_NO DESC
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next())
			{
				Place place = new Place();
				place.setPlaceNo(rset.getInt("PLACE_NO"));
				place.setAreaNo(rset.getInt("AREA_NO"));
				place.setCategoryNo(rset.getInt("CATEGORY_NO"));
				place.setPlaceTitle(rset.getString("PLACE_TITLE"));
				place.setAddress(rset.getString("ADDRESS"));
				place.setDescription(rset.getString("DESCRIPTION"));
				place.setCount(rset.getInt("COUNT"));
				place.setTitleImg(rset.getString("CHANGE_NAME"));
				
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
