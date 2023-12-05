package com.blogcdk.model;
/**
 * 包括了一些关于作者信息的博客
 * @author cdk
 * @date 2018年8月19日
 */
public class BlogDetail extends Blog{
	private String userNickname;
	private int userPoints;
	private String userHeadImg;
	private String userAbout;
	private Integer blogId;

    private String blogTitle;
    
    private String blogDesc;

    private String article;

    private String time;

    private Integer fromUserId;

    private Integer categoryId;

    private Integer readNum;

    private String coverImage;
    
    private Integer recommend;
	
	public String getUserNickname() {
		return userNickname;
	}
	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}
	public int getUserPoints() {
		return userPoints;
	}
	public void setUserPoints(int userPoints) {
		this.userPoints = userPoints;
	}
	public String getUserHeadImg() {
		return userHeadImg;
	}
	public void setUserHeadImg(String userHeadImg) {
		this.userHeadImg = userHeadImg;
	}
	public String getUserAbout() {
		return userAbout;
	}
	public void setUserAbout(String userAbout) {
		this.userAbout = userAbout;
	}
	public Integer getBlogId() {
		return blogId;
	}
	public void setBlogId(Integer blogId) {
		this.blogId = blogId;
	}
	public String getBlogTitle() {
		return blogTitle;
	}
	public void setBlogTitle(String blogTitle) {
		this.blogTitle = blogTitle;
	}
	public String getArticle() {
		return article;
	}
	public void setArticle(String article) {
		this.article = article;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public Integer getFromUserId() {
		return fromUserId;
	}
	public void setFromUserId(Integer fromUserId) {
		this.fromUserId = fromUserId;
	}
	public Integer getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}
	public Integer getReadNum() {
		return readNum;
	}
	public void setReadNum(Integer readNum) {
		this.readNum = readNum;
	}
	public String getCoverImage() {
		return coverImage;
	}
	public void setCoverImage(String coverImage) {
		this.coverImage = coverImage;
	}
	public Integer getRecommend() {
		return recommend;
	}
	public void setRecommend(Integer recommend) {
		this.recommend = recommend;
	}
	public String getBlogDesc() {
		return blogDesc;
	}
	public void setBlogDesc(String blogDesc) {
		this.blogDesc = blogDesc;
	}
	@Override
	public String toString() {
		return "BlogDetail [userNickname=" + userNickname + ", userPoints=" + userPoints + ", userHeadImg="
				+ userHeadImg + ", userAbout=" + userAbout + ", blogId=" + blogId + ", blogTitle=" + blogTitle
				+ ", blogDesc=" + blogDesc + ", article=" + article + ", time=" + time + ", fromUserId=" + fromUserId
				+ ", categoryId=" + categoryId + ", readNum=" + readNum + ", coverImage=" + coverImage + ", recommend="
				+ recommend + "]";
	}
	
	
	
}
