package com.blogcdk.service;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.blogcdk.model.AccessBlog;

/**
 * ����ɾ��1����ǰ�ķ��ʼ�¼
 * @author cdk
 * @date 2018��8��21��
 */
public interface RepeatAccessBlog {
	/**
     * ����ɾ��1����ǰ�Ĳ��ͷ��ʼ�¼
     * @param accessDate
     */
	void delAccessBlogByTime(Date accessDate);
	/**
	 * ����
	 * @param userId
	 * @param ip
	 * @return
	 */
	List<AccessBlog> selectAccessBlogIdOrIp(int userId,String ip,int blogId);
	
	/**
	 * ���������¼
	 * @param accessBlog
	 */
	void insertAccessBlog(AccessBlog accessBlog);
	
}
