package com.blogcdk.model;
/**
 * 除了reply表中的内容，还包括了回复者的昵称和头像
 * @author cdk
 * @date 2018年8月22日
 * protected int replyId;
	protected int blogId;
	protected int remarkId;
	protected String replyContent;
	protected String replyTime;
	protected int fromUserId; //回复的作者
	protected int toUserId; //回复的对象
 */
public class ReplyDetail extends Reply{
	private String replyUserNickname;
	private String replyUserHeadImg;
	private String toUserNickname;
	public ReplyDetail(){
		
	}
	public ReplyDetail(Reply reply,String replyUserNickname,String replyUserHeadImg,String toUserNickname){
		this.replyId = reply.getReplyId();
		this.blogId = reply.getBlogId();
		this.remarkId = reply.getRemarkId();
		this.content = reply.getContent();
		this.time = reply.getTime();
		this.fromUserId = reply.getFromUserId();
		this.toUserId = reply.getToUserId();
		this.replyUserNickname = replyUserNickname;
		this.replyUserHeadImg = replyUserHeadImg;
		this.toUserNickname = toUserNickname;
	}
	
	public String getReplyUserNickname() {
		return replyUserNickname;
	}
	public void setReplyUserNickname(String replyUserNickname) {
		this.replyUserNickname = replyUserNickname;
	}
	public String getReplyUserHeadImg() {
		return replyUserHeadImg;
	}
	public void setReplyUserHeadImg(String replyUserHeadImg) {
		this.replyUserHeadImg = replyUserHeadImg;
	}
	public String getToUserNickname() {
		return toUserNickname;
	}
	public void setToUserNickname(String toUserNickname) {
		this.toUserNickname = toUserNickname;
	}
	/*@Override
	public String toString() {
		return "ReplyDetail [replyUserNickname=" + replyUserNickname + ", replyUserHeadImg=" + replyUserHeadImg
				+ ", toUserNickname=" + toUserNickname + "]";
	}*/
	
	
	
}
