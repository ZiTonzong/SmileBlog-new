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
  <title>写文章 - smile博客</title> 
  <meta name="keywords" content="博客,smile博客" /> 
  <meta name="description" content="smile博客是紧贴生活的小清新网站，近期上线的有奖科技博客更是受到了大家的热捧，给一些热爱写作的网友提供了一个很好的平台。smile博客的宗旨是分享笑，分享爱，让更多的人在欢声笑语下得到爱的滋润为其永恒不变的主题。网站提供时下每周一期的有奖征文，小清新图片、原创文章，搞笑段子。致力打造一片供人们心灵交流的绿洲。" /> 
  <link type="image/vnd.microsoft.icon" href="${APP_PATH }/static/img/favicon.png" rel="shortcut icon">
  <link rel="stylesheet" type="text/css" href="${APP_PATH }/static/css/common.css?v7.1" /> 
  <link rel="stylesheet" type="text/css" href="${APP_PATH }/static/css/public.css" /> 
  <link rel="stylesheet" type="text/css" href="${APP_PATH }/static/css/user.css?v1" />
  <link rel="stylesheet" href="${APP_PATH}/static/bootstrap/css/bootstrap.css"> 
  
  <script type="text/javascript" src="${APP_PATH }/static/js/jq.js"></script> 
    <script type="text/javascript" src="${APP_PATH }/static/js/ss.js"></script> 
	<style type="text/css">
        .div_writeblog{
        	/* width: 80%; */
        	margin-left: 5%;
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
     <div id="user-loader" class="div_writeblog"> 
            
				<!-- 导入css/js -->
				<script type="text/javascript" charset="utf-8" 
				src="${APP_PATH }/static/ckeditor/ckeditor.js"></script>
				<form action="writeBlog" method="post" enctype="multipart/form-data">
				<div>
	                <fieldset>
	                    <legend>
	                        	请选择文章分类
	                    </legend>
	                    <p>
	                       	默认为科技类文章
	                    </p>
	                    <input type="radio" name="categoryId" value="0" checked/> 科技博客
				        <input type="radio" name="categoryId" value="1" /> 倾听世界
				        <input type="radio" name="categoryId" value="2" /> 每日一笑
				        <input type="radio" name="categoryId" value="3" /> 叫醒耳朵
	                </fieldset>
            	</div>
				<div>
                        	<br><h4>请选择文章封面</h4><hr>
                        	<input type="file" name="coverImage" id="coverImage">
            	</div>
            	<div>
            		<br>
            		<h4>请输入文章描述（不超过255个字符）</h4><hr>
            		<input type="text"  name="blogDesc" id="blogDesc" placeholder="在此输入文章描述" value="smile博客描述描述smile博客描述描述smile博客描述描述smil.." style="border:1px solid gray;" size="85"/>
            	</div>
					<div class="table-responsive">
						<h4 class="sub-header">写文章</h4>
						<div class="col-md-10">
							<input type="text" class="form-control" name="blogtitle" id="blogtitle" placeholder="在此输入文章标题">
							<textarea id="article" name="article">记录下自己的点点滴滴....</textarea>
							<script type="text/javascript">
								CKEDITOR.replace("article");
							</script>
						</div>
						<div class="col-md-3" style="float: right;">
						<br>
						<input type="submit" class="btn btn-primary" id="submit" value="提交"/>
									<!-- <button class="btn btn-primary">提交</button> -->
						</div>
					</div>
				</form>
			<!-- </div> -->
        
        
       
      </div>
      </div>
    
        </div>
   <!-- 公共尾部 --> 
  <%@ include file="footer.jsp"%>  
   <!-- 公共尾部 -->  
</div> 
 </body>
 <script type="text/javascript">
 var imgArr = [ "bmp", "jpg", "gif", "png" ];
	 $(function() {
		 $("#submit").click(function(){
			// alert("x");
			//如果用户还未登录提醒登录
				var flag = false;
				var logined = '<%= session.getAttribute("logined")%>' ;
				var blogTitle = $("#blogtitle").val();
				var blogArticle = $("#article")[0].innerText;
			//alert(logined);
				if(logined!=1){
					alert("您还未登录，请先登录！");
					return false;
				}
				else{
					//验证图片格式是否正确
				//	$("input:file").on("change",function() {
						if ($("#coverImage").val() == "") {
							alert("请选择商品图片");
							return false;
						} else {
							var file = $("#coverImage").val();
							var len = file.length;
							var ext = file.substring(len - 3, len).toLowerCase();
							if ($.inArray(ext, imgArr) == -1) {
								alert("请选择图片格式的文件");
								return false;
							} else {
								//alert("扩展名是：" + ext);
								
							}
						}
					//});
					if(blogTitle==null || blogTitle==""){
						alert("文章标题不能为空！");
						return false;
					}
					if(blogArticle==null || blogArticle==""){
						alert(blogArticle);
						return false;
					}
					//alert(blogArticle);
					
				}
				alert("提交成功！");
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