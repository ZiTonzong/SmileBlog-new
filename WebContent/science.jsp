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
  <title>科技博文 - smile博客</title> 
  <meta name="keywords" content="博客,smile博客" /> 
  <meta name="description" content="smile博客是紧贴生活的小清新网站，近期上线的有奖科技博客更是受到了大家的热捧，给一些热爱写作的网友提供了一个很好的平台。smile博客的宗旨是分享笑，分享爱，让更多的人在欢声笑语下得到爱的滋润为其永恒不变的主题。网站提供时下每周一期的有奖征文，小清新图片、原创文章，搞笑段子。致力打造一片供人们心灵交流的绿洲。" /> 
  <link type="image/vnd.microsoft.icon" href="${APP_PATH }/static/img/favicon.png" rel="shortcut icon">
  <link rel="stylesheet" type="text/css" href="${APP_PATH }/static/css/common.css?v7.1" /> 
  <link rel="stylesheet" type="text/css" href="${APP_PATH }/static/css/public.css" /> 
  <script type="text/javascript" src="${APP_PATH }/static/js/jq.js"></script> 
    <script type="text/javascript" src="${APP_PATH }/static/js/ss.js"></script> 
  <link rel="stylesheet" type="text/css" href="${APP_PATH }/static/css/login.css" />
  <link rel="stylesheet" type="text/css" href="${APP_PATH }/static/css/jquery.slideBox.css" /> 
  <link rel="stylesheet" type="text/css" href="${APP_PATH }/static/css/index.css?v2" /> 
<link rel="stylesheet" type="text/css" href="${APP_PATH }/static/css/topics.css" />
<style type="text/css">
        .line{
            height: 80px;
            clear: both;
           /*  background-color: #ccc; */
            padding: 5px;
        }

        .leftimg{
            width: 125px;
            height: 125px;
            float: left;
            /* background-color: #ddd; */
        }
        .righttxt{
            float: left;
        }
        .righttxt dd{
            height: 30px;
            margin: 12px 10px 10px 10px;
           /*  background-color: #ddd; */

        }
        #sci_dl dt{
        	font-size: 25px;
        }
        #sci_dl dd{
            font-size: 16px;
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
     <a href="science">科技博客</a> &gt;&gt; 
     <a>全部</a> 
    </div> 
    <!-- 面包屑结束 --> 
    <!-- 当前页面内容 --> 
     
    <div class="pb-main pb-mt20"> 
     <!--专题章展示--> 
     <div class="topics-main pb-inner-main pb-mt10"> 
      <div class="head"> 
       <h1>科技博文</h1> 
       <p class="pb-mt10">给我一个支点，我就能撬动地球！</p> 
      </div> 
      <Br>
      <Br>
      <ul class="pb-mt30"> 
      <c:forEach items="${sciBlog}" var="sci" varStatus="csivs">
	      <li> 
	       <a href="articles?blogId=${sci.blogId}"><img src="${APP_PATH }/static/img/${sci.coverImage}" class="pb-fl" alt="#" /></a> 
	        <dl id="sci_dl"> 
	         <dt>
	          <a href="articles?blogId=${sci.blogId}">${sci.blogTitle}</a>
	         </dt> 
	         <dd class="pb-mt10">
	          <strong>作者昵称</strong> ： 
	          <a href="/user-10348">${sci.userNickname }</a>
	         </dd> 
	         <dd>
	          <strong>积分</strong> ： ${sci.userPoints }
	         </dd> 
	         <dd>
	          <strong>描述</strong> ： ${fn:substring(sci.blogDesc,0,37)}...
	         </dd> 
	        </dl> 
	        </li> 
      </c:forEach>
       
      </ul> 
      <div class="pb-mt50 pb-listpage"> 
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
     </div> 
     <!--专题章展示 end--> 
     
     <div class="pb-main-side pb-iblock pb-after-clear pb-fr pb-mt40"> 
      <h6 class="pb-clr1 pb-size-big">阅读排行</h6> 
      <div class="pb-line2 pb-mt5"> 
      </div> 
      <ul class="pb-mt10 previous-term pb-size-normal"> 
       <c:forEach items="${sciBlogsHot}" var="hot" varStatus="hotvs">
                            	<li> 
                           			 <span>.</span> <a href="articles?blogId=${hot.blogId}">${hot.blogTitle}</a> 
                                    <div class="pb-line2"> 
                                    </div> 
                                </li>
        </c:forEach>
      </ul> 
     </div> 
     <!--右侧我要投稿公共部分 end--> 
    </div> 
    <!-- 当前页面内容结束 --> 
   </div> 
   <!-- 公共尾部 --> 
  <%@ include file="footer.jsp"%>  
   <!-- 公共尾部 --> 
   <div class="ssretotop" id="goTopButton"> 
    <div class="SG-sidecont"> 
     <a style="visibility: visible;" href="javascript:;" id="gotonext"></a> 
     <a id="retotop" class="pb-icons" href="javascript:void(0)" style="visibility: visible;" title="点击我 坐飞机到顶部"></a> 
     <a href="javascript:;" id="gotopre"></a> 
    </div> 
   </div> 
  </div> 
  <script id="tpl-pb-rule" type="text/x-jsmart-tmpl">
		<img src="${APP_PATH }/static/img/rule.gif" alt="获奖规则"/>
		<a href="javascript:top.window.location.href='/user#go=cash';" style="position: absolute; cursor:pointer;height: 24px; width: 72px; left: 730px; top: 494px; display:inline-block;background:#fff;opacity:0; filter:alpha(opacity=0);"></a>
	</script> 
  <script language="javascript" type="text/javascript" src="js/15502332.js"></script> 
  <noscript>
   <a href="http://www.51.la/?15502332" target="_blank"><img alt="我要啦免费统计" src="${APP_PATH }/static/img/15502332.asp" style="border:none" /></a>
  </noscript> 
  <script type="text/javascript" language="javascript">
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

	</script>  
 </body>
</html>