package com.blogcdk.model;

import java.sql.Date;

public class AccessBlog {
	private int accessBlogId;
	private int blogId;
	private String ip;
	private int userId;
	private Date accessTime;
	
	public AccessBlog(){
		
	}
	
	public AccessBlog(int accessBlogId, int blogId, String ip, int userId, Date accessTime) {
		super();
		this.accessBlogId = accessBlogId;
		this.blogId = blogId;
		this.ip = ip;
		this.userId = userId;
		this.accessTime = accessTime;
	}
	public int getAccessBlogId() {
		return accessBlogId;
	}
	public void setAccessBlogId(int accessBlogId) {
		this.accessBlogId = accessBlogId;
	}
	public int getBlogId() {
		return blogId;
	}
	public void setBlogId(int blogId) {
		this.blogId = blogId;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public Date getAccessTime() {
		return accessTime;
	}
	public void setAccessTime(Date accessTime) {
		this.accessTime = accessTime;
	}
	@Override
	public String toString() {
		return "AccessBlog [accessBlogId=" + accessBlogId + ", blogId=" + blogId + ", ip=" + ip + ", userId=" + userId
				+ ", accessTime=" + accessTime + "]";
	}
}
