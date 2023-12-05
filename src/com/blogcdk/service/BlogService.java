package com.blogcdk.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.blogcdk.model.Blog;
import com.blogcdk.model.BlogDetail;
import com.blogcdk.util.PageUtil;

public interface BlogService {
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
	List<Blog> selectRecommendBlogs(int recommend,int recommendNum);
	
	/**
	 * ������ط������£���ҳ��ʾ  0-�Ƽ�����  1-��������   2-���Ѷ���   3-ÿ��һЦ
	 * @param categoryId
	 * @return
	 */
	List<BlogDetail> selectPageCategoryBlogs(int categoryId,PageUtil pageUtil);
	
	/**
	 * ���ݱ���������ݹؼ��ʲ���������£���ҳ��ʾ
	 * mybatis��ѯ�����м��� ʵ����������л������Ͳ��� �������
	 * @param keywords
	 * @return
	 */
	List<Blog> selectPageBlogsByKeywords(String keywords,PageUtil pageUtil);
	
	/**
	 * �����Ķ���ȡ�Ķ����ϸߵļ�ƪ����
	 * @param num ��Ҫչʾ�����������
	 * @return
	 */
	List<Blog> selectBlogsByReadNum(int categoryId,int num);
	
	/**
	 * ���ݷ���ʱ��ȡ����ļ�ƪ����
	 * @param categoryId
	 * @param num
	 * @return
	 */
	List<Blog> selectBlogsByTime(int categoryId,int num);
	
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
	 * ���ݷ���ʱ��ȡ����ļ�ƪ���£��������µ�������Ϣ��
	 * @param categoryId
	 * @param num
	 * @return
	 */
	List<BlogDetail> selectBlogDetailByTime(int categoryId,int num);
	
	/**
	 * ��������id��������׫д�Ĳ�������
	 * @param userId
	 * @return
	 */
	int calBlogCountByUser(int userId);
	
	/**
	 * ���������Ķ�����
	 * @param readNum
	 * @param blogId
	 * @return
	 */
	boolean updateBlogReadNum(@Param("readNum")int readNum,@Param("blogId")int blogId);
	
	/**
	 * �����û�id��ҳ��ȡ�����в���
	 * @param categoryId
	 * @return
	 */
	List<Blog> selectPageBlogsByUserId(int userId,PageUtil pageUtil);
	
	/**
	 * ������������
	 * @return
	 */
	int calBlogsNum();
	
	/**
	 * ��ҳ����ȫ��������ϸ��Ϣ
	 * @return
	 */
	List<BlogDetail> selectAllBlogDetail(PageUtil pageUtil);
}
