package semiProject.com.kh.board.model.service;


import static semiProject.com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import semiProject.com.kh.board.model.dao.BoardDao;
import semiProject.com.kh.board.model.vo.Attachment;
import semiProject.com.kh.board.model.vo.Board;
import semiProject.com.kh.board.model.vo.PageInfo;

public class BoardService {
	
	public int getListCount() {
		Connection conn = getConnection();
		
		int listCount = new BoardDao().getListCount(conn);
		close(conn);
		return listCount;
	}

	public ArrayList<Board> selectList(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectList(conn, pi);
		close(conn);
		return list;
	}

	public int insertBoard(Board b, Attachment at) {
		Connection conn = getConnection();
		
		int result1 = new BoardDao().insertBoard(conn, b);
		int result2 = 1;
		if(at != null) {
			result2 = new BoardDao().insertAttachment(conn, at);
		}
		
		if(result1 * result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result1 * result2;
	}


	public Board selectBoard(int bno) {
		Connection conn = getConnection();
		
		int result = new BoardDao().increaseCount(conn,bno);
		
		Board b = null;
		if(result > 0) {
			commit(conn);
			b = new BoardDao().selectBoard(conn, bno);
		}else {
			rollback(conn);
		}
		return b;
		
	}

	public Attachment selectAttachment(int bno) {
		Connection conn = getConnection();
		
		Attachment at = new BoardDao().selectAttachment(conn, bno);
		close(conn);
		return at;
	}
	

}
