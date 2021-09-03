package semiProject.com.kh.member.model.dao;

import static semiProject.com.kh.common.JDBCTemplate.*;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import semiProject.com.kh.member.model.vo.Member;

public class MemberDao {

	private Properties prop = new Properties();

	public MemberDao() {
		String fileName = MemberDao.class.getResource("/semiProject/sql/member/member-query.properties").getPath();
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
	
	public Member loginMember(Connection conn, String userId, String userPwd) {
		Member loginUser = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("loginMember");
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			rset = pstmt.executeQuery();
	
			
			if(rset.next()) {
				loginUser = new Member(
	                     rset.getInt("USER_NO"),
	                     rset.getString("USER_ID"),
	                     rset.getString("USER_PWD"),
	                     rset.getString("USER_NAME"),
	                     rset.getString("PHONE"),
	                     rset.getString("EMAIL"),
	                     rset.getString("GENDER"),
	                     rset.getDate("ENROLL_DATE"),
	                     rset.getDate("MODIFY_DATE"),
	                     rset.getString("STATUS")                     
	                  );
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
				
		return loginUser;
	}

	public int insertMember(Connection conn, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMember");
		System.out.println("m"+m);
		try {
			pstmt = conn.prepareStatement(sql);
			//INSERT INTO MEMBER VALUES(SEQ_UNO.NEXTVAL, ?, ?, ?, ?, ?, ? SYSDATE, SYSDATE, DEFAULT)
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPwd());
			pstmt.setString(3, m.getUserName());
			pstmt.setString(4, m.getPhone());
			pstmt.setString(5, m.getEmail());
			pstmt.setString(6, m.getGender());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public Member selectMember(Connection conn, String userId) {
		Member mem = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				mem = new Member(
							 rset.getInt("USER_NO"),
		                     rset.getString("USER_ID"),
		                     rset.getString("USER_PWD"),
		                     rset.getString("USER_NAME"),
		                     rset.getString("PHONE"),
		                     rset.getString("EMAIL"),
		                     rset.getString("GENDER"),
		                     rset.getDate("ENROLL_DATE"),
		                     rset.getDate("MODIFY_DATE"),
		                     rset.getString("STATUS")   
						);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return mem;
	}

	public int updateMember(Connection conn, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;
		//updateMember=UPDATE MEMBER SET PHONE=?, EMAIL=?, MODIFY_DATE=SYSDATE WHERE USER_ID=?

		String sql = prop.getProperty("updateMember");
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1,  m.getUserName());
			pstmt.setString(2,  m.getPhone());
			pstmt.setString(3,  m.getEmail());
			pstmt.setString(4,  m.getUserId());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteMember(Connection conn, String userId) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteMember");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int updatePwd(Connection conn, String userId, String userPwd, String newPwd) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatePwd");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newPwd);
			pstmt.setString(2, userId);
			pstmt.setString(3, userPwd);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int idCheck(Connection conn, String userId) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("idCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}

}
