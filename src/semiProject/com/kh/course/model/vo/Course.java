package semiProject.com.kh.course.model.vo;

public class Course {
	private int courseNo;
	private int areaNo;
	private int themeNo;
	private String courseTitle;
	private String status;

	public Course() {
		// TODO Auto-generated constructor stub
	}

	public Course(int courseNo, int areaNo, int themeNo, String courseTitle, String status) {
		super();
		this.courseNo = courseNo;
		this.areaNo = areaNo;
		this.themeNo = themeNo;
		this.courseTitle = courseTitle;
		this.status = status;
	}

	public int getCourseNo() {
		return courseNo;
	}

	public void setCourseNo(int courseNo) {
		this.courseNo = courseNo;
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

	public String getCourseTitle() {
		return courseTitle;
	}

	public void setCourseTitle(String courseTitle) {
		this.courseTitle = courseTitle;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Course [courseNo=" + courseNo + ", areaNo=" + areaNo + ", themeNo=" + themeNo + ", courseTitle="
				+ courseTitle + ", status=" + status + "]";
	}
	
}
