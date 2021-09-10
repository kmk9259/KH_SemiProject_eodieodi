package semiProject.com.kh.course.model.vo;

public class CoursePlace {

	private int cpNo;
	private int refCourse;
	private int pNo;
	private String status;
	
	public CoursePlace() {
		// TODO Auto-generated constructor stub
	}

	public CoursePlace(int cpNo, int refCourse, int pNo, String status) {
		super();
		this.cpNo = cpNo;
		this.refCourse = refCourse;
		this.pNo = pNo;
		this.status = status;
	}

	public int getCpNo() {
		return cpNo;
	}

	public void setCpNo(int cpNo) {
		this.cpNo = cpNo;
	}

	public int getRefCourse() {
		return refCourse;
	}

	public void setRefCourse(int refCourse) {
		this.refCourse = refCourse;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "CoursePlace [cpNo=" + cpNo + ", refCourse=" + refCourse + ", pNo=" + pNo + ", status=" + status + "]";
	}
	

}
