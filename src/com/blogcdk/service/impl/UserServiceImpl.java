package com.blogcdk.service.impl;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blogcdk.dao.UserMapper;
import com.blogcdk.model.User;
import com.blogcdk.model.Userinfo;
import com.blogcdk.service.UserService;
import com.blogcdk.util.PageUtil;
@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private UserMapper userMapper;
	@Override
	public void insertUser(User user) {
		// TODO Auto-generated method stub
		userMapper.insertUser(user);
	}

	@Override
	public User login(String username, String password) {
		// TODO Auto-generated method stub
		return userMapper.findUserByNameAndPwd(username, password);
	}

	@Override
	public boolean updateUser(User user) {
		// TODO Auto-generated method stub
		return userMapper.updateUser(user);
	}

	@Override
	public boolean delete(int userId) {
		// TODO Auto-generated method stub
		return userMapper.delete(userId);
	}

	@Override
	public User findById(int userId) {
		// TODO Auto-generated method stub
		return userMapper.findById(userId);
	}

	@Override
	public User findByCode(String code) {
		// TODO Auto-generated method stub
		return userMapper.findByCode(code);
	}

	@Override
	public List<User> findAllUsers() {
		// TODO Auto-generated method stub
		return userMapper.findAllUsers();
	}

	@Override
	public User selectUserByUsername(String username) {
		// TODO Auto-generated method stub
		return userMapper.selectUserByUsername(username);
	}

	@Override
	public List<User> selectUserByUsernameOfReg(String username) {
		// TODO Auto-generated method stub
		return userMapper.selectUserByUsernameOfReg(username);
	}

	@Override
	public Set<String> selectRolesByUsername(String username) {
		// TODO Auto-generated method stub
		return userMapper.selectRolesByUsername(username);
	}

	@Override
	public Set<String> selectPermissionByUsername(String username) {
		// TODO Auto-generated method stub
		return userMapper.selectPermissionByUsername(username);
	}

	@Override
	public boolean updateUserInfoPonits(int userPoints, int userId) {
		// TODO Auto-generated method stub
		return userMapper.updateUserInfoPonits(userPoints, userId);
	}

	@Override
	public Userinfo findUserinfoById(int userId) {
		// TODO Auto-generated method stub
		return userMapper.findUserinfoById(userId);
	}

	@Override
	public void insertUserinfo(Userinfo userinfo) {
		// TODO Auto-generated method stub
		userMapper.insertUserinfo(userinfo);
	}

	@Override
	public boolean updateUserInfo(Userinfo userinfo) {
		// TODO Auto-generated method stub
		return userMapper.updateUserInfo(userinfo);
	}

	@Override
	public User selectAdminByAdminName(String adminName) {
		// TODO Auto-generated method stub
		return userMapper.selectAdminByAdminName(adminName);
	}

	@Override
	public int calAllUserAndAdminNum() {
		// TODO Auto-generated method stub
		return userMapper.calAllUserAndAdminNum();
	}

	@Override
	public List<Userinfo> findAllUserinfo() {
		// TODO Auto-generated method stub
		return userMapper.findAllUserinfo();
	}

	@Override
	public List<User> selectPageAllUser(PageUtil pageUtil) {
		// TODO Auto-generated method stub
		return userMapper.selectPageAllUser(pageUtil);
	}

}
