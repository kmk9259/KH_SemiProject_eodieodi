package semiProject.com.kh.planMy.vo;

import java.sql.Date;

public class PlanMy {

	private int planNo;
	private int userNo;
	private int areaNo;
	private String planTitle;
	private Date planDate;
	private String planContent;
	private String planMemo;
	private Date createDate;
	private String status;
	
	public PlanMy() {
		// TODO Auto-generated constructor stub
	}

	
	public PlanMy(int planNo, String planTitle, Date planDate, String planContent, String planMemo) {
		super();
		this.planNo = planNo;
		this.planTitle = planTitle;
		this.planDate = planDate;
		this.planContent = planContent;
		this.planMemo = planMemo;
	}


	public PlanMy(int planNo, int userNo, int areaNo, String planTitle, Date planDate, String planContent,
			String planMemo, Date createDate, String status) {
		super();
		this.planNo = planNo;
		this.userNo = userNo;
		this.areaNo = areaNo;
		this.planTitle = planTitle;
		this.planDate = planDate;
		this.planContent = planContent;
		this.planMemo = planMemo;
		this.createDate = createDate;
		this.status = status;
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

	public String getPlanContent() {
		return planContent;
	}

	public void setPlanContent(String planContent) {
		this.planContent = planContent;
	}

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
				+ ", planTitle=" + planTitle + ", planDate=" + planDate + ", planContent=" + planContent + ", "
				+ "planMemo="+ planMemo +"createDate="+ createDate + "status="+ status + "]";
	}
	
	
}
