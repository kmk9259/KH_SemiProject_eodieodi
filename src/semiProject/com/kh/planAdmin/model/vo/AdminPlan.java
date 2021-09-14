package semiProject.com.kh.planAdmin.model.vo;

import java.sql.Date;
import java.util.ArrayList;

import semiProject.com.kh.area.model.vo.Area;
import semiProject.com.kh.course.model.vo.Course;
import semiProject.com.kh.theme.model.vo.Theme;

public class AdminPlan {
	
//	PLAN_NO	NUMBER
//	USER_NO	NUMBER
//	AREA_NO	NUMBER
//	THEME_NO	NUMBER
//	COURSE_NO	NUMBER
//	CHOOSE_DATE	DATE
//	STATUS	VARCHAR2(1 BYTE)
	
	private int planNo; // 일정번호
	
	private int userNo; // 사용자번호(로그인한 사용자 번호)
	private int areaNo; // 지역 번호 ( 홍대, 강남 등) 
	private int themeNo;  
	private int courseNo;
	
	private Date chooseDate; // 선택일자  (내 보관함에 저장할 때 생성된 날짜가 필요함) 
	
	private String status; //상태값 
	
	
	public AdminPlan() {
		// TODO Auto-generated constructor stub
	}




	public AdminPlan(int planNo, int userNo, int areaNo, int themeNo, int courseNo, Date chooseDate, String status) {
		super();
		this.planNo = planNo;
		this.userNo = userNo;
		this.areaNo = areaNo;
		this.themeNo = themeNo;
		this.courseNo = courseNo;
		this.chooseDate = chooseDate;
		this.status = status;
	}






	public int getCourseNo() {
		return courseNo;
	}




	public void setCourseNo(int courseNo) {
		this.courseNo = courseNo;
	}




	public int getPlanNo() {
		return planNo;
	}


	public void setPlanNo(int planNo) {
		this.planNo = planNo;
	}


	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public int getAreaNo() {
		return areaNo;
	}


	public void setAreaNo(int areaNo) {
		this.areaNo = areaNo;
	}


	public int getThemeNo() {
		return themeNo;
	}


	public void setThemeNo(int themeNo) {
		this.themeNo = themeNo;
	}


	public Date getChooseDate() {
		return chooseDate;
	}


	public void setChooseDate(Date chooseDate) {
		this.chooseDate = chooseDate;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	@Override
	public String toString() {
		return "AdminPlan [planNo=" + planNo + ", userNo=" + userNo + ", areaNo=" + areaNo + ", themeNo=" + themeNo
				+ ", chooseDate=" + chooseDate + ", status=" + status + "]";
	}

	
	
}
