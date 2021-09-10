package semiProject.com.kh.planAdmin.model.dao;

import static semiProject.com.kh.common.JDBCTemplate.*;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import semiProject.com.kh.planAdmin.model.vo.AdminPlan;
import semiProject.com.kh.planMy.model.dao.PlanMyDao;

public class AdminPlanDao {
	
	private Properties prop = new Properties();

	
	 public AdminPlanDao() {
			String fileName = PlanMyDao.class.getResource("/semiProject/sql/adminPlan/adminPlan-query.properties").getPath();
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

	 
	 
	 
	 
	// 일정들 값 가지고 오는것..?
	public int insertAdminPlan(Connection conn, AdminPlan ap) {

		int result = 0;
		PreparedStatement pstmt = null;

		// 아직 쿼리 안짬
		String sql = prop.getProperty("insertAdminPlan");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}

		return result;
	}
	
	
	

	// 추천코스,위치, 날짜 (제목까지) 저장할 테이블..? 
	//왜냐면 추천코스 저장함에서도 보아야 하니까..아마도.. 
	public int insertAdminPlan_Place(Connection conn, String[] adminPlace) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("");
		
		try {
			
			
			pstmt = conn.prepareStatement(sql);
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

}
  