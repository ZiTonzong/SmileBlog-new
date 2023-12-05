package com.blogcdk.model;

import java.util.List;

/**
 * 评论类，表示一篇文章下的一个评论及对该评论的若干回复
 * 对应数据库中的remark和ReplyDetail表
 * @author cdk
 * @date 2018年8月22日
 */
public class Comment {
	private int remarkId;
	private int blogId;
	private String content;
	private String time;
	private int fromUserId;
	private String remNickname; //新增评论者的昵称、头像地址
	private String remHeadImg;
	private List<ReplyDetail> replyDetails; //评论的回复
	
	public Comment(){
		
	}
	
	public Comment(Remark remark,List<ReplyDetail> replies,String remNickname,String remHeadImg){
		remarkId = remark.getRemarkId();
		blogId = remark.getBlogId();
		content = remark.getContent();
		time = remark.getTime();
		fromUserId = remark.getFromUserId();
		replyDetails = replies;
		this.remNickname = remNickname;
		this.remHeadImg = remHeadImg;
	}
	
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
	public List<ReplyDetail> getReplyDetails() {
		return replyDetails;
	}
	public void setReplyDetails(List<ReplyDetail> ReplyDetails) {
		this.replyDetails = ReplyDetails;
	}
	
	public String getRemNickname() {
		return remNickname;
	}

	public void setRemNickname(String remNickname) {
		this.remNickname = remNickname;
	}

	public String getRemHeadImg() {
		return remHeadImg;
	}

	public void setRemHeadImg(String remHeadImg) {
		this.remHeadImg = remHeadImg;
	}

	@Override
	public String toString() {
		return "Comment [remarkId=" + remarkId + ", blogId=" + blogId + ", content=" + content + ", time=" + time
				+ ", fromUserId=" + fromUserId + ", remNickname=" + remNickname + ", remHeadImg=" + remHeadImg
				+ ", replyDetails=" + replyDetails + "]";
	}

	
	
}
