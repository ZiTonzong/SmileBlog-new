package com.blogcdk.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blogcdk.dao.BlogMapper;
import com.blogcdk.model.Blog;
import com.blogcdk.model.BlogDetail;
import com.blogcdk.service.BlogService;
import com.blogcdk.util.PageUtil;

@Service
public class BlogServiceImpl implements BlogService{
	@Autowired
	private BlogMapper blogMapper;
	@Override
	public void writeBlog(Blog blog) {
		// TODO Auto-generated method stub
		blogMapper.writeBlog(blog);
	}

	@Override
	public List<Blog> selectAllBlog() {
		// TODO Auto-generated method stub
		return blogMapper.selectAllBlog();
	}

	@Override
	public List<Blog> selectBlogById(int blogId) {
		// TODO Auto-generated method stub
		return blogMapper.selectBlogById(blogId);
	}

	@Override
	public BlogDetail findById(int blogId) {
		// TODO Auto-generated method stub
		return blogMapper.findById(blogId);
	}

	@Override
	public void deleteBlogById(int blogId) {
		// TODO Auto-generated method stub
		blogMapper.deleteBlogById(blogId);
	}

	@Override
	public boolean updateBlog(Blog blog) {
		// TODO Auto-generated method stub
		return blogMapper.updateBlog(blog);
	}

	@Override
	public List<Blog> selectRecommendBlogs(int recommend, int recommendNum) {
		// TODO Auto-generated method stub
		return blogMapper.selectRecommendBlogs(recommend, recommendNum);
	}

	@Override
	public List<BlogDetail> selectPageCategoryBlogs(int categoryId, PageUtil pageUtil) {
		// TODO Auto-generated method stub
		return blogMapper.selectPageCategoryBlogs(categoryId, pageUtil);
	}

	@Override
	public List<Blog> selectPageBlogsByKeywords(String keywords, PageUtil pageUtil) {
		// TODO Auto-generated method stub
		return blogMapper.selectPageBlogsByKeywords(keywords, pageUtil);
	}

	@Override
	public List<Blog> selectBlogsByReadNum(int categoryId,int num) {
		// TODO Auto-generated method stub
		return blogMapper.selectBlogsByReadNum(categoryId,num);
	}

	@Override
	public int calBlogCountByCategory(int categoryId) {
		// TODO Auto-generated method stub
		return blogMapper.calBlogCountByCategory(categoryId);
	}

	@Override
	public int calBlogCountByKeywords(String keywords) {
		// TODO Auto-generated method stub
		return blogMapper.calBlogCountByKeywords(keywords);
	}

	@Override
	public List<Blog> selectBlogsByTime(int categoryId, int num) {
		// TODO Auto-generated method stub
		return blogMapper.selectBlogsByTime(categoryId, num);
	}

	@Override
	public List<BlogDetail> selectBlogDetailByTime(int categoryId, int num) {
		// TODO Auto-generated method stub
		return blogMapper.selectBlogDetailByTime(categoryId, num);
	}

	@Override
	public int calBlogCountByUser(int userId) {
		// TODO Auto-generated method stub
		return blogMapper.calBlogCountByUser(userId);
	}

	@Override
	public boolean updateBlogReadNum(int readNum, int blogId) {
		// TODO Auto-generated method stub
		return blogMapper.updateBlogReadNum(readNum, blogId);
	}

	@Override
	public List<Blog> selectPageBlogsByUserId(int userId, PageUtil pageUtil) {
		// TODO Auto-generated method stub
		return blogMapper.selectPageBlogsByUserId(userId, pageUtil);
	}

	@Override
	public int calBlogsNum() {
		// TODO Auto-generated method stub
		return blogMapper.calBlogsNum();
	}

	@Override
	public List<BlogDetail> selectAllBlogDetail(PageUtil pageUtil) {
		// TODO Auto-generated method stub
		return blogMapper.selectAllBlogDetail(pageUtil);
	}

}
