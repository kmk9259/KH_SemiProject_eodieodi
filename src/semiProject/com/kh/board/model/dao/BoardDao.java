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
		
		//쿼리문만 다르다는것? 
		/*
		 * b.setBoardNo(rset.getInt("BOARD_NO"));
		 * b.setBoardTitle(rset.getString("BOARD_TITLE"));
		 * b.setBoardWriter(rset.getString("USER_ID"));
		 * b.setCount(rset.getInt("COUNT"));
		 * b.setCreateDate(rset.getDate("CREATE_DATE"));
		 * b.setTitleImg(rset.getString("CHANGE_NAME"));
		 */

		
//			   SELECT BOARD_NO, BOARD_TITLE,USER_ID, COUNT,CREATE_DATE, CHANGE_NAME \
//				FROM BOARD JOIN MEMBER ON USER_NO=BOARD_WIRTER
		//		JOIN (SELECT * FROM ATTACHMENT \
//				WHERE FILE_NO IN( \
//				SELECT MIN(FILE_NO) FILE_NO FROM ATTACHMENT WHERE STATUS='Y' GROUP BY REF_BNO)) ON (REF_BNO = BOARD_NO) \
//				WHERE BOARD.STATUS='Y' ORDER BY BOARD_NO DESC
//		
		
		

		String sql = prop.getProperty("selectThList");
		
		System.out.println("쿼리문 제대로? " + sql);
		

		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;

		/*
		 * currentPage 1, startRow =1, endRow =10; currentPage 2, startRow =11, endRow
		 * =20; currentPage 3, startRow =21, endRow =30;
		 */
		try {
			
			//페이지 부분을 우선 진행하고 
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();
			

			while (rset.next()) {
				
				Board b = new Board();
				b.setBoardNo(rset.getInt("BOARD_NO"));
				b.setBoardTitle(rset.getString("BOARD_TITLE"));
				b.setBoardWriter(rset.getString("USER_NO"));
				b.setCount(rset.getInt("COUNT"));
				b.setCreateDate(rset.getDate("CREATE_DATE"));
				b.setTitleImg(rset.getString("CHANGE_NAME"));
						
				list.add(b);
				

				System.out.println("selectThList list : " + list);

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

	
	//게시글 등록 
	public int insertBoard(Connection conn, Board b) {
		
		//insertBoard=INSERT INTO BOARD VALUES(SEQ_BNO.NEXTVAL,?, ?, ?, DEFAULT, SYSDATE, DEFAULT)
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertBoard");
		System.out.println("insert Board sql : " + sql);
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, b.getBoardTitle());
			pstmt.setString(2, b.getBoardContent());
			pstmt.setInt(3, Integer.parseInt(b.getBoardWriter()));
			
			result = pstmt.executeUpdate();
			System.out.println("======insert board result====="+result);
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

	
	//글쓰기 등록 ~~!! 
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
	         
	         System.out.println("내용등록============== : "+ result);
	         
	         
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

		System.out.println("insertAttachment 퀴리문 : "+ sql);
		try {
			System.out.println("insertAttachment for 문 전 size : "+fileList.size());
			
			
			
			for(int i = 0; i<fileList.size(); i++) {
				
				Attachment at = fileList.get(i);
				
				
				System.out.println( "insertAttachment 파일번호" + fileList.get(0).getFileNo());
				System.out.println(" insertAttachment 참조번호" + fileList.get(0).getRefBoardNo());
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, at.getOriginName());
				pstmt.setString(2, at.getChangeName());
				pstmt.setString(3, at.getFilePath());
				
				
				result += pstmt.executeUpdate();
				
				
				System.out.println("insertAttachment 첨부파일 여러개 : "+ result);
				
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
			
			System.out.println("공지사항 result= ==="+rset);
			
			
			// 두개만 목록을 가져와서 객체로 생성함 
			while(rset.next()) {
				
				nlist.add(new Notice(rset.getString("NOTICE_TITLE"),
									rset.getString("NOTICE_CONTENT")
									
						
						));
				
				System.out.println("공지하사항 보드 다오에서 넘겨보기 : " +  nlist);
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

	//선택했을때 디테일로 넘어감 
	public ArrayList<Attachment> selectThumbnail(Connection conn, int bno) {
		
		ArrayList<Attachment>list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAttachment");
		
		//selectAttachment=SELECT FILE_NO, ORIGIN_NAME, CHANGE_NAME FROM ATTACHMENT WHERE REF_BNO=? AND STATUS='Y'
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Attachment at = new Attachment();
				at.setFileNo(rset.getInt("FILE_NO"));
				at.setOriginName(rset.getString("ORIGIN_NAME"));
				at.setChangeName(rset.getString("CHANGE_NAME"));
				
						
				list.add(at);
				
				System.out.println("셀렉트어테치먼트  list : " + list);
				
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

	//사진 비교해서 다시  넣어주기 (일반 list로 가져와 여러장 뿌려줄 수 있나? )
	public ArrayList<Attachment> selectAttachment(Connection conn, int bno) {
		
		ArrayList<Attachment> files = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		//selectAttachment=SELECT FILE_NO, ORIGIN_NAME, CHANGE_NAME 
				//FROM ATTACHMENT WHERE REF_BNO=? AND STATUS='Y'

				String sql = prop.getProperty("selectAttachment");

				try {
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setInt(1, bno);
					
					
					rset = pstmt.executeQuery();
					

					while(rset.next()) 
					{
						
						Attachment at = new Attachment();
						at.setFileNo(rset.getInt("FILE_NO"));
						at.setOriginName(rset.getString("ORIGIN_NAME"));
						at.setChangeName(rset.getString("CHANGE_NAME"));
						
						files.add(at);
						System.out.println("다오에서 파일이 담기니? " + files);
					
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					close(rset);
					close(pstmt);
				}
				return files;
	}


	public int updateAttachment(Connection conn, Attachment at) {
		int result =0;
		PreparedStatement pstmt = null;
		//updateAttachment=UPDATE ATTACHMENT SET CHANGE_NAME=?, ORIGIN_NAME=?, FILE_PATH=? WHERE FILE_NO=?
		String sql = prop.getProperty("updateAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, at.getChangeName());
			pstmt.setString(2, at.getOriginName());
			pstmt.setString(3, at.getFilePath());
			pstmt.setInt(4, at.getFileNo());
			
			
			System.out.println("보드 카피본 파일 이름 ::: " + at.getChangeName());
			System.out.println("보드 업데잇 원본 ::: " + at.getOriginName());
			System.out.println("보드 경로  ::: " + at.getFilePath());
			System.out.println("보드 파일 번호 ::: " + at.getFileNo());
			
			
			
			System.out.println("보드에 바뀐 이름 업데잇 ::: " + result);
			
			result= pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	
	

	
	//보드 업데이트 할때 
	public int updateThBoard(Connection conn, Board b) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateBoard");
		//updateBoard=UPDATE BOARD SET BOARD_TITLE=?, BOARD_CONTENT=? WHERE BOARD_NO=?
		
		
		System.out.println("보드 업데이트 할때 쿼리? " + sql);
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, b.getBoardTitle());
			pstmt.setString(2, b.getBoardContent());
			pstmt.setInt(3, b.getBoardNo());
			
			System.out.println("보드 업데이트 값 담기 : " + result);
			
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			
		}
		
		return result;
	}

	public int insertNewAttachment(Connection conn, Attachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNewAttachment");
		
		
		System.out.println("새로운 파일 넣기 쿼리? " + sql);
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, at.getRefBoardNo());
			pstmt.setString(2, at.getOriginName());
			pstmt.setString(3, at.getChangeName());
			pstmt.setString(4, at.getFilePath());
			
			
			
			result = pstmt.executeUpdate();
			
			System.out.println("insertNewAttachment 결과  : "+ result);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			
		}
		
		return result;
	}

	

	
}
