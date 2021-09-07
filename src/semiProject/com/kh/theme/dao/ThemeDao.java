package semiProject.com.kh.theme.dao;

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

import semiProject.com.kh.theme.model.vo.Theme;

public class ThemeDao {
	private Properties prop = new Properties();
	public ThemeDao() {
		String fileName = ThemeDao.class.getResource("/semiProject/sql/theme/theme-query.properties").getPath();
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
	
	public ArrayList<Theme> selectThemeList(Connection conn) {
		ArrayList<Theme> tlist = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		//selectTheme=SELECT THEME_NO, THEME_NAME FROM THEME
		String sql = prop.getProperty("selectTheme");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next())
			{
				Theme t = new Theme();
				
				t.setThemeNo(rset.getInt("THEME_NO"));
				t.setThemeName(rset.getString("THEME_NAME"));
				
				tlist.add(t);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return tlist;
	}

}
