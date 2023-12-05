package com.blogcdk.model;

public class Remark {
	private int remarkId;
	private int blogId;
	private String content;
	private String time;
	private int fromUserId;
	public int getRemarkId() {
		return remarkId;
	}
	public void setRemarkId(int remarkId) {
		this.remarkId = remarkId;
	}
	public int getBlogId() {
		return blogId;
	}
	public void setBlogId(int blogId) {
		this.blogId = blogId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public int getFromUserId() {
		return fromUserId;
	}
	public void setFromUserId(int fromUserId) {
		this.fromUserId = fromUserId;
	}
	@Override
	public String toString() {
		return "Remark [remarkId=" + remarkId + ", blogId=" + blogId + ", content=" + content + ", time=" + time
				+ ", fromUserId=" + fromUserId + "]";
	}
	
}
