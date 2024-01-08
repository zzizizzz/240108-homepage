package vo;

import java.sql.Date;

public class Todo {

	private int no;
	private TodoCategory category;
	private String title;
	private User user;
	private String expectedDate;
	private String content;
	private String status;
	private String deleted;
	private Date updatedDate;
	private Date createdDate;
	
	public Todo() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public TodoCategory getCategory() {
		return category;
	}

	public void setCategory(TodoCategory category) {
		this.category = category;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getExpectedDate() {
		return expectedDate;
	}

	public void setExpectedDate(String expectedDate) {
		this.expectedDate = expectedDate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
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
		return "Todo [no=" + no + ", category=" + category + ", title=" + title + ", user=" + user + ", expectedDate="
				+ expectedDate + ", content=" + content + ", status=" + status + ", deleted=" + deleted
				+ ", updatedDate=" + updatedDate + ", createdDate=" + createdDate + "]";
	}


}
