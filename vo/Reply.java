package vo;

import java.sql.Date;

public class Reply {
	
	private int no;
	private Board board;
	private User user;
	private String content;
	private String deleted;
	private Date updatedDate;
	private Date createdDate;

	public Reply(){}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public Board getBoard() {
		return board;
	}

	public void setBoard(Board board) {
		this.board = board;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDeleted() {
		return deleted;
	}

	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}

	public Date getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	@Override
	public String toString() {
		return "Reply [no=" + no + ", board=" + board + ", user=" + user + ", content=" + content + ", deleted="
				+ deleted + ", updatedDate=" + updatedDate + ", createdDate=" + createdDate + "]";
	}
	
	
	
}
