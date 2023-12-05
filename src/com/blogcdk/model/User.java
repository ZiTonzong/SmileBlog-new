package com.blogcdk.model;

public class User {
    private Integer userId;

    private String username;

    private String password;

    private String email;

    private String gravatarImg;

    private Integer state;

    private String code;

    private Integer roleId;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getGravatarImg() {
        return gravatarImg;
    }

    public void setGravatarImg(String gravatarImg) {
        this.gravatarImg = gravatarImg == null ? null : gravatarImg.trim();
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code == null ? null : code.trim();
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

	@Override
	public String toString() {
		return "User [userId=" + userId + ", username=" + username + ", password=" + password + ", email=" + email
				+ ", gravatarImg=" + gravatarImg + ", state=" + state + ", code=" + code + ", roleId=" + roleId + "]";
	}
    
}