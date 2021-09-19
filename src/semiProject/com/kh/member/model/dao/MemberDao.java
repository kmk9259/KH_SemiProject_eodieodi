package semiProject.com.kh.member.model.dao;

import static semiProject.com.kh.common.JDBCTemplate.*;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import semiProject.com.kh.board.model.vo.Board;
import semiProject.com.kh.member.model.vo.Member;
import semiProject.com.kh.notice.model.vo.Notice;
import semiProject.com.kh.place.model.vo.Place;

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

	public ArrayList<Member> selectAllMember(Connection conn) {
		ArrayList<Member> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		/*
		 * selectAllMember=SELECT USER_NO, USER_ID, USER_PWD, USER_NAME, PHONE, EMAIL, GENDER, ENROLL_DATE FROM MEMBER WHERE STATUS='Y' AND NOT USER_ID='admin'
		 */
		String sql = prop.getProperty("selectAllMember");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next())
			{
				Member m = new Member();
				m.setUserNo(rset.getInt("USER_NO"));
				m.setUserId(rset.getString("USER_ID"));
				m.setUserPwd(rset.getString("USER_PWD"));			
				m.setUserName(rset.getString("USER_NAME"));
				m.setPhone(rset.getString("PHONE"));
				m.setEmail(rset.getString("EMAIL"));
				m.setGender(rset.getString("GENDER"));				
				m.setEnrollDate(rset.getDate("ENROLL_date"));
				list.add(m);
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

	public ArrayList<Member> selectAllDeleteMember(Connection conn) {
		ArrayList<Member> dlist = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		/*
		 * selectAllDeleteMember=SELECT USER_NO, USER_ID, USER_PWD, USER_NAME, PHONE, EMAIL, GENDER, ENROLL_date FROM MEMBER WHERE STATUS='N'
		 */
		String sql = prop.getProperty("selectAllDeleteMember");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next())
			{
				Member m = new Member();
				m.setUserNo(rset.getInt("USER_NO"));
				m.setUserId(rset.getString("USER_ID"));
				m.setUserPwd(rset.getString("USER_PWD"));			
				m.setUserName(rset.getString("USER_NAME"));
				m.setPhone(rset.getString("PHONE"));
				m.setEmail(rset.getString("EMAIL"));
				m.setGender(rset.getString("GENDER"));				
				m.setEnrollDate(rset.getDate("ENROLL_date"));
				dlist.add(m);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return dlist;
	}

	public int updateMemberAdmin(Connection conn, String mId) {
		int result = 0;
		PreparedStatement pstmt = null;
		//updateMemberAdmin=UPDATE MEMBER SET STATUS='Y' WHERE USER_ID=?
		String sql = prop.getProperty("updateMemberAdmin");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	/*
	//내가 쓴 글에 보일 커뮤니티 글
	public ArrayList<Board> selectMyPost(Connection conn, String userId) {
		//selectMyPost=SELECT BOARD_NO, BOARD_TITLE, BOARD_CONTENT, USER_ID, COUNT, CREATE_DATE
		//FROM BOARD B JOIN MEMBER ON(BOARD_WRITER = USER_NO)
		//WHERE B.STATUS = 'Y' AND USER_ID=?
		ArrayList<Board> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMyPost");
		
		System.out.println("sql 문은 읽히는지 : " + sql);
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,  userId);
			rset = pstmt.executeQuery(); // 쿼리문 실행 

			System.out.println("==1==="+rset);
			
			
			// 두개만 목록을 가져와서 객체로 생성함 
			while(rset.next()) {
				
				list.add(new Board(
						rset.getString("BOARD_TITLE"),
						rset.getString("BOARD_CONTENT"),
						rset.getString("USER_ID"),
						rset.getInt("COUNT")
						));
				
				System.out.println("멤버 다오에서 넘겨보기 : " +  list);
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
*/
	public int emailCheck(Connection conn, String email) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("emailCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, email);
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

/*
	  public ArrayList<Board> selectMyPost(Connection conn, String userId, int bno){
		  //selectMyPost=SELECT BOARD_TITLE, BOARD_CONTENT, USER_ID, COUNT
		  //FROMBOARD B JOIN MEMBER ON(BOARD_WRITER = USER_NO) 
		  //WHERE B.STATUS = 'Y' AND USER_ID=? AND BOARD_NO=?
	  
	  ArrayList<Board> list = new ArrayList<Board>();
	  
	  PreparedStatement pstmt = null;
	  ResultSet rset = null;
	  
	  String sql = prop.getProperty("selectMyPost");
	  
	  System.out.println("sql 문은 읽히는지 : " + sql);
	  
	  try {
		  pstmt = conn.prepareStatement(sql);
		  pstmt.setString(1, userId);
		  pstmt.setInt(2, bno);
		  rset = pstmt.executeQuery(); // 쿼리문 실행
	  
	  // 다섯개의 목록을 가져와서 객체로 생성함 
		  while(rset.next()) {
	  
		  list.add(new Board( rset.getInt("BOARD_NO"),
							  rset.getString("BOARD_TITLE"),
							  rset.getString("BOARD_CONTENT"),
							  rset.getString("USER_ID"),
							  rset.getInt("COUNT"),
							  rset.getDate("CREATE_DATE")
							  ));
	  
		  System.out.println("멤버 다오에서 넘겨보기 : " + list); 
		  }
	  } catch (SQLException e) {
		  // TODO Auto-generated catch block
		  e.printStackTrace(); 
	 }finally {
		 close(rset);
		 close(pstmt);
	  }
	  
	  
	  return list;
	  }*/
	 

	public ArrayList<Board> selectMyPost(Connection conn, String userId) {
		//selectMyPost=SELECT BOARD_TITLE, BOARD_CONTENT, USER_ID, COUNT
		//FROM BOARD B JOIN MEMBER ON(BOARD_WRITER = USER_NO)
		//WHERE B.STATUS = 'Y' AND USER_ID=? AND BOARD_NO=?
		
		ArrayList<Board> list = new ArrayList<Board>();
				
				PreparedStatement pstmt = null;
				ResultSet rset = null;
				
				String sql = prop.getProperty("selectMyPost");

				System.out.println("sql 문은 읽히는지 : " + sql);
				
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1,  userId);
					rset = pstmt.executeQuery(); // 쿼리문 실행 
					
					// 다섯개의 목록을 가져와서 객체로 생성함 
					while(rset.next()) {
						
						list.add(new Board(
								rset.getInt("BOARD_NO"),
								rset.getString("BOARD_TITLE"),
								rset.getString("BOARD_CONTENT"),
								rset.getString("USER_ID"),
								rset.getInt("COUNT")
								));
						
						System.out.println("멤버 다오에서 넘겨보기 : " +  list);
					}
					
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (NumberFormatException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					close(rset);
					close(pstmt);
				}
		
				
				return list;
			}
	
	/*
	public ArrayList<Board> selectMyPost(Connection conn, String userId, int bno) {
		//selectMyPost=SELECT BOARD_TITLE, BOARD_CONTENT, USER_ID, COUNT
		//FROM BOARD B JOIN MEMBER ON(BOARD_WRITER = USER_NO)
		//WHERE B.STATUS = 'Y' AND USER_ID=? AND BOARD_NO=?
		
		ArrayList<Board> list = new ArrayList<Board>();
				
				PreparedStatement pstmt = null;
				ResultSet rset = null;
				
				String sql = prop.getProperty("selectMyPost");

				System.out.println("sql 문은 읽히는지 : " + sql);
				
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1,  userId);
					pstmt.setInt(2,  bno);
					rset = pstmt.executeQuery(); // 쿼리문 실행 
					
					// 다섯개의 목록을 가져와서 객체로 생성함 
					while(rset.next()) {

						Board b = new Board();
						b.setBoardNo(rset.getInt("BOARD_NO"));
						b.setBoardTitle(rset.getString("BOARD_TITLE"));
						b.setBoardContent(rset.getString("BOARD_CONTENT"));
						b.setBoardWriter(rset.getString("USER_ID"));
						b.setCount(rset.getInt("COUNT"));
						
						/*
						list.add(new Board(
								rset.getInt("BOARD_NO"),
								rset.getString("BOARD_TITLE"),
								rset.getString("BOARD_CONTENT"),
								rset.getString("USER_ID"),
								rset.getInt("COUNT")
								));
						
						list.add(b);
						System.out.println("멤버 다오에서 넘겨보기 : " +  list);
					}
					
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (NumberFormatException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					close(rset);
					close(pstmt);
				}
		
				
				return list;
			}*/
	public int increaseCount(Connection conn, int bno) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseCount");
		System.out.println("sql : " + sql);
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			
		}
		
		return result;
	}
/*
	public int findUserId(Connection conn, String email, String userName) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("emailCheck");
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, email);
			
			rset = pstmt.executeQuery();
	
			
			if(rset.next()) {
				result = rset.getInt(1);          

				System.out.println("멤버 다오에서 result 넘겨보기 : " +  result);
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
	*/
/*	
	public Member findUserId(Connection conn, String email, String userName) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member findId = null;

		String sql = prop.getProperty("findId");
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, email);
			pstmt.setString(2, userName);
			
			rset = pstmt.executeQuery();
	
			
			while(rset.next()) {
				findId = new Member();
				//findId.setUserNo(rset.getInt("USER_NO"));
				findId.setUserId(rset.getString("USER_ID"));
				/*findId.setUserPwd(rset.getString("USER_PWD"));
				findId.setUserName(rset.getString("USER_NAME"));
				findId.setPhone(rset.getString("PHONE"));
				findId.setEmail(rset.getString("EMAIL"));
				findId.setGender(rset.getString("GENDER"));
				findId.setEnrollDate(rset.getDate("ENROLL_DATE"));
				findId.setModifyDate(rset.getDate("MODIFY_DATE"));
				findId.setStatus(rset.getString("STATUS"));               
	                 *//*
				System.out.println("멤버 다오에서 findId 넘겨보기 : " +  findId);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
				
		return findId;
	}
*/
	
	public Member findUserId(Connection conn, String email, String userName) {
	      Member findId = null;
	      PreparedStatement pstmt = null;
	      ResultSet rset = null;

	      String sql = prop.getProperty("findId");
	      try {
	         pstmt = conn.prepareStatement(sql);
	         
	         pstmt.setString(1, email);
	         pstmt.setString(2, userName);
	         
	         rset = pstmt.executeQuery();
	   
	         
	         if(rset.next()) {
	            findId = new Member(
	                        rset.getString("USER_ID")
	                     );
	            System.out.println("멤버 다오에서 findId 넘겨보기 : " +  findId.getUserId());
	         }
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }finally {
	         close(rset);
	         close(pstmt);
	      }
	            
	      return findId;
	   }

	public Member findUserPwd(Connection conn, String email, String userId) {
		Member findPwd = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("findPwd");
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, email);
			pstmt.setString(2, userId);
			
			rset = pstmt.executeQuery();
	
			
			if(rset.next()) {
				findPwd = new Member();
				findPwd.setUserPwd(rset.getString("USER_PWD"));
				System.out.println("멤버 다오에서 findPwd 넘겨보기 : " +  findPwd.getUserPwd());
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
				
		return findPwd;
	}
/*
	public int updateMemberEmail(Connection conn, String email, String userId) {
		int result = 0;
		PreparedStatement pstmt = null;
		//updateEmail=UPDATE MEMBER SET EMAIL=?, MODIFY_DATE=SYSDATE WHERE USER_ID=?

		String sql = prop.getProperty("updateEmail");
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, email);
			pstmt.setString(2, userId);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	 
*/

	public Board showMyPost(Connection conn, String userId, String btitle) {
		Board b = null;

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("showMyPost");
		System.out.println("sql : " + sql);
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setString(2, btitle);
			rset = pstmt.executeQuery();
			
			//만약에 결과 값이 있으면
			if(rset.next()) {
				b = new Board(
						rset.getInt("BOARD_NO"),
						rset.getString("BOARD_TITLE"),
						rset.getString("BOARD_CONTENT"),
						rset.getString("USER_ID"),
						rset.getInt("COUNT"),
						rset.getDate("CREATE_DATE")
						);
				
				System.out.println("내 게시글 조회 : "+ b);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
			
		}
		
		return b;
	}
}
