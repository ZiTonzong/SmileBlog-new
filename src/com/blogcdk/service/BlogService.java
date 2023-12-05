package com.blogcdk.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.blogcdk.model.Blog;
import com.blogcdk.model.BlogDetail;
import com.blogcdk.util.PageUtil;

public interface BlogService {
	 //增加文章
	void writeBlog(Blog blog);
	//查找全部文章
	List<Blog> selectAllBlog();
	//根据id查询
	List<Blog> selectBlogById(int blogId);
	//根据id查询
	BlogDetail findById(int blogId);
	//删除文章
	void deleteBlogById(int blogId);
	//更新文章
	boolean updateBlog(Blog blog);
	
	/**
	 *  by cdk
	 */
	/**
	 * 查找推荐文章 recommend=1推荐 recommend=0不在推荐位
	 * @param recommend
	 * @param recommendNum 展示的文章数量
	 * @return
	 */
	List<Blog> selectRecommendBlogs(int recommend,int recommendNum);
	
	/**
	 * 查找相关分类文章，分页显示  0-科技博客  1-倾听世界   2-叫醒耳朵   3-每日一笑
	 * @param categoryId
	 * @return
	 */
	List<BlogDetail> selectPageCategoryBlogs(int categoryId,PageUtil pageUtil);
	
	/**
	 * 根据标题或者内容关键词查找相关文章，分页显示
	 * mybatis查询参数中既有 实体类参数又有基本类型参数 解决方案
	 * @param keywords
	 * @return
	 */
	List<Blog> selectPageBlogsByKeywords(String keywords,PageUtil pageUtil);
	
	/**
	 * 根据阅读量取阅读量较高的几篇文章
	 * @param num 需要展示的数据项个数
	 * @return
	 */
	List<Blog> selectBlogsByReadNum(int categoryId,int num);
	
	/**
	 * 根据发表时间取最近的几篇文章
	 * @param categoryId
	 * @param num
	 * @return
	 */
	List<Blog> selectBlogsByTime(int categoryId,int num);
	
	/**
	 * 计算每一类型的文章的总数
	 * @param categoryId
	 * @return
	 */
	int calBlogCountByCategory(int categoryId);
	
	/**
	 * 计算出搜索结果的总数
	 * @param keywords
	 * @return
	 */
	int calBlogCountByKeywords(String keywords);
	
	/**
	 * 根据发表时间取最近的几篇文章（包括文章的作者信息）
	 * @param categoryId
	 * @param num
	 * @return
	 */
	List<BlogDetail> selectBlogDetailByTime(int categoryId,int num);
	
	/**
	 * 根据作者id计算作者撰写的博客总数
	 * @param userId
	 * @return
	 */
	int calBlogCountByUser(int userId);
	
	/**
	 * 更新文章阅读数量
	 * @param readNum
	 * @param blogId
	 * @return
	 */
	boolean updateBlogReadNum(@Param("readNum")int readNum,@Param("blogId")int blogId);
	
	/**
	 * 根据用户id分页获取其所有博客
	 * @param categoryId
	 * @return
	 */
	List<Blog> selectPageBlogsByUserId(int userId,PageUtil pageUtil);
	
	/**
	 * 计算文章总数
	 * @return
	 */
	int calBlogsNum();
	
	/**
	 * 分页查找全部文章详细信息
	 * @return
	 */
	List<BlogDetail> selectAllBlogDetail(PageUtil pageUtil);
}
