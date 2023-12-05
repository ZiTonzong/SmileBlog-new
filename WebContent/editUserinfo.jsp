<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% pageContext.setAttribute("APP_PATH", request.getContextPath());%>    
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<meta property="qc:admins" content="542536566763012535145636" /> 
  <title>个人中心 - smile博客</title> 
  <meta name="keywords" content="博客,smile博客" /> 
  <meta name="description" content="smile博客是紧贴生活的小清新网站，近期上线的有奖科技博客更是受到了大家的热捧，给一些热爱写作的网友提供了一个很好的平台。smile博客的宗旨是分享笑，分享爱，让更多的人在欢声笑语下得到爱的滋润为其永恒不变的主题。网站提供时下每周一期的有奖征文，小清新图片、原创文章，搞笑段子。致力打造一片供人们心灵交流的绿洲。" /> 
  <link type="image/vnd.microsoft.icon" href="${APP_PATH }/static/img/favicon.png" rel="shortcut icon">
  <link rel="stylesheet" type="text/css" href="${APP_PATH }/static/css/common.css?v7.1" /> 
  <link rel="stylesheet" type="text/css" href="${APP_PATH }/static/css/public.css" /> 
    <link rel="stylesheet" type="text/css" href="${APP_PATH }/static/css/user.css?v1" /> 
  <script type="text/javascript" src="${APP_PATH }/static/js/jq.js"></script> 
    <script type="text/javascript" src="${APP_PATH }/static/js/ss.js"></script> 
<style type="text/css">
       #div_editUserinfo{
       		padding-left: 10%;
       		padding-top: 5%;
       		font-size: 20px;
       }
       .input_text{
       	font-size: 20px;
       	border-color: rgba(82, 168, 236, 0.8);
    box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1), 0 0 8px rgba(82, 168, 236, 0.6);
       }
       .textarea{
    width: 400px;
    min-height: 20px;
    max-height: 300px;
    _height: 120px;
    margin-left: auto;
    margin-right: auto;
    padding: 3px;
    outline: 0;
    border: 1px solid #a0b3d6;
    font-size: 18px;
    line-height: 24px;
    padding: 2px;
    word-wrap: break-word;
    overflow-x: hidden;
    overflow-y: auto;
 
    border-color: rgba(82, 168, 236, 0.8);
    box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1), 0 0 8px rgba(82, 168, 236, 0.6);
    display: inline-block;
}
	.button {
	display: inline-block;
	outline: none;
	cursor: pointer;
	text-align: center;
	text-decoration: none;
	font: 16px/100% 'Microsoft yahei',Arial, Helvetica, sans-serif;
	padding: .5em 2em .55em;
	text-shadow: 0 1px 1px rgba(0,0,0,.3);
	-webkit-border-radius: .5em; 
	-moz-border-radius: .5em;
	border-radius: .5em;
	-webkit-box-shadow: 0 1px 2px rgba(0,0,0,.2);
	-moz-box-shadow: 0 1px 2px rgba(0,0,0,.2);
	box-shadow: 0 1px 2px rgba(0,0,0,.2);
	margin-left: 40%;
	margin-top:10px; 
}
.button:hover {
	text-decoration: none;
}
/* blue */
.blue {
	color: #d9eef7;
	border: solid 1px #0076a3;
	background: #0095cd;
	background: -webkit-gradient(linear, left top, left bottom, from(#00adee), to(#0078a5));
	background: -moz-linear-gradient(top,  #00adee,  #0078a5);
	filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#00adee', endColorstr='#0078a5');
}
.blue:hover {
	background: #007ead;
	background: -webkit-gradient(linear, left top, left bottom, from(#0095cc), to(#00678e));
	background: -moz-linear-gradient(top,  #0095cc,  #00678e);
	filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#0095cc', endColorstr='#00678e');
}
.blue:active {
	color: #80bed6;
	background: -webkit-gradient(linear, left top, left bottom, from(#0078a5), to(#00adee));
	background: -moz-linear-gradient(top,  #0078a5,  #00adee);
	filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#0078a5', endColorstr='#00adee');
}
	
    </style>
 
</head>
 <body> 
  
  <div class="pb-container"> 
            <div class="pb-container-main pb-after-clear"> 
                <!-- 公共头部 --> 
                <%@ include file="header.jsp"%>   
                <!-- 公共头部 --> 
                <!-- 当前页面内容 --> 
      <!-- 面包屑 --> 
    <div class="pb-main pb-breadcrumbs pb-mt40 pb-size-small"> 
     <a href="index.jsp">首页</a> &gt;&gt; 
     <a href="myHomePage">个人中心</a> 
    </div> 
    <!-- 面包屑结束 --> 
    <!-- 当前页面内容 --> 
    <input type="hidden" name="verifyCode" id="verifyCode" value="" /> 
    <div class="pb-main pb-mt20"> 
     <div class="usr-l pb-fl"> 
      <div class="head"> 
       <a href="http://www.lanrenzhijia.com/"" title="更改头像"> <img src="${APP_PATH }/static/img/${userinfo.userHeadImg}" alt="叫醒闹钟" id="userDetailHead" /> </a> 
      </div> 
      
      <div class="nav-cnt pb-size-small"> 
       <ul> 
        <li class=""><a id="homepage"  class="goto" href="userinfo">我的主页</a></li> 
        <li class=""><a id="homepage"  class="goto" href="editUserinfo.jsp">资料修改</a></li>
        <li class=""><a id="homepage"  class="goto" href="editHeadImg2">头像修改</a></li>
        <li class=""><a id="homepage"  class="goto" href="myBlogs">我的博客</a></li>
        <li class=""><a id="homepage"  class="goto" href="writeBlog.jsp">写博客</a></li>
        <li class=""><a id="homepage"  class="goto" href="javascript:void(0);">我的日志</a></li>
        <li class=""><a id="homepage"  class="goto" href="javascript:void(0);">写日志</a></li>
       </ul> 
      </div> 
     </div> 
     <div id="user-loader" class="usr-r pb-fl">
      <table cellspacing="0" cellpadding="0" border="0" class="tbList"> 
       <tbody> 
        <tr style="height:488px; background:url(${APP_PATH }/static/img/atl-add-bg1.png) repeat scroll 0 0 transparent"> 
         <td class="pb-pr usr-board-banner">
         <form action="updateUserinfo" method="post">
          <div id="div_editUserinfo">
          <c:if test="${not(sessionScope.logined eq null)}">
           <p>账&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号 :${sessionScope.user.username}</p>
           </c:if>
           <c:if test="${sessionScope.logined eq null}">
           <p>您还没有登录，请先<a href="login.jsp">登录</a>才能修改个人资料</p>
           </c:if>
           <br>
           <p>昵&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称 :&nbsp;&nbsp;<input class="input_text" type="text" id="nickname" name="nickname" size="30px"/><span style="color:red;" id="errorNick"></span></p> 
           <br>
           <p>年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;龄 :&nbsp;&nbsp;<input class="input_text" type="text" id="age" name="age" size="30px"/><span style="color:red;" id="errorAge"></span></p> 
           <br>
           <p>常用邮箱 :&nbsp;&nbsp;<input class="input_text" type="email" id="email" name="email" size="30px"/><span style="color:red;" id="errorEmail"></span></p> 
           <br>
           <p>个性签名<font color="gray">（不超过255个字符）</font> :</p><br/>
           <textarea class="textarea" id="about" name="about"></textarea>
           <br> 
           <span style="color:red;" id="errorAbout"></span>
           <input type="submit" class="button blue" value="提交修改" id="submit"/>
          </div>
          </form> 
         </td> 
        </tr> 
        
       </tbody> 
      </table> 
      </div>
      </div>
    
        </div>
   <!-- 公共尾部 --> 
  <%@ include file="footer.jsp"%>  
   <!-- 公共尾部 -->  
</div> 
 </body>
 <script type="text/javascript">
 $(function() {
	 
		var nicknameObj  = $("#nickname");
		var ageObj   = $("#age");
		var emailObj = $("#email");
		var aboutObj = $(".textarea");
		
		var nickname = nicknameObj.val();
		var age = ageObj.val();
		var email = emailObj.val();
		var about = aboutObj[0].innerText;
		
		nicknameObj.change(function(){
			var status =  $(this).val().length; 
			//alert(status);
			var msg = '';
			if( status < 4 || status > 8){
				msg = "昵称长度应在4-8个字符之间";	
			}
				if( msg.length > 0){
					nicknameObj.validStatus = false;
				}
				$("#errorNick").text(msg);
				nicknameObj.validStatus = true;
			});
		 
		ageObj.change(function(){
			//年龄正则表达式1-120
			var r = new RegExp("^(?:[1-9][0-9]?|1[01][0-9]|120)$");　　
			var status =  $(this).val(); 
            var result =  status.match(r);
            var msg = '';
            if(result==null){
            	msg = "输入的年龄应在1-120之间";
            }
            if( msg.length > 0){
				ageObj.validStatus = false;
			}
            $("#errorAge").text(msg);
            ageObj.validStatus = true;
		});
		
		emailObj.change(function(){
			//邮箱正则表达式
			var reg = new RegExp("^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$"); 
			var status =  $(this).val(); 
			var msg = '';
			if(!reg.test(status)){
				msg = "请输入正确的邮箱格式";
			}
			 if( msg.length > 0){
					emailObj.validStatus = false;
				}
			 $("#errorEmail").text(msg);
			 emailObj.validStatus = true;
		});
		
		aboutObj.change(function(){
			var about1 = $(this).val(); 
			var status =  about1.length; 
			//alert(status);
			var msg = '';
			if( status <= 0 || status > 255){
				msg = "个性签名长度应在1-255之间";	
			}
				if( msg.length > 0){
					aboutObj.validStatus = false;
				}
				$("#errorAbout").text(msg);
				aboutObj.validStatus = true;
			});
		
		
		$("#submit").click(function(){
			//如果用户还未登录提醒登录
			var logined = '<%= session.getAttribute("logined")%>' ;
			if(logined!=1){
				alert("您还未登录，请先登录！");
				return false;
			}
			//alert("regBtn");
			if( nicknameObj.validStatus == null || nicknameObj.validStatus == false){
				var msg = '昵称长度应在4-8个字符之间';
				$("#errorNick").text(msg);
				return false;
			}
			if( ageObj.validStatus == null || ageObj.validStatus == false){
				var msg = '输入的年龄应在1-120之间';
				$("#errorAge").text(msg);
				return false;
			}
			if( emailObj.validStatus == null || emailObj.validStatus == false){
				var msg = '请输入正确的邮箱格式';
				$("#errorEmail").text(msg);
				return false;
			}
			if( aboutObj.validStatus == null || aboutObj.validStatus == false){
				var msg = '个性签名长度应在1-255之间';
				$("#errorAbout").text(msg);
				return false;
			}
				alert("修改成功！");   
			return true;
			
		});
	});
	
 
	$(document).ready(function(){
		$(".pb-ucenter").bind('mouseenter', function(){
			$(this).find('ul').stop().slideDown('fast');
			Sys.clearFlicker('uMessageCenter');
		}).bind('mouseleave', function(){
			$(this).find('ul').stop().slideUp('fast');
		});
		
		$("#goTopButton").click(function(){
			Sys.scrollTo($('body'));
			Sys.commStat(33);
		});
		if( vars.browser != 'IE6'){
			var w_w = parseInt( $("body").width());
			var obj = $("#goTopButton");
			$(window).scroll(function(){
				if($(this).scrollTop() > 500){
					if( !isNaN(w_w) && w_w > 0){
						obj.css('left', (Math.ceil((w_w-1050)/2) + 1050 + 10) + "px" );
					}
					obj.fadeIn();
				}else{
					obj.fadeOut();
				}
			});
		}
		Sys.hide51();
	});
	</script>
</html>