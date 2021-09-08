package semiProject.com.kh.board.model.service;


import static semiProject.com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import semiProject.com.kh.board.model.dao.BoardDao;
import semiProject.com.kh.board.model.vo.Attachment;
import semiProject.com.kh.board.model.vo.Board;
import semiProject.com.kh.board.model.vo.PageInfo;
import semiProject.com.kh.notice.model.dao.NoticeDao;
import semiProject.com.kh.notice.model.vo.Notice;

public class BoardService {
	
	//게시글 개수
	public int getListCount() {
		Connection conn = getConnection();
		
		int listCount = new BoardDao().getListCount(conn);
		close(conn);
		return listCount;
	}

	
	//리스트 반환 
	public ArrayList<Board> selectThList(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectThList(conn, pi);
		close(conn);
		return list;
	}

//	public int insertBoard(Board b, Attachment at) {
//		Connection conn = getConnection();
//		
//		int result1 = new BoardDao().insertBoard(conn, b);
//		int result2 = 1;
//		if(at != null) {
//			result2 = new BoardDao().insertAttachment(conn, at);
//		}
//		
//		if(result1 * result2 > 0) {
//			commit(conn);
//		}else {
//			rollback(conn);
//		}
//		return result1 * result2;
//		
//	}


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

	public int insertThumbnail(Board b, ArrayList<Attachment> fileList) {
		Connection conn = getConnection();
		
		int result1 = new BoardDao().insertThBoard(conn, b);
		int result2 = new BoardDao().insertAttachment(conn, fileList);
		System.out.println("서비스에서 결과"+result1);
		System.out.println("서비스에서 결과"+result2);
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result1* result2;
	}

	//커뮤니티에 올라갈 공지사항 
	public ArrayList<Notice> selectNList() {
		Connection conn = getConnection();
		
		ArrayList<Notice> nlist = new BoardDao().selectNList(conn);
		close(conn);
		System.out.println("서비스에서 보이는지 : " + nlist);
		
		return nlist;
	}


//	public ArrayList<Board> selectThList() {
//		Connection conn = getConnection();
//		
//		ArrayList<Board> list = new BoardDao().selectThList(conn);
//		close(conn);
//		return list;
//	}


	

}
