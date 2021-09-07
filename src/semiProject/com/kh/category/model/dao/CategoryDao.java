package semiProject.com.kh.category.model.dao;

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

import semiProject.com.kh.category.model.vo.Category;
import semiProject.com.kh.theme.dao.ThemeDao;
import semiProject.com.kh.theme.model.vo.Theme;

public class CategoryDao {
	private Properties prop = new Properties();
	public CategoryDao() {
		String fileName = ThemeDao.class.getResource("/semiProject/sql/category/category-query.properties").getPath();
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

	public ArrayList<Category> selectCategoryList(Connection conn) {
		ArrayList<Category> clist = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		//selectCategory=SELECT CATEGORY_NO, CATEGORY_NAME FROM CATEGORY
		String sql = prop.getProperty("selectCategory");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next())
			{
				Category c = new Category();
				
				c.setCategoryNo(rset.getInt("CATEGORY_NO"));
				c.setCategoryName(rset.getString("CATEGORY_NAME"));
				
				clist.add(c);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return clist;
	}

}
