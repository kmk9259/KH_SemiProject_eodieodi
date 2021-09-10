package semiProject.com.kh.member.model.service;

import static semiProject.com.kh.common.JDBCTemplate.close;
import static semiProject.com.kh.common.JDBCTemplate.commit;
import static semiProject.com.kh.common.JDBCTemplate.getConnection;
import static semiProject.com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import semiProject.com.kh.board.model.dao.BoardDao;
import semiProject.com.kh.board.model.vo.Board;
import semiProject.com.kh.member.model.dao.MemberDao;
import semiProject.com.kh.member.model.vo.Member;
import semiProject.com.kh.notice.model.vo.Notice;
import semiProject.com.kh.place.model.dao.PlaceDao;

public class MemberService {

	public Member loginMember(String userId, String userPwd) {
		Connection conn = getConnection();
		
		Member loginUser = new MemberDao().loginMember(conn, userId, userPwd);
		close(conn);
		return loginUser;
	}

	public int insetMember(Member mem) {
		Connection conn = getConnection();
		
		int result = new MemberDao().insertMember(conn, mem);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	public Member selectMember(String userId) {
		Connection conn = getConnection();
		
		Member mem = new MemberDao().selectMember(conn, userId);
		close(conn);
		return mem;
	}

	public Member updateMember(Member m) {
		Connection conn = getConnection();
		
		Member updateMem = null;
		
		int result = new MemberDao().updateMember(conn, m);
		if(result > 0) {
			commit(conn);
			updateMem = new MemberDao().selectMember(conn, m.getUserId());
		}else {
			rollback(conn);
		}
		close(conn);
		return updateMem;
	}

	public int deleteMember(String userId) {
		Connection conn = getConnection();
		
		int result = new MemberDao().deleteMember(conn, userId);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	public Member updatePwd(String userId, String userPwd, String newPwd) {
	      Connection conn = getConnection();
	      Member updateMem = null;
	      
	      int result = new MemberDao().updatePwd(conn, userId ,userPwd, newPwd);
	      if(result >0)
	      {
	         commit(conn);
	         updateMem = new MemberDao().selectMember(conn, userId);
	      }else {
	         rollback(conn);
	      }close(conn);
	      return updateMem;
	   }

	public int idCheck(String userId) {
		Connection conn = getConnection();
		int result = new MemberDao().idCheck(conn, userId);
		close(conn);
		return result;
	}

	public ArrayList<Member> selectAllMember() {
		Connection conn = getConnection();
		ArrayList<Member> list = new MemberDao().selectAllMember(conn);
		
		close(conn);
		return list;
	}

	public ArrayList<Member> selectAllDeleteMember() {
		Connection conn = getConnection();
		ArrayList<Member> list = new MemberDao().selectAllDeleteMember(conn);
		
		close(conn);
		return list;
	}

	public int updateMemberAdmin(String mId) {
		Connection conn = getConnection();
		
		int result = new MemberDao().updateMemberAdmin(conn, mId);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;	}

	
	public ArrayList<Board> selectMyPost(String userId) {
		Connection conn = getConnection();
		
		ArrayList<Board> list = new MemberDao().selectMyPost(conn, userId);
		close(conn);
		System.out.println("서비스에서 보이는지 : " + list);
		
		return list;
	}

	public int emailCheck(String email) {
		Connection conn = getConnection();
		int result = new MemberDao().emailCheck(conn, email);
		close(conn);
		return result;
	}


}
