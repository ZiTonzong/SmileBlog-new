<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <% pageContext.setAttribute("APP_PATH", request.getContextPath());%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Smile博客后台管理</title>
 <link rel="stylesheet" type="text/css" href="${APP_PATH }/static/css/back_login.css" />
 <script type="text/javascript" src="${APP_PATH }/static/js/jq.js"></script> 

</head>
<body>
<div id="loginpanelwrap">
		<div class="loginheader">
			<div class="logintitle">
				<a>Smile博客欢迎您！</a>
			</div>
		</div>
		<div class="loginform">
			<div class="loginform_row">
				<label>管理账户:</label> <input id="managerName" name="managerName" type="text" class="loginform_input"/>
			</div>
			<div class="loginform_row">
				<label>密码:</label> <input id="managerPassword" name="managerPassword" type="password" class="loginform_input"/>
			</div>
			<div class="loginform_row">
				<input id="loginSubmit" type="submit" class="loginform_submit" value="登录" />
			</div>
			<div class="clear"></div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function(){
		$("#managerName").focus();
		$("body").keydown(function(event) {
            if (event.keyCode == "13") {//keyCode=13是回车键
                $("#loginSubmit").click();
            }
        });
		$("#loginSubmit").click(function(){
			var managerName = $("#managerName").val();
			var managerPassword = $("#managerPassword").val();
			if($.trim(managerName)=="" || $.trim(managerPassword)==""){
				alert("请输入用户名和密码！");
				return;
			}
			var json = {"managerName":managerName,"managerPassword":managerPassword};
			$.post("backLogin",json,function(data){
				//alert("xx");
				var logStatus = data[0].logStatus;
				if(logStatus=="true"){
					if(confirm("登录成功,点击确定跳转到系统管理页面")){
						window.location.href = "index.jsp";
					}
				}if(logStatus=="false") {
					alert("用户名或密码错误！");
				}
			},"json");
		});
	});
</script>
</html>