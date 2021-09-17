package semiProject.com.kh.place.model.service;

import static semiProject.com.kh.common.JDBCTemplate.close;
import static semiProject.com.kh.common.JDBCTemplate.commit;
import static semiProject.com.kh.common.JDBCTemplate.getConnection;
import static semiProject.com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import semiProject.com.kh.board.model.vo.PlaceAttachment;
import semiProject.com.kh.place.model.dao.PlaceDao;
import semiProject.com.kh.place.model.vo.Place;

public class PlaceService {

	public ArrayList<Place> selectPList() {
		Connection conn = getConnection();
		ArrayList<Place> list = new PlaceDao().selectPList(conn);
		
		close(conn);
		return list;
	}

	public int insertPlace(Place p, PlaceAttachment pat) {
		Connection conn = getConnection();
		int result1 = new PlaceDao().insertPlace(conn, p);
		int result2 = new PlaceDao().insertPAttachment(conn, pat);
		
		if(result1 > 0 && result2>0)
		{
			commit(conn);
		}
		else {
			rollback(conn);
		}
		close(conn);
		return result1 * result2;
	}

  public Place selectPlace(int pno) {
		Connection conn = getConnection();
		
		int result = new PlaceDao().increaseCount(conn, pno);
		System.out.println("increaseCount 결과 : " + result);
		Place p = null;
		
		if(result > 0) {
			commit(conn);
			p = new PlaceDao().selectPlace(conn, pno);
			System.out.println("여기 도는 것 같은데 왜 null 뜨냐___p : " + p);
		}else {
			rollback(conn);
		}
		
		return p;
  }

  	public PlaceAttachment selectAttachment(int pNo) {
		Connection conn = getConnection();
		PlaceAttachment pAttchment = new PlaceDao().selectAttachment(conn, pNo);
		close(conn);
		return pAttchment;
	}
  

	public int deletePlace(int pNo) {
		Connection conn = getConnection();
		
		int result1 = new PlaceDao().deletePlace(conn, pNo);
		int result2 = new PlaceDao().deletePAttachment(conn, pNo);
		
		if(result1 >0 )
		{
			commit(conn);
		}
		else
			rollback(conn);
		close(conn);
		return result1;
	}

	public ArrayList<Place> selectPList2(int aNo) {
		Connection conn = getConnection();
		ArrayList<Place> list = new PlaceDao().selectPList2(conn, aNo);
		
		close(conn);
		return list;
	}

	public ArrayList<Place> searchArea(String searchArea) {
		Connection conn = getConnection();
		ArrayList<Place> list = new PlaceDao().searchArea(conn, searchArea);
		
		System.out.println("민경씨 서비스 결과 함 보려고  " + list);
		close(conn);
		return list;
	}

	public ArrayList<Place> selectTopList() {
		Connection conn = getConnection();
		
		ArrayList<Place> list = new PlaceDao().selectTopList(conn);
		close(conn);
		return list;
	}

	public Place selectUpdatePlace(int pNo) {
		Connection conn = getConnection();
		
		Place p = new PlaceDao().selectPlace(conn, pNo);
		
		close(conn);
		return p;
	}

	public int updatePlace(Place p, PlaceAttachment pa) {
		Connection conn = getConnection();
		
		int result1 = new PlaceDao().updatePlace(conn,p);
		int result2 = 1;
		
		if(pa!= null)
		{
			if(pa.getFileNo() != 0)
			{
				result2 = new PlaceDao().updateAttachment(conn, pa);
			}
			else {
				result2 = new PlaceDao().insertNewAttachment(conn, pa);
			}
		}
		if(result1 > 0 && result2 >0)
		{
			commit(conn);
		}
		else {
			rollback(conn);
		}
		close(conn);
		return result1*result2;
	}


	
}
