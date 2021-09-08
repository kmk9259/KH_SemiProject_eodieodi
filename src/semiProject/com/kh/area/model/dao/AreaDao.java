package semiProject.com.kh.area.model.dao;

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

import semiProject.com.kh.area.model.vo.Area;
import semiProject.com.kh.category.model.vo.Category;
import semiProject.com.kh.theme.dao.ThemeDao;

public class AreaDao {
	private Properties prop = new Properties();
	public AreaDao() {
		String fileName = ThemeDao.class.getResource("/semiProject/sql/area/area-query.properties").getPath();
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

	public ArrayList<Area> selectAreaList(Connection conn) {
		ArrayList<Area> alist = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		//selectArea=SELECT AREA_NO, AREA_NAME FROM AREA
		String sql = prop.getProperty("selectArea");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next())
			{
				Area a = new Area();
				
				a.setAreaNo(rset.getInt("AREA_NO"));
				a.setAreaName(rset.getString("AREA_NAME"));
				
				alist.add(a);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return alist;
	}

}
