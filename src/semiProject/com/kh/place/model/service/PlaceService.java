package semiProject.com.kh.place.model.service;

import static semiProject.com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import semiProject.com.kh.board.model.vo.Attachment;
import semiProject.com.kh.place.model.dao.PlaceDao;
import semiProject.com.kh.place.model.vo.Place;

public class PlaceService {

	public ArrayList<Place> selectPList() {
		Connection conn = getConnection();
		ArrayList<Place> list = new PlaceDao().selectPList(conn);
		
		close(conn);
		return list;
	}

	public int insertPlace(Place p, Attachment at) {
		Connection conn = getConnection();
		int result = new PlaceDao().insertPlace(conn, p);
		
		if(result >0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}

}
