package semiProject.com.kh.notice.model.dao;

import static semiProject.com.kh.common.JDBCTemplate.*;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import semiProject.com.kh.notice.model.vo.Notice;

public class NoticeDao {
	
	private Properties prop = new Properties();
	
	//프로퍼티즈 읽어오는 부분 
	 public NoticeDao() {
			
			String fileName = NoticeDao.class.getResource("/semiProject/sql/notice/notice-query.properties").getPath();
			
			System.out.println("fileName   " + fileName);
			try {
				
				prop.load(new FileReader(fileName));
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	 

	 //리스트 조회 하기 
	public ArrayList<Notice> selectList(Connection conn) {

	
//selectList=SELECT NOTICE_NO, NOTICE_TITLE, USER_ID, COUNT, CREATE_DATE 
		//FROM NOTICE N JOIN MEMBER ON (NOTICE_WRITER=USER_NO) 
		//WHERE N.STATUS='Y' ORDER BY NOTICE_NO DESC
		
//		NOTICE_NO	NUMBER
//		NOTICE_TITLE	VARCHAR2(100 BYTE)
//		NOTICE_CONTENT	VARCHAR2(4000 BYTE)
//		NOTICE_WRITER	NUMBER
//		COUNT	NUMBER
//		CREATE_DATE	DATE
//		STATUS	VARCHAR2(1 BYTE)
		
		
		ArrayList<Notice> list = new ArrayList<Notice>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("seletList");
		
		System.out.println(pstmt+ " 뭐 어디서 부터 안들어올 생각 왜 안들어오니 ");
		System.out.println(rset + "rest 들어오냐? ");
		System.out.println(sql + " ㅇㄴ미랑ㄴ럼아니ㅓ리ㅏㅇㅁ너리ㅏㅓㅇㄴ미ㅏ럼이나");

		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery(); // 쿼리문 실행 
			
			// 다섯개의 목록을 가져와서 객체로 생성함 
			while(rset.next()) {
				
				list.add(new Notice(rset.getInt("NOTICE_NO"),
									rset.getString("NOTICE_TITLE"),
									rset.getString("USER_ID"),
									rset.getInt("COUNT"),
									rset.getDate("CREATE_DATE")
						
						));
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	
	
	
	
	//공지 등록 
	public int insertNotice(Connection conn, Notice n) {

//insertNotice=INSERT INTO NOTICE VALUES(SEQ_NNO.NEXTVAL, ?, ?, ?, DEFAULT, SYSDATE, DEFAULT)
		
		int result = 0;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("insertNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, n.getNoticeTitle());
			pstmt.setString(2, n.getNoticeContent());
			pstmt.setInt(3, Integer.parseInt(n.getNoticeWriter()));
			
			
			result =pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		
		return result;
	}

	
	
	//조회하기에서 조회수 올리기 메소드 
	public int increaseCount(Connection conn, int nno) {
		
//increaseCount=UPDATE NOTICE SET COUNT = COUNT+1 WHERE NOTICE_NO=? AND STATUS='Y'
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseCount");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nno);// 위에서 받아온 nno 조회수 증가+1

			result = pstmt.executeUpdate();// 업뎃시키고
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	//게시글 상세 조회 
	public Notice selectNotice(Connection conn, int nno) {
//selectNotice=SELECT NOTICE_NO, NOTICE_TITLE, NOTICE_CONTENT, USER_ID, COUNT, CREATE_DATE 
//FROM NOTICE N JOIN MEMBER ON (NOTICE_WRITER=USER_NO) 
		//WHERE NOTICE_NO=? AND N.STATUS='Y'
		
		Notice n = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectNotice");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, nno); // nno로 가져온것 조회하기 
			rset = pstmt.executeQuery();// 쿼리문을 실행한다 
			
			
			if(rset.next()) {
				n = new Notice(
						
						rset.getInt("NOTICE_NO"),
						rset.getString("NOTICE_TITLE"),
						rset.getString("NOTICE_CONTENT"),
						rset.getString("USER_ID"),
						rset.getInt("COUNT"),
						rset.getDate("CREATE_DATE")
						
						);
			}	
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}

		return n; // 노티스 객체 담은거 리턴시켜주기 
	}

	

}
