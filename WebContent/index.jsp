<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% pageContext.setAttribute("APP_PATH", request.getContextPath());%>    
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
 <script type="text/javascript" src="${APP_PATH }/static/js/jquery-3.1.1.min.js"></script>
<title>index.jsp</title>
<script>
window.onload = function(){ //设置当页面加载时执行
window.location ="${APP_PATH }/index" //确定的话游览器自身跳转
}
</script>
<!-- 做跳转使用 -->
</head>
<body>
</body>

</html>