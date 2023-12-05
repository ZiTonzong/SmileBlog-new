package com.blogcdk.dao;

import com.blogcdk.model.BlogDetail;
import com.blogcdk.model.User;
import com.blogcdk.model.Userinfo;
import com.blogcdk.util.PageUtil;

import java.util.List;
import java.util.Set;

import org.apache.ibatis.annotations.Param;

public interface UserMapper {
   //����û�
	public void insertUser(User user);
	//�����û����������ѯ�û�
	public User findUserByNameAndPwd(@Param("username") String username,@Param("password") String password);
	//�����û�
	boolean updateUser(User user);
	//�����û�idɾ���û�
	boolean delete(int userId);
	//�����û�id��ѯ�û�
	User findById(int userId);
	//����code��ѯ�û�
	User findByCode(String code);
	//��ѯ�����û�
	List<User> findAllUsers();
	//�����û��������û�
	User selectUserByUsername(String username);
	
	List<User> selectUserByUsernameOfReg(String username);
	//�����û������ҽ�ɫ
	Set<String> selectRolesByUsername(String username);
	//�����û�������Ȩ��
	Set<String> selectPermissionByUsername(String username);
	
	
	/**
	 * �����û�����
	 * @param user
	 * @return
	 */
	boolean updateUserInfoPonits(@Param("userPoints")int userPoints,@Param("userId")int userId);
	
	/**
	 * �����û�id��ѯ�û���������
	 * @param userId
	 * @return
	 */
	Userinfo findUserinfoById(int userId);
	
	/**
	 * ����û���������
	 * @param userinfo
	 */
	public void insertUserinfo(Userinfo userinfo);
	
	/**
	 * �����û���Ϣ
	 * @param userinfo
	 * @return
	 */
	boolean updateUserInfo(Userinfo userinfo);
	
	/**
	 * ���ݹ���Ա��¼�����ҹ���Ա
	 * @param adminName
	 * @return
	 */
	User selectAdminByAdminName(String adminName);
	
	/**
	 * �����û�����
	 * @return
	 */
	int calAllUserAndAdminNum();
	
	/**
	 * ���������û�������Ϣ
	 * @return
	 */
	List<Userinfo> findAllUserinfo();
	
	/**
	 * ��ҳ����ȫ���û�
	 * @return
	 */
	List<User> selectPageAllUser(@Param("pageUtil")PageUtil pageUtil);
}