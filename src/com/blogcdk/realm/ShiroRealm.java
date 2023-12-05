package com.blogcdk.realm;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import com.blogcdk.model.User;
import com.blogcdk.service.UserService;

public class ShiroRealm extends AuthorizingRealm{
	@Autowired
	UserService userService;
	
	//�û���Ȩ
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		// TODO Auto-generated method stub
		System.out.println("->>>>>>>this is �û���Ȩ");
		
		String username = (String) principals.getPrimaryPrincipal();
		
		SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
		
		/*try {
			authorizationInfo.setRoles(userService.selectRolesByUserName(username));
			System.out.println("���û���roles��"+userService.selectRolesByUserName(username));
			authorizationInfo.setStringPermissions(userService.selectPermissionByUserName(username));
			System.out.println("���û���permissions"+userService.selectPermissionByUserName(username));
		} catch (Exception e) {
			// TODO: handle exception
		}*/
		return authorizationInfo;
	}
	//�û���֤
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken token) throws AuthenticationException {
		// TODO Auto-generated method stub
		System.out.println("->>>>>>>this is �û���֤");
		SimpleAuthenticationInfo authenticationInfo = null;
		UsernamePasswordToken usernamePasswordToken = (UsernamePasswordToken) token;
		String username = usernamePasswordToken.getUsername();
		System.out.println("token��username:"+username);
		User user =  userService.selectUserByUsername(username);
		if(user!=null){
			System.out.println("���ݿ���ڴ��û�");
			authenticationInfo = new SimpleAuthenticationInfo(user.getUsername(), user.getPassword(), this.getName());
			return authenticationInfo;
		}else{
			System.out.println("�û���֤δ��ѯ��");
			throw new AuthenticationException();
		}
	}

}
