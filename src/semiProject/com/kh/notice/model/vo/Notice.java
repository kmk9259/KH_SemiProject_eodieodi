package semiProject.com.kh.notice.model.vo;

import java.sql.Date;

public class Notice {
//
//	//NOTICE_NO	NUMBER
//	NOTICE_TITLE	VARCHAR2(100 BYTE)
//	NOTICE_CONTENT	VARCHAR2(4000 BYTE)
//	NOTICE_WRITER	NUMBER
//	COUNT	NUMBER
//	CREATE_DATE	DATE
//	STATUS	VARCHAR2(1 BYTE)
	
	
	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private int noticeWriter; // 근데 작성자..? 인데 어차피 관리자만 쓸꺼라서 넘버로 써도 되나
	private int count;
	private Date createDate;
	private String status;
	
	public Notice() {
		// TODO Auto-generated constructor stub
	}
	
	 
	
	public Notice(String noticeTitle, String noticeContent, int noticeWriter) {
		super();
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeWriter = noticeWriter;
	}


	
	public Notice(int noticeNo, String noticeTitle, String noticeContent, int noticeWriter, int count,
			Date createDate) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeWriter = noticeWriter;
		this.count = count;
		this.createDate = createDate;
	}


	
	public Notice(int noticeNo, String noticeTitle, String noticeContent, int noticeWriter, int count, Date createDate,
			String status) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeWriter = noticeWriter;
		this.count = count;
		this.createDate = createDate;
		this.status = status;
	}
	

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public int getNoticeWriter() {
		return noticeWriter;
	}

	public void setNoticeWriter(int noticeWriter) {
		this.noticeWriter = noticeWriter;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
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
		return "Notice [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
				+ ", noticeWriter=" + noticeWriter + ", count=" + count + ", createDate=" + createDate + ", status="
				+ status + "]";
	}
	
	
}
