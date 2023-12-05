package com.blogcdk.service;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.blogcdk.model.AccessBlog;

/**
 * 用于删除1天以前的访问记录
 * @author cdk
 * @date 2018年8月21日
 */
public interface RepeatAccessBlog {
	/**
     * 用来删除1天以前的博客访问记录
     * @param accessDate
     */
	void delAccessBlogByTime(Date accessDate);
	/**
	 * 查找
	 * @param userId
	 * @param ip
	 * @return
	 */
	List<AccessBlog> selectAccessBlogIdOrIp(int userId,String ip,int blogId);
	
	/**
	 * 新增浏览记录
	 * @param accessBlog
	 */
	void insertAccessBlog(AccessBlog accessBlog);
	
}
