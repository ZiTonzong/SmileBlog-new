<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Smile博客后台管理</title>
<script type="text/javascript" src="${APP_PATH }/static/js/jquery-3.1.1.min.js"></script>
  <script type="text/javascript" src="${APP_PATH}/static/bootstrap/js/bootstrap.js"></script>
<link rel="stylesheet"
	href="${APP_PATH}/static/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="${APP_PATH}/static/css/dashboard.css">
<link rel="stylesheet" href="${APP_PATH}/static/css/common.css">
<style type="text/css">
 button{
	border: 0 none;
	font-weight: normal;
	margin: 0;
	padding: 0;
}

.pb-listpage table{
	height: 35px;
	line-height:35px;
	text-align:center;
	border-collapse:collapse;
}
.pb-listpage tr td{
	line-height:35px;
	border: 1px solid #bfbfbf;
	padding:0;
}
.pb-listpage a{
	display:block;
	padding:0 12px;
	color:#414141;
	cursor:pointer;
	text-decoration: none;
}
.pb-listpage a.on,.pb-listpage  a:hover{
	background-color:#156770;
	color:#fff;
}
</style>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="${APP_PATH}/back/index.jsp">Smile博客</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="index.jsp">首页</a></li>
					<li><a href="#">${sessionScope.admin.username}</a></li>
					<li><a href="loginout">退出</a></li>
				</ul>
			</div>
		</div>
	</nav>
<!-- adminHeader end -->	