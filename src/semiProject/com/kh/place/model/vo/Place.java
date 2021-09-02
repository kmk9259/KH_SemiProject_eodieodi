package semiProject.com.kh.place.vo;

import java.sql.Date;

public class Place {
	
	private int placeNo;
	private int areaNo;
	private int themeNo;
	private int categoryNo;
	private String placeTitle;
	private String placePhone;
	private String description;
	private String bsHour;
	private int price;
	private String address;
	private int count;
	
	public Place() {
		// TODO Auto-generated constructor stub
	}
	
	public Place(int placeNo, String placeTitle, String placePhone, String description, String bsHour, int price,
			String address, int count) {
		super();
		this.placeNo = placeNo;
		this.placeTitle = placeTitle;
		this.placePhone = placePhone;
		this.description = description;
		this.bsHour = bsHour;
		this.price = price;
		this.address = address;
		this.count = count;
	}

	public Place(int placeNo, int areaNo, int themeNo, int categoryNo, String placeTitle, String placePhone,
			String description, String bsHour, int price, String address, int count) {
		super();
		this.placeNo = placeNo;
		this.areaNo = areaNo;
		this.themeNo = themeNo;
		this.categoryNo = categoryNo;
		this.placeTitle = placeTitle;
		this.placePhone = placePhone;
		this.description = description;
		this.bsHour = bsHour;
		this.price = price;
		this.address = address;
		this.count = count;
	}

	public int getPlaceNo() {
		return placeNo;
	}
	public void setPlaceNo(int placeNo) {
		this.placeNo = placeNo;
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
	public int getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}
	public String getPlaceTitle() {
		return placeTitle;
	}
	public void setPlaceTitle(String placeTitle) {
		this.placeTitle = placeTitle;
	}
	public String getPlacePhone() {
		return placePhone;
	}
	public void setPlacePhone(String placePhone) {
		this.placePhone = placePhone;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getBsHour() {
		return bsHour;
	}
	public void setBsHour(String bsHour) {
		this.bsHour = bsHour;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
}
