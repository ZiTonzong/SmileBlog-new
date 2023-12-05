package com.blogcdk.dao;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.blogcdk.model.AccessBlog;
import com.blogcdk.model.Blog;
import com.blogcdk.model.BlogDetail;
import com.blogcdk.util.PageUtil;

public interface BlogMapper {
	  /*******对博客访问表的操作********/
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
	List<AccessBlog> selectAccessBlogIdOrIp(@Param("userId")int userId,@Param("ip")String ip,@Param("blogId")int blogId);
	
	/**
	 * 新增浏览记录
	 * @param accessBlog
	 */
	void insertAccessBlog(AccessBlog accessBlog);
	/*******对博客访问表的操作END********/
		
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
		List<Blog> selectRecommendBlogs(@Param("recommend")int recommend,@Param("recommendNum")int recommendNum);
		
		/**
		 * 查找相关分类文章，分页显示  0-科技博客  1-倾听世界   2-每日一笑   3-叫醒耳朵
		 * @param categoryId
		 * @return
		 */
		List<BlogDetail> selectPageCategoryBlogs(@Param("categoryId")int categoryId,@Param("pageUtil")PageUtil pageUtil);
		
		/**
		 * 根据标题或者内容关键词查找相关文章，分页显示
		 * mybatis查询参数中既有 实体类参数又有基本类型参数 解决方案
		 * 使用Param注解
 		 * @param keywords
		 * @return
		 */
		List<Blog> selectPageBlogsByKeywords(@Param("keywords")String keywords,@Param("pageUtil")PageUtil pageUtil);
		
		/**
		 * 根据阅读量取阅读量较高的几篇文章
		 * @param categoryId 博客类别编号
		 * @param num 需要展示的数据项个数
		 * @return
		 */
		List<Blog> selectBlogsByReadNum(@Param("categoryId")int categoryId,@Param("num")int num);
		
		/**
		 * 根据发表时间取最近的几篇文章（包括文章的作者信息）
		 * @param categoryId
		 * @param num
		 * @return
		 */
		List<BlogDetail> selectBlogDetailByTime(@Param("categoryId")int categoryId,@Param("num")int num);
		
		/**
		 * 根据发表时间取最近的几篇文章
		 * @param categoryId
		 * @param num
		 * @return
		 */
		List<Blog> selectBlogsByTime(@Param("categoryId")int categoryId,@Param("num")int num);
		
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
		 * 根据作者id计算作者撰写的博客总数
		 * @param userId
		 * @return
		 */
		int calBlogCountByUser(int userId);
		
		//更新文章阅读数量
		boolean updateBlogReadNum(@Param("readNum")int readNum,@Param("blogId")int blogId);
		
		/**
		 * 根据用户id分页获取其所有博客
		 * @param categoryId
		 * @return
		 */
		List<Blog> selectPageBlogsByUserId(@Param("userId")int userId,@Param("pageUtil")PageUtil pageUtil);	
		
		/**
		 * 计算文章总数
		 * @return
		 */
		int calBlogsNum();
		
		/**
		 * 分页查找全部文章详细信息
		 * @return
		 */
		List<BlogDetail> selectAllBlogDetail(@Param("pageUtil")PageUtil pageUtil);
}