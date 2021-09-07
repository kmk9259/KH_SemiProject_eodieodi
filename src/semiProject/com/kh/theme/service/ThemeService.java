package semiProject.com.kh.theme.service;

import static semiProject.com.kh.common.JDBCTemplate.close;
import static semiProject.com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import semiProject.com.kh.theme.dao.ThemeDao;
import semiProject.com.kh.theme.model.vo.Theme;

public class ThemeService {

	public ArrayList<Theme> selectThemeList() {
		Connection conn = getConnection();
		ArrayList<Theme> tlist = new ThemeDao().selectThemeList(conn);
		close(conn);
		return tlist;
	}

}
