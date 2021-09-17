package semiProject.com.kh.board.model.service;


import static semiProject.com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import semiProject.com.kh.board.model.dao.BoardDao;
import semiProject.com.kh.board.model.vo.Attachment;
import semiProject.com.kh.board.model.vo.Board;
import semiProject.com.kh.board.model.vo.PageInfo;
import semiProject.com.kh.board.model.vo.Reply;
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



	public int insertThumbnail(Board b, ArrayList<Attachment> fileList) {
		Connection conn = getConnection();
		
		int result1 = new BoardDao().insertThBoard(conn, b);
		int result2 = new BoardDao().insertAttachment(conn, fileList);
		
	
		
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
		
		
		return nlist;
	}


	public ArrayList<Attachment> selectThumbnail(int bId) {
		Connection conn = getConnection();
		
		ArrayList<Attachment> list = new BoardDao().selectThumbnail(conn, bId);
		close(conn);
		return list;
	}

//게시판 업데이트 부분  ==================
	public Board selectUpdateBoard(int bno) {
		Connection conn = getConnection();
		Board b = new BoardDao().selectBoard(conn, bno);
		close(conn);
		
		return b;
	}

//게시판 사진 업데이트 하기 위헤 폼에
	public ArrayList<Attachment> selectAttachment(int bno) {
		Connection conn = getConnection();
		
		ArrayList<Attachment> files = new BoardDao().selectAttachment(conn, bno);
		close(conn);
		return files;
		
	}

//업데이트를 실행한 후 메소드 
	public int updateBoard(Board b, ArrayList<Attachment> fileList, int bno) {
		
		Connection conn = getConnection();
		
		int result1 = new BoardDao().updateThBoard(conn, b);
		int result2 =1;
		
		//여기서 파일번호가 모두 이미 12번으로 가져와 지고 있다는 것은!! 서블릿에서넘기는 파일 넘버가 그러한 것이다. 
		System.out.println("서비스에 어테치먼트 들고 못오니? "+fileList);
		
		if(fileList != null) { // 값이 있으면 
			
			for(int i = 0; i<fileList.size(); i++) //리스트 사이즈 만큼 돌아~~ 
				
			{
			
					if(fileList.get(i).getFileNo() != 0) { //기존파일있어 비교해 업데이트 
						
						//여러개 가져와야 하는거 아니니? 
						System.out.println("파일넘버 가져오니? 왜 마지막 파일 넘버일까?  " + fileList.get(i).getFileNo());
						
						result2 = new BoardDao().updateAttachment(conn, fileList);
						
					}else { // 없었다면 새로 넣어 업데이트 하면되지
						result2 = new BoardDao().insertNewAttachment(conn, fileList, bno);
					}
			
			}
		}
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result1* result2;
	}


	public int deleteBoard(int bno) {

		Connection conn = getConnection();
		
		int result1 = new BoardDao().deleteBoard(conn, bno);
		int result2 = new BoardDao().deleteAttachment(conn, bno);

		if(result1 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result1;
	}


	public int insertReply(Reply r) {
		Connection conn = getConnection();
		
		int result = new BoardDao().insertReply(conn, r);
		
		if(result > 0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}


	public ArrayList<Reply> selectRList(int bno) {
		
	
		
		
		Connection conn = getConnection();
		
//		int result = new BoardDao().increaseReplyCount(conn, rno);
//		
//		ArrayList<Reply> list = null;
//		
//		if(result > 0) {
//			commit(conn);
//			list = new BoardDao().selectRList(conn, bno);
//		}else {
//			rollback(conn);
//		}
//		
//		return list;
		
		ArrayList<Reply> list = new BoardDao().selectRList(conn, bno);
		close(conn);
		return list;
	}





	public Reply selectReply(int rno) {
		Connection conn = getConnection();
		
		int result = new BoardDao().increaseReplyCount(conn, rno);
		
		//리턴을 빈값으로 해줘도 되나? 카운트만 올리려구
		Reply r = null;
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return r;
	}


	public ArrayList<Board> selectTopList() {
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectTopList(conn);
		System.out.println("toplist at service : " + list);
		close(conn);
		return list;
	}

//파일 지우기 메소드
	public int deleteFile(int originFileNo) {
		Connection conn = getConnection();
		int result = new BoardDao().deleteFile(conn, originFileNo);
		
		if(result > 0) {
			commit(conn);
			
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}




	




	

}
