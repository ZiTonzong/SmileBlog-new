<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 公共头部 --> 
                <div class="pb-main pb-navwrap pb-after-clear"> 
                    <div class="pb-iblock pb-fl pb-logo"> 
                        <a href="index.jsp"><img src="${APP_PATH }/static/img/logo.jpg" alt="smile博客LOGO 征文比赛 有奖征文" /></a> 
                    </div> 
                    <div class="pb-iblock pb-fl pb-nav"> 
                        <ul> 
                            <li><a href="index.jsp">首页</a></li> 
                            <li><a href="science">科技博客</a></li> 
                            <li><a href="world">倾听世界</a></li> 
                            <li><a href="smileDay">每日一笑</a></li>
                            <li><a href="ear">叫醒耳朵</a></li>
                            <li class="pb-nav-li-last"><a href="laugh.html">我的日志</a></li> 
                        </ul> 
                    </div> 
                    <div class="pb-iblock pb-fr pb-oths"> 
                        <a class="nmt" href="javascript:void(0);" onclick="Sys.commStat(2);
              commonLib.SetHome(this);">设为首页</a> 
                        <a class="nmt" href="index.html" rel="sidebar" onclick="Sys.commStat(1);
              commonLib.addFavorite();">收藏我们</a> 
                        <a class="nmt" href="suggest.html">投诉建议</a> &nbsp; 
                        <span class="nmt"> | </span> 
                           
                           <c:if test="${sessionScope.logined eq null}">
									<a class="nmt" href="login.jsp">登录</a>
									<a class="nmt" href="register.jsp">注册</a>
						   </c:if>
				<c:if test="${not(sessionScope.logined eq null)}">
						<div class="pb-ucenter pb-after-clear"> 
                             <div id="uMessageCenter"> 
                                <i class="pb-icons triangle"></i> 
                                <a href="userinfo" id="uSetEntry-head"><img src="#" alt="${sessionScope.user.username}" /></a> 
                                <i class="pb-icons notice pb-hide"></i> 
                            </div> 
                            <br /> 
                            <ul> 
                                <li><a href="userinfo" id="uSetEntry"><i class="pb-icons my"></i> 个人中心</a></li> 
                                <li><a href="loginout" id="loginOut"><i class="pb-icons logout"></i> 退出登录</a></li> 
                            </ul> 
                        </div>
				</c:if>    
                        
                        <br /> 
                        <!-- <form action="" onsubmit="W.tips('暂未开放搜索功能，敬请期待!');
              Sys.commStat(6);
              return false;"> 
                            <input class="pb-search-btn" type="submit" value="" /> 
                            <input class="pb-search" type="text" /> 
                        </form>  -->
                        
                        <form id="serchSubmit" action="searchBlogByKeywords" method="get">
						<input type="text" id="keywords" 
						name="keywords"  class="pb-search" value="${requestScope.keywords==null?'搜索文章':requestScope.keywords}"
							onFocus="this.value = '';"
							onBlur="if (this.value == '') {this.value = '${requestScope.keywords==null?'搜索文章':requestScope.keywords}';}"> 
						<input class="pb-search-btn" type="submit" value="" /> 
					   </form>
                    </div> 
                </div> 
                <!-- 公共头部 --> 
         <script>
			$(function() {
				$("#loginOut").click(function(){
					/* 点击退出登陆后，重新载入页面 */
					//window.location.reload();
				});
			});
		</script>
</body>
</html>