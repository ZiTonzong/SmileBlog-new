<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<% pageContext.setAttribute("APP_PATH", request.getContextPath());%>    
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta property="qc:admins" content="542536566763012535145636" /> 
  <title>登录 - smile博客</title> 
  <meta name="keywords" content="博客,smile博客" /> 
  <meta name="description" content="smile博客是紧贴生活的小清新网站，近期上线的有奖征文比赛更是受到了大家的热捧，给一些热爱写作的网友提供了一个很好的平台。smile博客的宗旨是分享笑，分享爱，让更多的人在欢声笑语下得到爱的滋润为其永恒不变的主题。网站提供时下每周一期的有奖征文，小清新图片、原创文章，搞笑段子。致力打造一片供人们心灵交流的绿洲。" /> 
  <link type="image/vnd.microsoft.icon" href="${APP_PATH }/static/img/favicon.png" rel="shortcut icon">
  <link rel="stylesheet" type="text/css" href="${APP_PATH }/static/css/common.css?v7.1" /> 
  <link rel="stylesheet" type="text/css" href="${APP_PATH }/static/css/public.css" /> 
  <script type="text/javascript" src="${APP_PATH }/static/js/jquery-3.1.1.min.js"></script> 
    <script type="text/javascript" src="${APP_PATH }/static/js/ss.js"></script> 
  <link rel="stylesheet" type="text/css" href="${APP_PATH }/static/css/login.css" />
</head>
 <body> 
<img class="log-bg" src="${APP_PATH }/static/img/bg1.jpg" alt="smile博客LOGO" /> 
  <div class="log-container"> 
   <div class="log-main pb-after-clear pb-opac90"> 
    <div class="log-box pb-after-clear"> 
     <div class="log-logo pb-login pb-fl"> 
      <a title="前往smile博客首页" href="index.jsp"><i class="pb-icons logo"></i></a> 
     </div> 
     <div class="log-fields pb-fr pb-login"> 
      <form id="user-login-form" action="" method="post"> 
       <table cellspacing="0" cellpadding="0" class="pb-login"> 
        <tbody> 
         <tr> 
          <td> <h3>登录</h3> &nbsp;&nbsp;|&nbsp;&nbsp; 没有账号？ <a href="register.jsp">立即注册</a> </td> 
         </tr> 
         <tr> 
          <td><input class="txt" placeholder="账号" name="username" id="username" type="text" /></td> 
         </tr> 
         <tr> 
          <td> <input class="pb-mt15 txt" placeholder="密码" name="password" id="password" type="password" /> </td> 
         </tr> 
         <tr>
          <td><span id="errorMsg" style="color:red"></span></td>
         </tr>
         <tr> 
          <td> <input id="ytLoginForm_rememberMe" type="hidden" value="0" name="LoginForm[rememberMe]" /><input class="pb-mt15" checked="checked" name="LoginForm[rememberMe]" id="LoginForm_rememberMe" value="1" type="checkbox" /> 记住密码 </td> 
         </tr> 
         <tr> 
          <td><button type="button" id="sub" class="pb-icons pb-mt15"><u>登录</u></button></td> 
         </tr> 
         <tr> 
          <td> <span class="pb-iblock pb-mt20">使用合作账号直接注册</span> <br /> <a class="pb-mt10 pb-iblock" href="/site/qqlogin"> <i class="pb-icons qq"></i> </a> &nbsp; <a class="pb-mt10 pb-iblock" href="/site/weibologin"> <i class="pb-icons weibo"></i> </a> </td> 
         </tr> 
        </tbody> 
       </table> 
      </form> 
     </div> 
     <script>
 commonLib.fixPlaceholder();
 
	$(function() {
		$("#sub").click(function(){
			var username = $.trim($("#username").val());
			var password = $("#password").val();
			
			var json = {"username":username,"password":password};
			var url = "login";
			$.post(url,json,function(data){
				var logStatus = data[0].logStatus;
				$("#errorMsg").text("");
				//alert(logStatus);
				if(logStatus=="true"){
					window.location.href = "index.jsp";
					//$(#user-login-form).submit();
					//return true;
				}
				else if(logStatus=="nonactivated"){
					$("#errorMsg").text("您的账号尚未激活，请先激活账号。");
				}
				else {
					$("#errorMsg").text("用户名或密码错误");
				}
			},"json");
			return false; 
		 });
	});
 </script> 
    </div> 
   </div> 
  </div> 
  <script language="javascript" type="text/javascript" src="${APP_PATH }/static/js/15502332.js"></script> 
 
  <!-- Baidu Button BEGIN --> 
  <script type="text/javascript" id="bdshare_js" data="type=slide&amp;img=8&amp;pos=right&amp;uid=6614812"></script> 
  <script type="text/javascript" id="bdshell_js"></script> 
   <script type="text/javascript">
	document.getElementById("bdshell_js").src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion=" + Math.ceil(new Date()/3600000);
	</script> 
  <!-- Baidu Button END --> 
  <script type="text/javascript" language="javascript">
  $(document).ready(function(){
		Sys.showLoginDiv( null, false);
		
		commonLib.preLoadImage( $('.log-bg').attr('src'), function(){
			$('.log-bg').fadeIn(2000);
		});
		Sys.hide51();
	});
	</script> 
  <script type="text/javascript" src="${APP_PATH }/static/js/form.js"></script>  
</body>
</html>