package semiProject.com.kh.board.model.vo;

import java.sql.Date;

public class Reply {
	private int replyNo;
	private String replyContent;
	private int refBoardId;
	private int replyWriter; // 조회시 : 작성자 이름, 댓글작성시 : 회원번호로 쓰일 것!!
	private Date createDate;
	private String status;

	public Reply() {

	}

	public Reply(int replyNo, String replyContent, int replyWriter, Date createDate) {
		super();
		this.replyNo = replyNo;
		this.replyContent = replyContent;
		this.replyWriter = replyWriter;
		this.createDate = createDate;
	}

	public Reply(int replyNo, String replyContent, int refBoardId, int replyWriter, Date createDate, String status) {
		super();
		this.replyNo = replyNo;
		this.replyContent = replyContent;
		this.refBoardId = refBoardId;
		this.replyWriter = replyWriter;
		this.createDate = createDate;
		this.status = status;
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyId(int replyNo) {
		this.replyNo = replyNo;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public int getRefBoardId() {
		return refBoardId;
	}

	public void setRefBoardId(int refBoardId) {
		this.refBoardId = refBoardId;
	}

	public int getReplyWriter() {
		return replyWriter;
	}

	public void setReplyWriter(int replyWriter) {
		this.replyWriter = replyWriter;
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
		return "Reply [replyNo=" + replyNo + ", replyContent=" + replyContent + ", refBoardId=" + refBoardId
				+ ", replyWriter=" + replyWriter + ", createDate=" + createDate + ", status=" + status + "]";
	}

}
