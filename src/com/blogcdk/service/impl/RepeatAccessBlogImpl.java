package com.blogcdk.service.impl;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blogcdk.dao.BlogMapper;
import com.blogcdk.model.AccessBlog;
import com.blogcdk.service.RepeatAccessBlog;
@Service
public class RepeatAccessBlogImpl implements RepeatAccessBlog{
	@Autowired
	private BlogMapper blogMapper;
	@Override
	public void delAccessBlogByTime(Date accessDate) {
		// TODO Auto-generated method stub
		blogMapper.delAccessBlogByTime(accessDate);
	}
	@Override
	public List<AccessBlog> selectAccessBlogIdOrIp(int userId, String ip,int blogId) {
		// TODO Auto-generated method stub
		return blogMapper.selectAccessBlogIdOrIp(userId, ip,blogId);
	}
	@Override
	public void insertAccessBlog(AccessBlog accessBlog) {
		// TODO Auto-generated method stub
		blogMapper.insertAccessBlog(accessBlog);
	}

}
