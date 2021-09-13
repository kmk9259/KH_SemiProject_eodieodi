package semiProject.com.kh.planAdmin.model.vo;

public class AdminPlan_Place {
//	
//	AP_PLACE_NO	NUMBER
//	REF_ACNO	NUMBER
//	PLACE_NO	NUMBER
//	STATUS	VARCHAR2(1 BYTE)
	
	

	private int ap_place_no;
	private int ref_acno;
	private int place_no;
	private String status;
	
	
	public AdminPlan_Place() {
		// TODO Auto-generated constructor stub
	}

	

	public AdminPlan_Place(int ap_place_no, int ref_acno, int place_no, String status) {
		super();
		this.ap_place_no = ap_place_no;
		this.ref_acno = ref_acno;
		this.place_no = place_no;
		this.status = status;
	}



	public AdminPlan_Place(int ap_place_no, int ref_acno, String status) {
		super();
		this.ap_place_no = ap_place_no;
		this.ref_acno = ref_acno;
		this.status = status;
	}



	public int getAp_place_no() {
		return ap_place_no;
	}


	public void setAp_place_no(int ap_place_no) {
		this.ap_place_no = ap_place_no;
	}


	public int getRef_acno() {
		return ref_acno;
	}


	public void setRef_acno(int ref_acno) {
		this.ref_acno = ref_acno;
	}


	public int getPlace_no() {
		return place_no;
	}


	public void setPlace_no(int place_no) {
		this.place_no = place_no;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}



	@Override
	public String toString() {
		return "AdminPlan_Place [ap_place_no=" + ap_place_no + ", ref_acno=" + ref_acno + ", place_no=" + place_no
				+ ", status=" + status + "]";
	}
	
	
}
