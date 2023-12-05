package com.blogcdk.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.blogcdk.model.AccessBlog;
import com.blogcdk.model.BlogDetail;
import com.blogcdk.model.Remark;
import com.blogcdk.model.Reply;
import com.blogcdk.util.PageUtil;

/**
 * 用户评论
 * @author cdk
 * @date 2018年8月21日
 */
public interface RemarkMapper {
	
	/**
	 * 根据博客id计算该博客下共有多少条评论（不包括作者自己的评论和回复评论的内容）
	 * @param blogId
	 * @param userId作者的id
	 * @return
	 */
	int calRemarkCountByBlogId(@Param("blogId")int blogId,@Param("userId")int userId);
	
	/**
	 * 根据博客id计算该博客下所有评论数
	 * @param blogId
	 * @return
	 */
	int calAllRemarkCountByBlogId(int blogId);
	
	/**
	 * 根据博客id计算该博客下所有评论回复数
	 * @param blogId
	 * @return
	 */
	int calReplyCountByBlogId(int blogId);
	
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
	List<Remark> selectPageRemarkByBlogId(@Param("blogId")int blogId,@Param("pageUtil")PageUtil pageUtil);

	
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
	 * 根据评论者id获得评论对象
	 * @param fromUserId
	 * @return
	 */
	Remark selectReplyByFromUserId(int fromUserId);
	
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
	List<Remark> selectPageRemarks(@Param("pageUtil")PageUtil pageUtil);
}
