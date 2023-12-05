<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<% pageContext.setAttribute("APP_PATH", request.getContextPath());%>  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>Smile博客</title>
		<link type="image/vnd.microsoft.icon" href="${APP_PATH }/static/img/favicon.png" rel="shortcut icon">
		<link rel="stylesheet" href="${APP_PATH }/static/css/style.css"/>
		<script type="text/javascript" src="${APP_PATH }/static/js/top.min.js"></script>
		<script type="text/javascript" src="${APP_PATH }/static/js/top.js"></script>
		<script type="text/javascript" src="${APP_PATH }/static/js/jquery-3.1.1.min.js"></script>
	</head>
	<body>
		<h1 style="text-align: center;">${requestScope.msg}</h1>
		<p style="text-align: center;padding-top: 100px;"><a href="${APP_PATH }/login.jsp">点击登录</a></p>
	</body>
</html>