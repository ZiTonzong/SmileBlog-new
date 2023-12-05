package com.blogcdk.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.blogcdk.model.AccessBlog;
import com.blogcdk.model.BlogDetail;
import com.blogcdk.model.Remark;
import com.blogcdk.model.Reply;
import com.blogcdk.util.PageUtil;

/**
 * �û�����
 * @author cdk
 * @date 2018��8��21��
 */
public interface RemarkMapper {
	
	/**
	 * ���ݲ���id����ò����¹��ж��������ۣ������������Լ������ۺͻظ����۵����ݣ�
	 * @param blogId
	 * @param userId���ߵ�id
	 * @return
	 */
	int calRemarkCountByBlogId(@Param("blogId")int blogId,@Param("userId")int userId);
	
	/**
	 * ���ݲ���id����ò���������������
	 * @param blogId
	 * @return
	 */
	int calAllRemarkCountByBlogId(int blogId);
	
	/**
	 * ���ݲ���id����ò������������ۻظ���
	 * @param blogId
	 * @return
	 */
	int calReplyCountByBlogId(int blogId);
	
	/**
	 * ���ݲ���id������ƪ�����µ���������
	 * @param blogId
	 * @return
	 */
	List<Remark> selectRemarkByBlogId(int blogId);
	
	/**
	 * ���ݲ���id������ƪ�����µ���������,��ҳ��ʾ
	 * @param blogId
	 * @param pageUtil
	 * @return
	 */
	List<Remark> selectPageRemarkByBlogId(@Param("blogId")int blogId,@Param("pageUtil")PageUtil pageUtil);

	
	/**
	 * ��������id��ȡ���������µ����лظ�
	 * @param remarkId
	 * @return
	 */
	List<Reply> selectReplyByRemarkId(int remarkId);
	
	/**
	 * ������۵�remark����
	 * @param remark
	 */
	void insertRemark(Remark remark);
	
	/**
	 * ����������id������۶���
	 * @param fromUserId
	 * @return
	 */
	Remark selectReplyByFromUserId(int fromUserId);
	
	/**
	 * ������۵�reply����
	 * @param remark
	 */
	void insertReply(Reply reply);
	
	/**
	 * ��ȡ�������ۣ��������ظ���
	 * @return
	 */
	List<Remark> selectAllRemarks();
	
	/**
	 * ��ҳ��ȡ�������ۣ��������ظ���
	 * @param pageUtil
	 * @return
	 */
	List<Remark> selectPageRemarks(@Param("pageUtil")PageUtil pageUtil);
}
