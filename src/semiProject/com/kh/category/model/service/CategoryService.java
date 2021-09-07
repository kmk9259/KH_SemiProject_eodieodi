package semiProject.com.kh.category.model.service;

import static semiProject.com.kh.common.JDBCTemplate.close;
import static semiProject.com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import semiProject.com.kh.category.model.dao.CategoryDao;
import semiProject.com.kh.category.model.vo.Category;

public class CategoryService {

	public ArrayList<Category> selectCategoryList() {
		Connection conn = getConnection();
		ArrayList<Category> tlist = new CategoryDao().selectCategoryList(conn);
		close(conn);
		return tlist;
	}

}
