package com.blogcdk.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blogcdk.dao.RemarkMapper;
import com.blogcdk.model.Remark;
import com.blogcdk.model.Reply;
import com.blogcdk.service.RemarkService;
import com.blogcdk.util.PageUtil;
@Service
public class RemarkServiceImpl implements RemarkService{
	@Autowired
	private RemarkMapper remarkMapper;
	@Override
	public int calRemarkAndReplyByBlogId(int blogId) {
		// TODO Auto-generated method stub
		return remarkMapper.calAllRemarkCountByBlogId(blogId)+remarkMapper.calReplyCountByBlogId(blogId);
	}
	@Override
	public List<Remark> selectRemarkByBlogId(int blogId) {
		// TODO Auto-generated method stub
		return remarkMapper.selectRemarkByBlogId(blogId);
	}
	@Override
	public List<Reply> selectReplyByRemarkId(int remarkId) {
		// TODO Auto-generated method stub
		return remarkMapper.selectReplyByRemarkId(remarkId);
	}
	@Override
	public List<Remark> selectPageRemarkByBlogId(int blogId, PageUtil pageUtil) {
		// TODO Auto-generated method stub
		return remarkMapper.selectPageRemarkByBlogId(blogId, pageUtil);
	}
	@Override
	public void insertRemark(Remark remark) {
		// TODO Auto-generated method stub
		remarkMapper.insertRemark(remark);
	}
	@Override
	public void insertReply(Reply reply) {
		// TODO Auto-generated method stub
		remarkMapper.insertReply(reply);
	}
	
	@Override
	public List<Remark> selectAllRemarks() {
		// TODO Auto-generated method stub
		return remarkMapper.selectAllRemarks();
	}
	@Override
	public List<Remark> selectPageRemarks(PageUtil pageUtil) {
		// TODO Auto-generated method stub
		return remarkMapper.selectPageRemarks(pageUtil);
	}

}
