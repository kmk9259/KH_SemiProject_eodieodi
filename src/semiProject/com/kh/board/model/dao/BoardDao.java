package semiProject.com.kh.board.model.dao;

import static semiProject.com.kh.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import semiProject.com.kh.board.model.vo.Attachment;
import semiProject.com.kh.board.model.vo.Board;
import semiProject.com.kh.board.model.vo.PageInfo;
import semiProject.com.kh.notice.model.vo.Notice;

public class BoardDao {

	// jsp >> service (url mapping 로직) >> Dao 에서 DB 랑 왔다갔다한다. (Dao 에 직접 적지 않고 외부에
	// propert 가져오기)
	private Properties prop = new Properties();

	public BoardDao() {
		String fileName = BoardDao.class.getResource("/semiProject/sql/board/board-query.properties").getPath();
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

	public int getListCount(Connection conn) {
//getListCount=SELECT COUNT(*) FROM BOARD WHERE BOARD_TYPE=1 AND STATUS='Y'

		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("getListCount");
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			System.out.println("sql : " + sql);

			if(rset.next()) {
				//listCount = rset.getInt(1); // count
				listCount = rset.getInt("COUNT(*)");
				
				System.out.println("listCount : " + listCount);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return listCount;
	}

	public ArrayList<Board> selectThList(Connection conn, PageInfo pi) {
		ArrayList<Board> list = new ArrayList<>();

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		/*
		 * selectThList=SELECT * FROM (SELECT ROWNUM RNUM, A.* FROM (SELECT BOARD_NO,
		 * BOARD_TITLE, USER_ID, COUNT, CREATE_DATE, CHANGE_NAME FROM BOARD B JOIN
		 * (SELECT * FROM ATTACHMENT WHERE FILE_NO IN( SELECT MIN(FILE_NO) FILE_NO FROM
		 * ATTACHMENT WHERE STATUS = 'Y' GROUP BY REF_BNO)) ON (REF_BNO = BOARD_NO) JOIN
		 * MEMBER ON (BOARD_WRITER=USER_NO) WHERE B.STATUS='Y' ORDER BY BOARD_NO DESC)
		 * A) WHERE RNUM BETWEEN ? AND ?
		 */

		String sql = prop.getProperty("selectThList");
		
		System.out.println("sql 문 보려구!!: " + sql);

		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;

		/*
		 * currentPage 1, startRow =1, endRow =10; currentPage 2, startRow =11, endRow
		 * =20; currentPage 3, startRow =21, endRow =30;
		 */
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();
			System.out.println("sql : " + sql);

			while (rset.next()) {
				
				Board b = new Board();
				b.setBoardNo(rset.getInt("BOARD_NO"));
				b.setBoardTitle(rset.getString("BOARD_TITLE"));
				b.setBoardWriter(rset.getString("USER_ID"));
				b.setCount(rset.getInt("COUNT"));
				b.setCreateDate(rset.getDate("CREATE_DATE"));
				b.setTitleImg(rset.getString("CHANGE_NAME"));
						
				list.add(b);
				

				System.out.println("list : " + list);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int insertBoard(Connection conn, Board b) {
		
		//insertBoard=INSERT INTO BOARD VALUES(SEQ_BNO.NEXTVAL,?, ?, ?, DEFAULT, SYSDATE, DEFAULT)
		//insertAttachment=INSERT INTO ATTACHMENT VALUES(SEQ_FNO.NEXTVAL, SEQ_BNO.CURRVAL, ?, ?, ?, SYSDATE, NULL, DEFAULT)
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertBoard");
		System.out.println("sql : " + sql);
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, b.getBoardTitle());
			pstmt.setString(2, b.getBoardContent());
			pstmt.setInt(3, Integer.parseInt(b.getBoardWriter()));
			
			result = pstmt.executeUpdate();
			System.out.println("======result====="+result);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
	}

	public int insertAttachment(Connection conn, Attachment at) {
	
				//insertAttachment=INSERT INTO ATTACHMENT VALUES(SEQ_FNO.NEXTVAL, SEQ_BNO.CURRVAL, ?, ?, ?, SYSDATE, NULL, DEFAULT)
				int result = 0;
				PreparedStatement pstmt = null;
				String sql = prop.getProperty("insertAttachment");
				System.out.println("sql : " + sql);
				
				try {
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setString(1, at.getOriginName());
					pstmt.setString(2, at.getChangeName());
					pstmt.setString(3, at.getFilePath());
					
					result = pstmt.executeUpdate();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					close(pstmt);
				}
				return result;
	}

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

	public Board selectBoard(Connection conn, int bno) {
		Board b = null;

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectBoard");
		System.out.println("sql : " + sql);
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bno); // 넘버로 조회해 온다.
			rset = pstmt.executeQuery();
			
			/*
			 * selectBoard=SELECT BOARD_NO, BOARD_TITLE, BOARD_CONTENT, USER_ID, COUNT, CREATE_DATE 
			 FROM BOARD B JOIN MEMBER ON(BOARD_WRITER = USER_NO)WHERE B.STATUS = 'Y' AND BOARD_NO=?
			 */
			
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
				
				System.out.println("조회 : "+ b);
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

	public Attachment selectAttachment(Connection conn, int bno) {
		Attachment at = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		//selectAttachment=SELECT FILE_NO, ORIGIN_NAME, CHANGE_NAME 
		//FROM ATTACHMENT WHERE REF_BNO=? AND STATUS='Y'

		String sql = prop.getProperty("selectAttachment");

		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			rset = pstmt.executeQuery();
			

			if(rset.next()) {
				at = new Attachment();
				at.setFileNo(rset.getInt("FILE_NO"));
				at.setOriginName(rset.getString("ORIGIN_NAME"));
				at.setChangeName(rset.getString("CHANGE_NAME"));
				
				System.out.println("첨부파일 : "+ at);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return at;
	}
	
	public ArrayList<Board> selectThList(Connection conn) {
		
//		selectThList=SELECT BOARD_NO, BOARD_TITLE, COUNT, CHANGE_NAME \
//				FROM BOARD JOIN (SELECT * FROM ATTACHMENT \
//				WHERE FILE_NO IN( \
//				SELECT MIN(FILE_NO) FILE_NO FROM ATTACHMENT WHERE STATUS='Y' GROUP BY REF_BNO)) ON (REF_BNO = BOARD_NO) \
//				WHERE BOARD.STATUS='Y' AND BOARD.BOARD_TYPE=2 ORDER BY BOARD_NO DESC
//		
		
		ArrayList<Board> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		
		String sql = prop.getProperty("selectThList");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Board b = new Board();
				b.setBoardNo(rset.getInt("BOARD_NO"));
				b.setBoardTitle(rset.getString("BOARD_TITLE"));
				b.setCount(rset.getInt("COUNT"));
				b.setTitleImg(rset.getString("CHANGE_NAME"));
						
				list.add(b);
				
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

	public int insertThBoard(Connection conn, Board b) {
		int result =0;
	      PreparedStatement pstmt = null;
	      //insertThBoard=INSERT INTO BOARD VALUES(SEQ_BNO.NEXTVAL, ?, ?, ?, DEFAULT, SYSDATE, DEFAULT)
	      String sql = prop.getProperty("insertThBoard");
	      System.out.println("내용 등록 퀴리문 : "+ sql);
	      try {
	         pstmt = conn.prepareStatement(sql);
	         
//	         BOARD_TITLE
//	         BOARD_CONTENT
//	         BOARD_WRITER
	         
	         
	         pstmt.setString(1, b.getBoardTitle());
	         pstmt.setString(2, b.getBoardContent());
	         pstmt.setInt(3,  Integer.parseInt(b.getBoardWriter()));
	         
	         result= pstmt.executeUpdate();
	         
	         System.out.println("내용등록 : "+ result);
	         
	         
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }finally {
	         close(pstmt);
	      }
	      return result;
	}

	public int insertAttachment(Connection conn, ArrayList<Attachment> fileList) {
		//insertAttachment=INSERT INTO ATTACHMENT VALUES(SEQ_ANO.NEXTVAL, SEQ_BNO.CURRVAL, ?, ?, ?, SYSDATE, DEFAULT)
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertAttachment");

		System.out.println("퀴리문 : "+ sql);
		try {
			System.out.println("for 문 전 size : "+fileList.size());
			
			
			
			for(int i = 0; i<fileList.size(); i++) {
				
				Attachment at = fileList.get(i);
				
				System.out.println(at.getOriginName());
				System.out.println(at.getChangeName());
				System.out.println(at.getFilePath());
				
				
				System.out.println("파일번호" + fileList.get(0).getFileNo());
				System.out.println("참조번호" + fileList.get(0).getRefBoardNo());
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, at.getOriginName());
				pstmt.setString(2, at.getChangeName());
				pstmt.setString(3, at.getFilePath());
				
				
				result += pstmt.executeUpdate();
				
				System.out.println(at.getOriginName());
				System.out.println(at.getChangeName());
				System.out.println(at.getFilePath());
				System.out.println("첨부파일 여러개 : "+ result);
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;

	}

	
//커뮤니에 오를 공지사항
	public ArrayList<Notice> selectNList(Connection conn) {
		//selectNList=SELECT NOTICE_TITLE, NOTICE_CONTENT FROM NOTICE


		
		
		ArrayList<Notice> nlist = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		
		//selectNList=SELECT NOTICE_TITLE, NOTICE_CONTENT FROM NOTICE
		String sql = prop.getProperty("selectNList");
		
		System.out.println("sql 문은 읽히는지 : " + sql);
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery(); // 쿼리문 실행 
			
			System.out.println("==1==="+rset);
			
			
			// 두개만 목록을 가져와서 객체로 생성함 
			while(rset.next()) {
				
				nlist.add(new Notice(rset.getString("NOTICE_TITLE"),
									rset.getString("NOTICE_CONTENT")
									
						
						));
				
				System.out.println("보드 다오에서 넘겨보기 : " +  nlist);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}

		
		return nlist;
	}

	
}
