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
import semiProject.com.kh.board.model.vo.Reply;
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
			

			if(rset.next()) {
				//listCount = rset.getInt(1); // count
				listCount = rset.getInt("COUNT(*)");
				
				
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
		
		

		String sql = prop.getProperty("selectThList");
		
		
		

		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;

		
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
		
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, b.getBoardTitle());
			pstmt.setString(2, b.getBoardContent());
			pstmt.setInt(3, Integer.parseInt(b.getBoardWriter()));
			
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
	     
	      try {
	         pstmt = conn.prepareStatement(sql);

	         
	         
	         pstmt.setString(1, b.getBoardTitle());
	         pstmt.setString(2, b.getBoardContent());
	         pstmt.setInt(3,  Integer.parseInt(b.getBoardWriter()));
	         
	         result= pstmt.executeUpdate();
	         
	         
	         
	         
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

		
		try {
			
			
			
			
			for(int i = 0; i<fileList.size(); i++) {
				
				Attachment at = fileList.get(i);
				
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, at.getOriginName());
				pstmt.setString(2, at.getChangeName());
				pstmt.setString(3, at.getFilePath());
				
				
				result += pstmt.executeUpdate();
				
				
				
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
		

		ArrayList<Notice> nlist = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		
		 
		String sql = prop.getProperty("selectNList");
		
		System.out.println("sql 문은 읽히는지 : " + sql);
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			
			rset = pstmt.executeQuery(); // 쿼리문 실행 
			
			
			
			
			// 두개만 목록을 가져와서 객체로 생성함 
			while(rset.next()) {
				
				nlist.add(new Notice(rset.getString("NOTICE_TITLE"),
									rset.getString("NOTICE_CONTENT")
									
						
						));
				
				
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


	//어떻게 하면 4개 모두 비교할까~~
	public int updateAttachment(Connection conn, ArrayList<Attachment> fileList) {
		
		int result =0;
		PreparedStatement pstmt = null;
		
		//updateAttachment=UPDATE ATTACHMENT SET CHANGE_NAME=?, ORIGIN_NAME=?, FILE_PATH=?, STATUS='N' WHERE FILE_NO=?
		//updateAttachment=UPDATE ATTACHMENT SET CHANGE_NAME=?, ORIGIN_NAME=?, FILE_PATH=? WHERE FILE_NO=?
		String sql = prop.getProperty("updateAttachment");
		

		
		try {
			
			    pstmt = conn.prepareStatement(sql);
			    
			    for(int i=0; i<fileList.size(); i++) {
			    	
				pstmt.setString(1, fileList.get(i).getChangeName());
				pstmt.setString(2, fileList.get(i).getOriginName());
				pstmt.setString(3, fileList.get(i).getFilePath());
				pstmt.setInt(4, fileList.get(i).getFileNo());

				result += pstmt.executeUpdate();
				
			    }


			
			
			
			
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
		//updateBoard=UPDATE BOARD SET BOARD_TITLE=?, BOARD_CONTENT=?  WHERE BOARD_NO=?
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, b.getBoardTitle());
			pstmt.setString(2, b.getBoardContent());
			pstmt.setInt(3, b.getBoardNo());
			
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			
		}
		
		return result;
	}

	public int insertNewAttachment(Connection conn, ArrayList<Attachment> fileList, int bno) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNewAttachment");
		
		//INSERT INTO ATTACHMENT VALUES(SEQ_ANO.NEXTVAL, ?, ?, ?, ?, SYSDATE, DEFAULT)
		
		
		try {
			
		for(int i = 0; i<fileList.size(); i++) {
			
			Attachment at = fileList.get(i);
			
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bno);

			//pstmt.setInt(1, at.getRefBoardNo()); 
			pstmt.setString(2, at.getOriginName());
			pstmt.setString(3, at.getChangeName());
			pstmt.setString(4, at.getFilePath());
			
			result += pstmt.executeUpdate();
			
		
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			
		}
		
		return result;
	}

	public int deleteBoard(Connection conn, int bno) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteBoard");
		
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

	public int deleteAttachment(Connection conn, int bno) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteAttachment");
		
		
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

	public int insertReply(Connection conn, Reply r) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		//insertReply=INSERT INTO REPLY VALUES(SEQ_RNO.NEXTVAL, ?, ?, ?, SYSDATE, DEFAULT)
		
		String sql = prop.getProperty("insertReply");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, r.getReplyContent());
			pstmt.setInt(2, r.getRefBoardId());
			pstmt.setString(3, r.getReplyWriter());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<Reply> selectRList(Connection conn, int bno) {
		ArrayList<Reply>list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;


		String sql = prop.getProperty("selectRlist");
		
		//selectRlist=SELECT REPLY_NO, REPLY_CONTENT, USER_ID, CREATE_DATE FROM REPLY R JOIN MEMBER 
		//ON(REPLY_WRITER = USER_NO) WHERE REF_BNO=? AND R.STATUS='Y' ORDER BY REPLY_NO DESC
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
			list.add(new Reply(rset.getInt("REPLY_NO"),
					rset.getString("REPLY_CONTENT"),
					rset.getString("USER_ID"),
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



	//likes 올려주는 메소드
	public int increaseReplyCount(Connection conn, int rno) {
		
		int result =0; 
		PreparedStatement pstmt = null; 
		
		//increaseReplyCount=UPDATE REPLY SET likes=likes+1 WHERE REPLY_NO=?
		String sql = prop.getProperty("increaseReplyCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Board> selectTopList(Connection conn) {
		
		ArrayList<Board> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;


		String sql = prop.getProperty("selectTopList");
		
		//selectTopList=SELECT * FROM (SELECT BOARD_NO, BOARD_TITLE, COUNT, CHANGE_NAME \
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
			Board b = new Board();
			b.setBoardNo(rset.getInt("BOARD_NO"));
			b.setBoardTitle(rset.getString("BOARD_TITLE"));
			b.setTitleImg(rset.getString("CHANGE_NAME"));
			b.setCreateDate(rset.getDate("CREATE_DATE"));
					
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

	
	//검색 결과 뿌리기 (새로운 페이징 처리와 함께)
	public ArrayList<Board> searchWord(Connection conn, String searchWord) {
		
		ArrayList<Board> list = new ArrayList<Board>();
		PreparedStatement pstmt = null;
		ResultSet rset = null; 
		
		String sql = prop.getProperty("searchWord");
		
		
//		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
//		int endRow = startRow + pi.getBoardLimit() - 1;
//		
		try {
			
			//페이지 부분을 우선 진행하고 
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, searchWord);
//			pstmt.setInt(2, startRow);
//			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
			

			while(rset.next())
			{
				Board b = new Board();

				b.setBoardNo(rset.getInt("BOARD_NO"));
				b.setBoardTitle(rset.getString("BOARD_TITLE"));
				b.setBoardWriter(rset.getString("USER_NO"));
				b.setCount(rset.getInt("COUNT"));
				b.setCreateDate(rset.getDate("CREATE_DATE"));
				b.setTitleImg(rset.getString("CHANGE_NAME"));

				list.add(b);
				
				System.out.println("bbbbbbbb 검색결과 내용 가져오려 " + list);
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

	
	//파일 지우기 메소드
	public int deleteFile(Connection conn, int fileno) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteFile");
		
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, fileno);

			result = pstmt.executeUpdate();
			
						
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			
		}
		
		return result;
	}

	
	
	

	
}
