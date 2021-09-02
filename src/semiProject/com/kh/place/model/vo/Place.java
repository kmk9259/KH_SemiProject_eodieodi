package semiProject.com.kh.place.model.vo;

import java.sql.Date;

public class Place {
	private int placeNo;
	private String place;			// 장소
	private String area;				// 지역
	private String theme;				// 테마
	private String category;			// 카테고리
	private String placeTitle;		// 상호명
	private String placePhone;		// 전화번호
	private String description;		// 설명
	private String bsHour;			// 영업시간
	private int price;				// 1인 가격
	private String address;			// 상세주소
	private int count;				// 조회수
	
	private String placeImg;		// 대표 이미지(실제 서버에 업로드되어있는 이름)

	public Place() {
		// TODO Auto-generated constructor stub
	}

	public Place(String place, String area, String theme, String category, String placeTitle, String placePhone,
			String description, String bsHour, int price, String address, int count, String placeImg) {
		super();
		this.place = place;
		this.area = area;
		this.theme = theme;
		this.category = category;
		this.placeTitle = placeTitle;
		this.placePhone = placePhone;
		this.description = description;
		this.bsHour = bsHour;
		this.price = price;
		this.address = address;
		this.count = count;
		this.placeImg = placeImg;
	}
	
	//count 없는 생성자
	public Place(String place, String area, String theme, String category, String placeTitle, String placePhone,
			String description, String bsHour, int price, String address, String placeImg) {
		super();
		this.place = place;
		this.area = area;
		this.theme = theme;
		this.category = category;
		this.placeTitle = placeTitle;
		this.placePhone = placePhone;
		this.description = description;
		this.bsHour = bsHour;
		this.price = price;
		this.address = address;
		this.placeImg = placeImg;
	}

	
	public int getPlaceNo() {
		return placeNo;
	}

	public void setPlaceNo(int placeNo) {
		this.placeNo = placeNo;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getTheme() {
		return theme;
	}

	public void setTheme(String theme) {
		this.theme = theme;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
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

	public String getPlaceImg() {
		return placeImg;
	}

	public void setPlaceImg(String placeImg) {
		this.placeImg = placeImg;
	}

	@Override
	public String toString() {
		return "Place [place=" + place + ", area=" + area + ", theme=" + theme + ", category=" + category
				+ ", placeTitle=" + placeTitle + ", placePhone=" + placePhone + ", description=" + description
				+ ", bsHour=" + bsHour + ", price=" + price + ", address=" + address + ", count=" + count
				+ ", placeImg=" + placeImg + "]";
	}
	
	
	
	
	
	

}
