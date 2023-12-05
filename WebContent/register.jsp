<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<% pageContext.setAttribute("APP_PATH", request.getContextPath());%>    
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta property="qc:admins" content="542536566763012535145636" /> 
  <title>注册 - smile博客</title> 
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
<img class="log-bg" src="${APP_PATH }/static/img/bg2.jpg" alt="smile博客LOGO" /> 
  <div class="log-container"> 
   <div class="log-main pb-after-clear pb-opac90"> 
    <div class="log-box pb-after-clear"> 
     <div class="log-logo  pb-login pb-fl" style="margin-top:50px;"> 
      <a title="前往smile博客首页" href="index.html"><i class="pb-icons logo"></i></a> 
      <span class="pb-iblock pb-mt50">使用合作账号快速注册</span> 
      <br /> 
      <a class="pb-mt10 pb-iblock" href="/site/qqlogin"> <i class="pb-icons qq"></i> </a> &nbsp; 
      <a class="pb-mt10 pb-iblock" href="/site/weibologin"> <i class="pb-icons weibo"></i> </a> 
     </div> 
     <div class="log-fields pb-fr"> 
      <form id="register-form" action="register" method="post"> 
       <table cellspacing="0" cellpadding="0" class="pb-login"> 
        <tbody> 
         <tr> 
          <td> <h3>注册</h3> &nbsp;&nbsp;|&nbsp;&nbsp; 已有账号？ <a href="/site/login">立即登录</a> </td> 
         </tr> 
         <tr> 
          <td> <input class="txt {required:true,isUserName:true,minlength:5}" placeholder="请输入您的账号" name="username" id="username" type="text" maxlength="32" /> <br /><span class="pb-error pb-hide">未完成</span> </td> 
         </tr> 
         <tr> 
          <td> <input class="pb-mt15 txt" placeholder="密码 6至16个字符之间" name="password" id="password" type="password" maxlength="16" /> <br /><span class="pb-error pb-hide">未完成</span> </td> 
         </tr> 
         <tr> 
          <td> <input class="pb-mt15 txt" placeholder="确认 与前者保持一致" name="rePassword" id="rePassword" type="password" /> <br /><span class="pb-error pb-hide">未完成</span> </td> 
         </tr>
         <tr> 
          <td> <input class="pb-mt15 txt" placeholder="请输入注册邮箱" name="email" id="email" type="email" /> <br /><span class="pb-error pb-hide">未完成</span> </td> 
         </tr> 
         <tr> 
          <td>
          <!-- <a href="javascript:void(0);"> -->
          <button type="button" id="registerButton" class="pb-icons pb-mt15"><u>注册</u></button>
          <!-- </a> -->
          </td> 
         </tr> 
         <tr> 
          <td> </td> 
         </tr> 
        </tbody> 
       </table> 
      </form> 
     </div> 
 <script>
$(document).ready(function(){
	commonLib.fixPlaceholder();
	var usernameObj   = $("#username");
	//var nicknameObj   = $("#UserUser_nickname");
	var passwordObj   = $("#password");
	var rePasswordObj = $("#rePassword");
	var emailObj = $("#email");
	
	//var username = usernameObj.val();
	var password = passwordObj.val();
	var email = emailObj.val();
	
	usernameObj.change(function(){
		var status = Sys.isValidUsername( $(this).val()); 
		if( status < 0){
			var msg = '';
			switch( status){
				case -1:
					msg = '只允许字母和数字下划线点等的组合或邮箱地址';
				break;
				case -2:
					msg = '至少需要3个字符哦';
				break;
				case -3:
					msg = '除使用邮箱外,最多允许16个字符哦';
				break;
			}
			if( msg.length > 0){
				usernameObj.parent().find('.pb-error').html( msg).show();
			}
			usernameObj.validStatus = false;
		}else{
			 /* var msg = "";
			 usernameObj.parent().find('.pb-error').html( msg).show(); */
			//var username = $usernameObj.val();
			 var json = {"username":usernameObj.val()};
			// alert(usernameObj.val());
			   $.post("register",json,function(data){
				   var regStatus = data[0].regStatus;
				 // alert(regStatus);
				   if(regStatus=="hasThisUser"){
					   var msg = "该用户名已被注册！";
					   usernameObj.parent().find('.pb-error').html( msg).show();
					   usernameObj.validStatus = false;				   
				   }
				   else
				   {
					   var msg = "<font style='color:green'>该用户名可以使用</font>";
						usernameObj.parent().find('.pb-error').html( msg).show();
						usernameObj.validStatus = true;
				   }
			   },"json");
		}
	});
	 /* usernameObj.focus(function(){
		   this.style.imeMode = 'disabled';// 禁用输入法,禁止输入中文字符
		   //$username_msg.html("<br/>");
	   }).blur(function(){
		// var username = $usernameObj.val();
			 var json = {"username":username};
			 alert(username);
			   $.post("register",json,function(data){
				   var regStatus = data[0].regStatus;
				   if(regStatus=="hasThisUser"){
					   var msg = "该用户名已被注册！";
					   usernameObj.parent().find('.pb-error').html( msg).show();
					   usernameObj.validStatus = false;				   
				   }
				   else
				   {
					   var msg = "<font style='color:green'>该用户名可以使用</font>";
						usernameObj.parent().find('.pb-error').html( msg).show();
						usernameObj.validStatus = true;
				   }
			   },"json");
	   }); */
	 
	passwordObj.change(function(){
		var pass = $(this).val();
		if( pass.length < 6 || pass.length > 16){
			passwordObj.parent().find('.pb-error').html( '密码长度在6-16字符之间').show();
			passwordObj.validStatus = false;
		}else{
			passwordObj.parent().find('.pb-error').hide();
			passwordObj.validStatus = true;
			if( rePasswordObj.val() && rePasswordObj.val() == $(this).val()){
				rePasswordObj.parent().find('.pb-error').hide();
				rePasswordObj.validStatus = true;
			}
		}
	});
	
	rePasswordObj.change(function(){
		if( $(this).val() != passwordObj.val() ){
			rePasswordObj.parent().find('.pb-error').html( '您此次输入的密码与之前不一样哦！').show();
			rePasswordObj.validStatus = false;
		}else{
			rePasswordObj.parent().find('.pb-error').hide();
			rePasswordObj.validStatus = true;
		}
	});
	
	
	$("#registerButton").click(function(){
		
		//alert("regBtn");
		if( usernameObj.validStatus == null || usernameObj.validStatus == false){
			var msg = '您还未完成用户名填写哦！';
			usernameObj.parent().find('.pb-error').html( msg).show();
			return false;
		}
		if( passwordObj.validStatus == null || passwordObj.validStatus == false){
			var msg = '您还未完成密码输入哦！';
			passwordObj.parent().find('.pb-error').html( msg).show();
			return false;
		}
		if( rePasswordObj.validStatus == null || rePasswordObj.validStatus == false){
			var msg = '您还未完成确认密码哦！';
			rePasswordObj.parent().find('.pb-error').html( msg).show();
			return false;
		}
		if( $("#email").val()==null||$("#email").val()==""){
			var msg = '您还未填写注册邮箱哦！';
			emailObj.parent().find('.pb-error').html( msg).show();
			return false;
		}
		
		if( $("#email").val()!=null && $("#email").val()!=""){
			var msg = '';
			emailObj.parent().find('.pb-error').html( msg).show();
			//return false;
		}
		//alert("regBtn");
			//$('form').fadeOut(500);
	       // $('#register-form').submit();
			//subUserRegister();
			//  return false; // 阻止表单自动提交事件
			var username1 = usernameObj.val();
			var password1 = passwordObj.val();
			var email1 = emailObj.val();
			
			var json = {"username":username1,"password":password1,"email":email1};
			   $.post("register",json,function(data){
				   var regStatus = data[0].regStatus;
				   if(regStatus=="hasThisUser"){
					   //$username_msg.text("用户名已存在！");
					   var msg = "该用户名已被注册！";
					   usernameObj.parent().find('.pb-error').html(msg).show();
				   }
				  
				   if(regStatus=="regSuccess"){
					   if(confirm("注册成功，点击进入激活界面")){
						   window.location.href = "registerSuccess.jsp";	
						 //return true;
					   }
				   }
				   console.log(regStatus);
				   if(regStatus=="regFail"){
					   alert("服务器异常，注册失败");
				   }
			   },"json");
			   return false;
		
	});
});
/* function subUserRegister(){
	$("#register-form").ajaxSubmit({
        type: 'post', // 提交方式 get/post
        url: 'your url', // 需要提交的 url
        data: {
            'title': title,
            'content': content
        },
        success: function(data) { // data 保存提交后返回的数据，一般为 json 数据
            // 此处可对 data 作相关处理
            alert('提交成功！');
        }
        $(this).resetForm(); // 提交后重置表单
    });
} */

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