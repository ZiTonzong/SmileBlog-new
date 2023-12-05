package com.blogcdk.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.blogcdk.model.Remark;
import com.blogcdk.model.Reply;
import com.blogcdk.util.PageUtil;

public interface RemarkService {
	/**
	 * 根据博客id计算该博客下所有评论数和评论回复数
	 * @param BlogId
	 * @return
	 */
	int calRemarkAndReplyByBlogId(int blogId);
	/**
	 * 根据博客id查找这篇博客下的所有评论
	 * @param blogId
	 * @return
	 */
	List<Remark> selectRemarkByBlogId(int blogId);
	
	/**
	 * 根据博客id查找这篇博客下的所有评论,分页显示
	 * @param blogId
	 * @param pageUtil
	 * @return
	 */
	List<Remark> selectPageRemarkByBlogId(int blogId,PageUtil pageUtil);
	
	/**
	 * 根据评论id获取该条评论下的所有回复
	 * @param remarkId
	 * @return
	 */
	List<Reply> selectReplyByRemarkId(int remarkId);
	
	/**
	 * 添加评论到remark表中
	 * @param remark
	 */
	void insertRemark(Remark remark);
	
	/**
	 * 添加评论到reply表中
	 * @param remark
	 */
	void insertReply(Reply reply);
	
	/**
	 * 获取所有评论（不包含回复）
	 * @return
	 */
	List<Remark> selectAllRemarks();
	
	/**
	 * 分页获取所有评论（不包含回复）
	 * @param pageUtil
	 * @return
	 */
	List<Remark> selectPageRemarks(PageUtil pageUtil);
}
