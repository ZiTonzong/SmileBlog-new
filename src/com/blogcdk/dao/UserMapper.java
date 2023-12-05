package com.blogcdk.dao;

import com.blogcdk.model.BlogDetail;
import com.blogcdk.model.User;
import com.blogcdk.model.Userinfo;
import com.blogcdk.util.PageUtil;

import java.util.List;
import java.util.Set;

import org.apache.ibatis.annotations.Param;

public interface UserMapper {
   //添加用户
	public void insertUser(User user);
	//根据用户名和密码查询用户
	public User findUserByNameAndPwd(@Param("username") String username,@Param("password") String password);
	//更新用户
	boolean updateUser(User user);
	//根据用户id删除用户
	boolean delete(int userId);
	//根据用户id查询用户
	User findById(int userId);
	//根据code查询用户
	User findByCode(String code);
	//查询所有用户
	List<User> findAllUsers();
	//根据用户名查找用户
	User selectUserByUsername(String username);
	
	List<User> selectUserByUsernameOfReg(String username);
	//根据用户名查找角色
	Set<String> selectRolesByUsername(String username);
	//根据用户名查找权限
	Set<String> selectPermissionByUsername(String username);
	
	
	/**
	 * 更新用户积分
	 * @param user
	 * @return
	 */
	boolean updateUserInfoPonits(@Param("userPoints")int userPoints,@Param("userId")int userId);
	
	/**
	 * 根据用户id查询用户具体资料
	 * @param userId
	 * @return
	 */
	Userinfo findUserinfoById(int userId);
	
	/**
	 * 添加用户个人资料
	 * @param userinfo
	 */
	public void insertUserinfo(Userinfo userinfo);
	
	/**
	 * 更新用户信息
	 * @param userinfo
	 * @return
	 */
	boolean updateUserInfo(Userinfo userinfo);
	
	/**
	 * 根据管理员登录名查找管理员
	 * @param adminName
	 * @return
	 */
	User selectAdminByAdminName(String adminName);
	
	/**
	 * 计算用户总数
	 * @return
	 */
	int calAllUserAndAdminNum();
	
	/**
	 * 查找所有用户具体信息
	 * @return
	 */
	List<Userinfo> findAllUserinfo();
	
	/**
	 * 分页查找全部用户
	 * @return
	 */
	List<User> selectPageAllUser(@Param("pageUtil")PageUtil pageUtil);
}