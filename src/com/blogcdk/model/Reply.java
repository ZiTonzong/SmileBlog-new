package com.blogcdk.model;
/**
 * �ظ�����
 * @author cdk
 * @date 2018��8��22��
 */
public class Reply {
	protected int replyId;
	protected int blogId;
	protected int remarkId;
	protected String content;
	protected String time;
	protected int fromUserId; //�ظ�������
	protected int toUserId; //�ظ��Ķ���
	public int getReplyId() {
		return replyId;
	}
	public void setReplyId(int replyId) {
		this.replyId = replyId;
	}
	public int getBlogId() {
		return blogId;
	}
	public void setBlogId(int blogId) {
		this.blogId = blogId;
	}
	public int getRemarkId() {
		return remarkId;
	}
	public void setRemarkId(int remarkId) {
		this.remarkId = remarkId;
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
	public int getToUserId() {
		return toUserId;
	}
	public void setToUserId(int toUserId) {
		this.toUserId = toUserId;
	}
	@Override
	public String toString() {
		return "Reply [replyId=" + replyId + ", blogId=" + blogId + ", remarkId=" + remarkId + ", content=" + content
				+ ", time=" + time + ", fromUserId=" + fromUserId + ", toUserId=" + toUserId + "]";
	}
	
	
}
