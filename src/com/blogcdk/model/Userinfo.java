package com.blogcdk.model;

public class Userinfo {
	private Integer userId;
	private String userNickname;
	private Integer userAge;
	private String userEmail;
	private String userUrl;
	private String userAbout;
	private String userHeadImg;
	private Integer userPoints;
	public Userinfo() {
		
	}
	public Userinfo(Integer userId, String userNickname, Integer userAge, String userEmail, String userUrl, String userAbout,
			String userHeadImg, Integer userPoints) {
		this.userId = userId;
		this.userNickname = userNickname;
		this.userAge = userAge;
		this.userEmail = userEmail;
		this.userUrl = userUrl;
		this.userAbout = userAbout;
		this.userHeadImg = userHeadImg;
		this.userPoints = userPoints;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getUserNickname() {
		return userNickname;
	}
	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}
	public Integer getUserAge() {
		return userAge;
	}
	public void setUserAge(Integer userAge) {
		this.userAge = userAge;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserUrl() {
		return userUrl;
	}
	public void setUserUrl(String userUrl) {
		this.userUrl = userUrl;
	}
	public String getUserAbout() {
		return userAbout;
	}
	public void setUserAbout(String userAbout) {
		this.userAbout = userAbout;
	}
	public String getUserHeadImg() {
		return userHeadImg;
	}
	public void setUserHeadImg(String userHeadImg) {
		this.userHeadImg = userHeadImg;
	}
	public Integer getUserPoints() {
		return userPoints;
	}
	public void setUserPoints(Integer userPoints) {
		this.userPoints = userPoints;
	}
	@Override
	public String toString() {
		return "Userinfo [userId=" + userId + ", userNickname=" + userNickname + ", userAge=" + userAge + ", userEmail="
				+ userEmail + ", userUrl=" + userUrl + ", userAbout=" + userAbout + ", userHeadImg=" + userHeadImg
				+ ", userPoints=" + userPoints + "]";
	}
	
}
