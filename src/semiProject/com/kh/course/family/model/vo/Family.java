package semiProject.com.kh.course.family.model.vo;

public class Family {
	private int courseNO;					//코스 번호
	private int themeNo;					//테마 번호
	private String courseTitle;				//커플코스제목
	private String courseContent;			//커플코스내용
	private String status;					//상태값(y/n)
	
	public Family(int courseNO, int themeNo, String courseTitle, String courseContent, String status) {
		super();
		this.courseNO = courseNO;
		this.themeNo = themeNo;
		this.courseTitle = courseTitle;
		this.courseContent = courseContent;
		this.status = status;
	}

	public int getCourseNO() {
		return courseNO;
	}

	public void setCourseNO(int courseNO) {
		this.courseNO = courseNO;
	}

	public int getThemeNo() {
		return themeNo;
	}

	public void setThemeNo(int themeNo) {
		this.themeNo = themeNo;
	}

	public String getCourseTitle() {
		return courseTitle;
	}

	public void setCourseTitle(String courseTitle) {
		this.courseTitle = courseTitle;
	}

	public String getCourseContent() {
		return courseContent;
	}

	public void setCourseContent(String courseContent) {
		this.courseContent = courseContent;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Couple [courseNO=" + courseNO + ", themeNo=" + themeNo + ", courseTitle=" + courseTitle
				+ ", courseContent=" + courseContent + ", status=" + status + "]";
	}
	
	
	
	

}
