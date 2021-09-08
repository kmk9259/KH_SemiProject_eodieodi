package semiProject.com.kh.planAdmin.model.vo;

import java.sql.Date;

public class AdminPlan {
	
	//관리자가 추천해준 플랜을 저장하는 용도로 쓰겠는디 
	
//	PLAN_NO	NUMBER
//	USER_NO	NUMBER
//	PLAN_TITLE	VARCHAR2(100 BYTE)
//	CREATE_DATE	DATE
	
	private int planNo; //일정 번호 (
	private int userNo; //사용자 번호  
	private int areaNo; // 먼가 플레이스를 참조하는 fk 키가 있어야되지 않을까...?
	private String planTitle; //일정 제목 
	private Date createDate; // 생성일자 
	
	public AdminPlan() {
		// TODO Auto-generated constructor stub
	}




	public AdminPlan(int planNo, int userNo, int areaNo, String planTitle, Date createDate) {
		super();
		this.planNo = planNo;
		this.userNo = userNo;
		this.areaNo = areaNo;
		this.planTitle = planTitle;
		this.createDate = createDate;
	}





	public int getAreaNo() {
		return areaNo;
	}




	public void setAreaNo(int areaNo) {
		this.areaNo = areaNo;
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


	public String getPlanTitle() {
		return planTitle;
	}


	public void setPlanTitle(String planTitle) {
		this.planTitle = planTitle;
	}


	public Date getCreateDate() {
		return createDate;
	}


	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}


	@Override
	public String toString() {
		return "AdminPlan [planNo=" + planNo + ", userNo=" + userNo + ", planTitle=" + planTitle + ", createDate="
				+ createDate + "]";
	}
	
	

}
