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
  <title>我的所有文章 - smile博客</title> 
  <meta name="keywords" content="博客,smile博客" /> 
  <meta name="description" content="smile博客是紧贴生活的小清新网站，近期上线的有奖科技博客更是受到了大家的热捧，给一些热爱写作的网友提供了一个很好的平台。smile博客的宗旨是分享笑，分享爱，让更多的人在欢声笑语下得到爱的滋润为其永恒不变的主题。网站提供时下每周一期的有奖征文，小清新图片、原创文章，搞笑段子。致力打造一片供人们心灵交流的绿洲。" /> 
  <link type="image/vnd.microsoft.icon" href="${APP_PATH }/static/img/favicon.png" rel="shortcut icon">
  <link rel="stylesheet" type="text/css" href="${APP_PATH }/static/css/common.css?v7.1" /> 
  <link rel="stylesheet" type="text/css" href="${APP_PATH }/static/css/public.css" /> 
  <link rel="stylesheet" type="text/css" href="${APP_PATH }/static/css/user.css?v1" />
  <script type="text/javascript" src="${APP_PATH }/static/js/jq.js"></script>
  <script type="text/javascript" src="${APP_PATH }/static/js/jquery-3.1.1.min.js"></script>
  <script type="text/javascript" src="${APP_PATH}/static/bootstrap/js/bootstrap.js"></script> 
  <link rel="stylesheet" href="${APP_PATH}/static/bootstrap/css/bootstrap.css"> 
    <script type="text/javascript" src="${APP_PATH }/static/js/ss.js"></script> 
	<style type="text/css">
      #div_page{
      	padding-top: 43%;
      	padding-left:30%;
      }  
    /*  body a{
      text-decoration: none;
      } */
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
    <!-- <input type="hidden" name="verifyCode" id="verifyCode" value="" />  -->
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
    
    <div class="col-sm-9  main" style="float: right;">
			    <c:if test="${sessionScope.logined eq null}">
			    	<h2>您尚未登录，请先<a href="login.jsp">登录</a>。</h2>
			    </c:if>
				<c:if test="${not(sessionScope.logined eq null)}">
				<c:if test="${fn:length(Blogs)>0}">
				<h4 class="sub-header">所有文章</h4>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>标题</th>
							<th>内容</th>
							<th>发布时间</th>
							<th>所属类别</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${Blogs}" var="Blog" varStatus="Blogvs">
						<tr>
							<td><a href="articles?blogId=${Blog.blogId}">${Blog.blogTitle}</a></td>
							<td>${fn:substring(Blog.article,0,20)}...</td>
							<td>${Blog.time}</td>
							<td>
							<c:if test="${Blog.categoryId eq 0}">
							科技博客
							</c:if>
							<c:if test="${Blog.categoryId eq 1}">
							倾听世界
							</c:if>
							<c:if test="${Blog.categoryId eq 2}">
							每日一笑
							</c:if>
							<c:if test="${Blog.categoryId eq 3}">
							叫醒耳朵
							</c:if>
							</td>
							<td>
							<div class="dropdown">
								<button class="btn btn-default" id="dropdownMenu1" data-toggle="dropdown">
									操作
									<span class="caret"></span>
								</button>
								<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
									<li><a href="#">修改</a></li>
									<li><a href="#">删除</a></li>
									<!-- <li><a href="#">产品</a></li>
									<li><a href="#">关于</a></li> -->
								</ul>
							</div>
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				
				</c:if>
				</c:if>
				<c:if test="${fn:length(Blogs) <=0}">
				<div><h3>你还没有写文章呢。<a href="writeBlog.jsp">去写文章</a>！</h3></div>
				</c:if> 
			</div>
    <!-- 分页信息 -->
    <c:if test="${not(sessionScope.logined eq null)}">
    <c:if test="${fn:length(Blogs)>0}">
				<div class="pb-mt50 pb-listpage" id="div_page"> 
			       <table>
			        <tbody>
			         <tr>
			         	<td><a class="yiiPagerA" href="?start=0">首  页</a></td>
			        	<td><a class="yiiPagerA" href="?start=${pageUtil.start-pageUtil.count}">上一页</a></td>
			        	<td><a class="yiiPagerA" href="?start=${pageUtil.start+pageUtil.count}">下一页</a></td>
			        	<td><a class="yiiPagerA" href="?start=${pageUtil.last}">末  页</a></td>
			        	<td>共${pageUtil.pageNo} / ${pageUtil.pageCount}页&nbsp;<td>
			        	<td>
			        	跳转到第<input type="number" name="pageNo" id="pageNo" style="width: 50px">页
			        	<!-- <input type="submit" value="确定"> -->
			        	</td>
			        	<td>
			        	<a href="javascript:_go();">确定</a> 
			        	</td>
			         </tr>
			        </tbody>
			       </table> 
			     </div> 
			     </c:if>
   			 </c:if>
      </div> 
        </div>
   <!-- 公共尾部 --> 
  <%@ include file="footer.jsp"%>  
   <!-- 公共尾部 -->  
</div> 
 </body>
 <script type="text/javascript">
 function _go() {  
     var pc = $("#pageNo").val();//获取文本框中的当前页码  
     if(!/^[1-9]\d*$/.test(pc)) {//对当前页码进行整数校验  
         alert('请输入正确的页码！');  
         return;  
     }  
     if(pc > ${pageUtil.pageCount} || pc < 1) {//判断当前页码是否大于最大页  
         alert('请输入正确的页码！');  
         return;  
     }  
     location = "?pageNo=" + pc;  
 };
 
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