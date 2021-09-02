package semiProject.com.kh.place.model.vo;

public class Place{
	private int placeNo;				//일정번호
	private int areaNo;					//지역번호
	private int categoryNo;				//카테고리 번호
	private String placeTitle;			//상호명
	private String placePhone;			//전화번호
	private String description;			//설명, 주요메뉴
	private String bsHour;				//영업시간
	private int price;					//1인가격
	private String address;				//상세주소
	private int count;					//조회수
	private String status;				//상태값
	
	private String titleImg;			//대표 이미지
	
	public Place() {
		// TODO Auto-generated constructor stub
	}
	
	//전체생성자
	public Place(int placeNo, int areaNo, int categoryNo, String placeTitle, String placePhone, String description,
			String bsHour, int price, String address, int count, String status, String titleImg) {
		super();
		this.placeNo = placeNo;
		this.areaNo = areaNo;
		this.categoryNo = categoryNo;
		this.placeTitle = placeTitle;
		this.placePhone = placePhone;
		this.description = description;
		this.bsHour = bsHour;
		this.price = price;
		this.address = address;
		this.count = count;
		this.status = status;
		this.titleImg = titleImg;
	}
	
	//count, status, titleImg없는 생성자
	public Place(int placeNo, int areaNo, int categoryNo, String placeTitle, String placePhone, String description,
			String bsHour, int price, String address) {
		super();
		this.placeNo = placeNo;
		this.areaNo = areaNo;
		this.categoryNo = categoryNo;
		this.placeTitle = placeTitle;
		this.placePhone = placePhone;
		this.description = description;
		this.bsHour = bsHour;
		this.price = price;
		this.address = address;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getTitleImg() {
		return titleImg;
	}

	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
	}

	@Override
	public String toString() {
		return "Place [placeNo=" + placeNo + ", areaNo=" + areaNo + ", categoryNo=" + categoryNo + ", placeTitle="
				+ placeTitle + ", placePhone=" + placePhone + ", description=" + description + ", bsHour=" + bsHour
				+ ", price=" + price + ", address=" + address + ", count=" + count + ", status=" + status
				+ ", titleImg=" + titleImg + "]";
	}

}
