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
        #div_editHeadImg{
        	padding-left: 30%;
        	padding-top: 5%;
        	font-size: 15px;
        	line-height: 20px;
        }
        #submit{
           margin-left: 40%;
        }
    </style>
 
</head>
 <body> 
  <div style="display: none; position: absolute;" class="">
   <div class="aui_outer">
    <table class="aui_border">
     <tbody>
      <tr>
       <td class="aui_nw"></td>
       <td class="aui_n"></td>
       <td class="aui_ne"></td>
      </tr>
      <tr>
       <td class="aui_w"></td>
       <td class="aui_c">
        <div class="aui_inner">
         <table class="aui_dialog">
          <tbody>
           <tr>
            <td class="aui_header" colspan="2">
             <div class="aui_titleBar">
              <div class="aui_title" style="cursor: move;"></div>
              <a class="aui_close">&times;</a>
             </div></td>
           </tr>
           <tr>
            <td class="aui_icon" style="display: none;">
             <div class="aui_iconBg" style="background: transparent none repeat scroll 0% 0%;"></div></td>
            <td class="aui_main" style="width: auto; height: auto;">
             <div class="aui_content" style="padding: 20px 25px;"></div></td>
           </tr>
           <tr>
            <td class="aui_footer" colspan="2">
             <div class="aui_buttons" style="display: none;"></div></td>
           </tr>
          </tbody>
         </table>
        </div></td>
       <td class="aui_e"></td>
      </tr>
      <tr>
       <td class="aui_sw"></td>
       <td class="aui_s"></td>
       <td class="aui_se" style="cursor: se-resize;"></td>
      </tr>
     </tbody>
    </table>
   </div>
  </div> 
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
        <tr style="height:388px;background:url(${APP_PATH }/static/img/atl-add-bg1.png) repeat scroll 0 0 transparent"> 
         <td class="pb-pr usr-board-banner"> 
         <div id="div_editHeadImg">
                                  
                                  当前头像：<Br><Br>
              <img src="${APP_PATH }/static/img/${userinfo.userHeadImg}" alt="当前头像" width="60px" height="60px"/>
              <img src="${APP_PATH }/static/img/${userinfo.userHeadImg}" alt="当前头像" width="90px" height="90px"/>
              <img src="${APP_PATH }/static/img/${userinfo.userHeadImg}" alt="当前头像" width="120px" height="120px"/>
              <Br>
           <form action="uploadHeadImg" method="post" enctype="multipart/form-data"> 
			 <label><Br><Br>上传新头像：</label><input type="file" name="headImgFile" id="headImgFile"><br><Br><Br>  
			 <input type="submit" class="pb-button01" value="提交修改" id="submit"/>
			 </form>
            
          </div>
         </td> 
        </tr> 
        
        <tr> 
          
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
		 $("#submit").click(function(){
			// alert("x");
			//如果用户还未登录提醒登录
				var logined = '<%= session.getAttribute("logined")%>' ;
			//alert(logined);
			var fileFlag = false;
				if(logined!=1){
					alert("您还未登录，请先登录！");
					return false;
				}
				else{
					$("input[name='headImgFile']").each(function(){ 
						if($(this).val()!="") { 
						fileFlag = true; 
						alert("上传成功！");
						return true;
						} 
						}); 
						if(!fileFlag) { 
						alert("请选择好文件!");
						return false;
						}
				}
				
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