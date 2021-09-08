package semiProject.com.kh.area.model.service;

import static semiProject.com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import semiProject.com.kh.area.model.dao.AreaDao;
import semiProject.com.kh.area.model.vo.Area;

public class AreaService {

	public ArrayList<Area> selectAreaList() {
		Connection conn = getConnection();
		ArrayList<Area> alist = new AreaDao().selectAreaList(conn);
		close(conn);
		return alist;
	}

}
