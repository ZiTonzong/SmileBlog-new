package com.blogcdk.dao;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.blogcdk.model.AccessBlog;
import com.blogcdk.model.Blog;
import com.blogcdk.model.BlogDetail;
import com.blogcdk.util.PageUtil;

public interface BlogMapper {
	  /*******�Բ��ͷ��ʱ�Ĳ���********/
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
	List<AccessBlog> selectAccessBlogIdOrIp(@Param("userId")int userId,@Param("ip")String ip,@Param("blogId")int blogId);
	
	/**
	 * ���������¼
	 * @param accessBlog
	 */
	void insertAccessBlog(AccessBlog accessBlog);
	/*******�Բ��ͷ��ʱ�Ĳ���END********/
		
	//��������
		void writeBlog(Blog blog);
		//����ȫ������
		List<Blog> selectAllBlog();
		//����id��ѯ
		List<Blog> selectBlogById(int blogId);
		//����id��ѯ
		BlogDetail findById(int blogId);
		//ɾ������
		void deleteBlogById(int blogId);
		//��������
		boolean updateBlog(Blog blog);
		
		/**
		 *  by cdk
		 */
		/**
		 * �����Ƽ����� recommend=1�Ƽ� recommend=0�����Ƽ�λ
		 * @param recommend
		 * @param recommendNum չʾ����������
		 * @return
		 */
		List<Blog> selectRecommendBlogs(@Param("recommend")int recommend,@Param("recommendNum")int recommendNum);
		
		/**
		 * ������ط������£���ҳ��ʾ  0-�Ƽ�����  1-��������   2-ÿ��һЦ   3-���Ѷ���
		 * @param categoryId
		 * @return
		 */
		List<BlogDetail> selectPageCategoryBlogs(@Param("categoryId")int categoryId,@Param("pageUtil")PageUtil pageUtil);
		
		/**
		 * ���ݱ���������ݹؼ��ʲ���������£���ҳ��ʾ
		 * mybatis��ѯ�����м��� ʵ����������л������Ͳ��� �������
		 * ʹ��Paramע��
 		 * @param keywords
		 * @return
		 */
		List<Blog> selectPageBlogsByKeywords(@Param("keywords")String keywords,@Param("pageUtil")PageUtil pageUtil);
		
		/**
		 * �����Ķ���ȡ�Ķ����ϸߵļ�ƪ����
		 * @param categoryId ���������
		 * @param num ��Ҫչʾ�����������
		 * @return
		 */
		List<Blog> selectBlogsByReadNum(@Param("categoryId")int categoryId,@Param("num")int num);
		
		/**
		 * ���ݷ���ʱ��ȡ����ļ�ƪ���£��������µ�������Ϣ��
		 * @param categoryId
		 * @param num
		 * @return
		 */
		List<BlogDetail> selectBlogDetailByTime(@Param("categoryId")int categoryId,@Param("num")int num);
		
		/**
		 * ���ݷ���ʱ��ȡ����ļ�ƪ����
		 * @param categoryId
		 * @param num
		 * @return
		 */
		List<Blog> selectBlogsByTime(@Param("categoryId")int categoryId,@Param("num")int num);
		
		/**
		 * ����ÿһ���͵����µ�����
		 * @param categoryId
		 * @return
		 */
		int calBlogCountByCategory(int categoryId);
		
		/**
		 * ������������������
		 * @param keywords
		 * @return
		 */
		int calBlogCountByKeywords(String keywords);
		
		/**
		 * ��������id��������׫д�Ĳ�������
		 * @param userId
		 * @return
		 */
		int calBlogCountByUser(int userId);
		
		//���������Ķ�����
		boolean updateBlogReadNum(@Param("readNum")int readNum,@Param("blogId")int blogId);
		
		/**
		 * �����û�id��ҳ��ȡ�����в���
		 * @param categoryId
		 * @return
		 */
		List<Blog> selectPageBlogsByUserId(@Param("userId")int userId,@Param("pageUtil")PageUtil pageUtil);	
		
		/**
		 * ������������
		 * @return
		 */
		int calBlogsNum();
		
		/**
		 * ��ҳ����ȫ��������ϸ��Ϣ
		 * @return
		 */
		List<BlogDetail> selectAllBlogDetail(@Param("pageUtil")PageUtil pageUtil);
}