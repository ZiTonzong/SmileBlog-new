package com.blogcdk.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.blogcdk.model.Remark;
import com.blogcdk.model.Reply;
import com.blogcdk.util.PageUtil;

public interface RemarkService {
	/**
	 * ���ݲ���id����ò��������������������ۻظ���
	 * @param BlogId
	 * @return
	 */
	int calRemarkAndReplyByBlogId(int blogId);
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
	List<Remark> selectPageRemarkByBlogId(int blogId,PageUtil pageUtil);
	
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
	List<Remark> selectPageRemarks(PageUtil pageUtil);
}
