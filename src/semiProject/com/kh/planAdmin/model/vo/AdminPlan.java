package semiProject.com.kh.planAdmin.model.vo;

import java.sql.Date;

public class AdminPlan {
	
//
//	PLAN_NO	NUMBER
//	USER_NO	NUMBER
//	AREA_NO	NUMBER
//	COURSE_NO	NUMBER
//	PLAN_TITLE	VARCHAR2(100 BYTE)
//	CREATE_DATE	DATE
//	STATUS	VARCHAR2(1 BYTE)
	
	private int planNo; // 일정번호
	
	private int userNo; // 사용자번호(로그인한 사용자 번호)
	private int areaNo; // 지역 번호 ( 홍대, 강남 등) 
	private int courseNo; // 코스(연인,친구,가족 코스) 번호 
	
	
//	private String planTitle; //일정 제목 ( 내 보관함에 저장할 때 필요함)  
	private Date createDate; // 생성일자  (내 보관함에 저장할 때 생성된 날짜가 필요함) 
	
	private String status; //상태값 
	private String titleImg; // 들어간 이미지 (리스트에 보일려면) 가져와야되나 ?
	
	
	public AdminPlan() {
		// TODO Auto-generated constructor stub
	}

	
	
	

	public AdminPlan(int userNo, int areaNo, int courseNo, Date createDate) {
		super();
		this.userNo = userNo;
		this.areaNo = areaNo;
		this.courseNo = courseNo;
		this.createDate = createDate;
	}





	public AdminPlan(int planNo, int userNo, int areaNo, int courseNo, String planTitle, Date createDate, String status,
			String titleImg) {
		super();
		this.planNo = planNo;
		this.userNo = userNo;
		this.areaNo = areaNo;
		this.courseNo = courseNo;
	//	this.planTitle = planTitle;
		this.createDate = createDate;
		this.status = status;
		this.titleImg = titleImg;
	}

	
	
	// 추천일정 선택창 생성자 
	public AdminPlan(int userNo, int areaNo, int courseNo, String planTitle, Date createDate) {
		super();
		this.userNo = userNo;
		this.areaNo = areaNo;
		this.courseNo = courseNo;
	//	this.planTitle = planTitle;
		this.createDate = createDate;
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


	public int getCourseNo() {
		return courseNo;
	}


	public void setCourseNo(int courseNo) {
		this.courseNo = courseNo;
	}


//	public String getPlanTitle() {
//		return planTitle;
//	}
//
//
//	public void setPlanTitle(String planTitle) {
//		this.planTitle = planTitle;
//	}


	public Date getCreateDate() {
		return createDate;
	}


	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public String getTitleImg() {
		return titleImg;
	}


	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
	}


	@Override
	public String toString() {
		return "AdminPlan [planNo=" + planNo + ", userNo=" + userNo + ", areaNo=" + areaNo + ", courseNo=" + courseNo
				+  ", createDate=" + createDate + ", status=" + status + ", titleImg="
				+ titleImg + "]";
	}
	
	

}
