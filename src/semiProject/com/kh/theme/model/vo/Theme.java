package semiProject.com.kh.theme.model.vo;

public class Theme {
	private int themeNo;
	private String themeName;
	
	public Theme() {
		// TODO Auto-generated constructor stub
	}

	public Theme(int themeNo, String themeName) {
		super();
		this.themeNo = themeNo;
		this.themeName = themeName;
	}

	public int getThemeNo() {
		return themeNo;
	}

	public void setThemeNo(int themeNo) {
		this.themeNo = themeNo;
	}

	public String getThemeName() {
		return themeName;
	}

	public void setThemeName(String themeName) {
		this.themeName = themeName;
	}

	@Override
	public String toString() {
		return "Theme [themeNo=" + themeNo + ", themeName=" + themeName + "]";
	}
	
	
}
