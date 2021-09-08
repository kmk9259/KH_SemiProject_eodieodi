package semiProject.com.kh.notice.model.service;


import static semiProject.com.kh.common.JDBCTemplate.close;
import static semiProject.com.kh.common.JDBCTemplate.commit;
import static semiProject.com.kh.common.JDBCTemplate.getConnection;
import static semiProject.com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import semiProject.com.kh.notice.model.dao.NoticeDao;
import semiProject.com.kh.notice.model.vo.Notice;

public class NoticeService {

	//리스트 목록보기 
	public ArrayList<Notice> selectList() {

		Connection conn = getConnection();
		
		ArrayList<Notice> list = new NoticeDao().selectList(conn);
		close(conn);
		
		
		return list;
	}

	public int insertNotice(Notice n) {


		Connection conn = getConnection();
		
		int result = new NoticeDao().insertNotice(conn, n);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);

		return result;
	}

	//게시글 조회하기 
	public Notice selelctNotice(int nno) {
		
		//연결한 후에 

		Connection conn = getConnection();		
		
		
		int result = new NoticeDao().increaseCount(conn,nno);// 조회수 올라가는거 
		
		Notice n = null;
		
		if(result > 0) {
			commit(conn); // 성공적으로 조회수를 올리면 조회를 해준다 
			n = new NoticeDao().selectNotice(conn,nno);
			
		}else {
			//아닌경우 롤백하고 
			rollback(conn);
		}
		close(conn); //닫아주고 
		
		//System.out.println(n + "여기는 서비슨데 연결은 잘 되고 있는건가? ");
		return n; // 담은 것 리턴 
	}

	
	//조회 게시글 수정..? 으로 가는..? 
	public Notice selectUpdateNotice(int nno) {

		Connection conn = getConnection();		

		Notice n = new NoticeDao().selectNotice(conn, nno);
		close(conn);
		
		return n;
	}
 
	//게시글 수정하기 
	public int updateNotice(Notice notice) {

		Connection conn = getConnection();		

		int result = new NoticeDao().updateNotice(conn, notice);

		if (result > 0) {
			commit(conn);

		} else {
			rollback(conn);

		}
		close(conn);
		return result;
	}

	//게시글 삭제하기 
	public int deleteNotice(int nno) {
		Connection conn = getConnection();

		int result = new NoticeDao().deleteNotice(conn, nno);

		if (result > 0) {
			commit(conn);

		} else {
			rollback(conn);
		}

		close(conn);
		
		return result;
	}

}
