package semiProject.com.kh.area.model.vo;

public class Area {
	private int areaNo;
	private String areaName;
	
	public Area() {
		// TODO Auto-generated constructor stub
	}

	public Area(int areaNo, String areaName) {
		super();
		this.areaNo = areaNo;
		this.areaName = areaName;
	}

	public int getAreaNo() {
		return areaNo;
	}

	public void setAreaNo(int areaNo) {
		this.areaNo = areaNo;
	}

	public String getAreaName() {
		return areaName;
	}

	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}

	@Override
	public String toString() {
		return "Area [areaNo=" + areaNo + ", areaName=" + areaName + "]";
	}
	
	

}
