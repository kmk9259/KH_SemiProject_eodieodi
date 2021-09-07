package semiProject.com.kh.planMy.model.vo;

import java.sql.Date;

public class PlanMy {

	private int planNo;
	private int userNo;
	private int areaNo;
	private String planTitle;
	private Date planDate;
	//private String planPlace; -> MYPLAN_PLACE 테이블 (09.07)
	private String planMemo;
	private Date createDate;
	private String status;
	private String titleImg;  //PlanSaveList에 쓰기위한 필드추가->테이블과 다르다.(09.07)
	
	public PlanMy() {
		// TODO Auto-generated constructor stub
	}
	
	
	//for 일정보관함 리스트뷰 (09.07)
	public PlanMy(int planNo, String planTitle,	String titleImg) {
		super();
		this.planNo = planNo;
		this.planTitle = planTitle;
		this.titleImg = titleImg;
	}

	//for 일정상세보기
	public PlanMy(int planNo, String planTitle, Date planDate, String planMemo) {
		super();
		this.planNo = planNo;
		this.planTitle = planTitle;
		this.planDate = planDate;
		//this.planPlace = planPlace;
		this.planMemo = planMemo;
	}
	
	//for 일정생성
	public PlanMy(int userNo, int areaNo, String planTitle, Date planDate, 
			String planMemo) {
		super();
		this.userNo = userNo;
		this.areaNo = areaNo;
		this.planTitle = planTitle;
		this.planDate = planDate;
		//this.planPlace = planPlace;
		this.planMemo = planMemo;
	}

	//전체 필드 생성자
	public PlanMy(int planNo, int userNo, int areaNo, String planTitle, Date planDate, 
			String planMemo, Date createDate, String status) {
		super();
		this.planNo = planNo;
		this.userNo = userNo;
		this.areaNo = areaNo;
		this.planTitle = planTitle;
		this.planDate = planDate;
		//this.planPlace = planPlace;
		this.planMemo = planMemo;
		this.createDate = createDate;
		this.status = status;
	}

	
	public String getTitleImg() {
		return titleImg;
	}

	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
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

	public String getPlanTitle() {
		return planTitle;
	}

	public void setPlanTitle(String planTitle) {
		this.planTitle = planTitle;
	}

	public Date getPlanDate() {
		return planDate;
	}

	public void setPlanDate(Date planDate) {
		this.planDate = planDate;
	}

//	public String getplanPlace() {
//		return planPlace;
//	}
//
//	public void setplanPlace(String planPlace) {
//		this.planPlace = planPlace;
//	}

	public String getPlanMemo() {
		return planMemo;
	}

	public void setPlanMemo(String planMemo) {
		this.planMemo = planMemo;
	}

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

	@Override
	public String toString() {
		
		return "PlanMy [planNo=" + planNo + ", userNo=" + userNo + ", areaNo=" + areaNo
				+ ", planTitle=" + planTitle + ", planDate=" + planDate + ", "
				+ "planMemo="+ planMemo +"createDate="+ createDate + "status="+ status + "]";
	}
	
	
}
