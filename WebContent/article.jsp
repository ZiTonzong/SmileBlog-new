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
  <title>${blogDetail.blogTitle} - smile博客</title> 
  <meta name="keywords" content="博客,smile博客" /> 
  <meta name="description" content="smile博客是紧贴生活的小清新网站，近期上线的有奖科技博客更是受到了大家的热捧，给一些热爱写作的网友提供了一个很好的平台。smile博客的宗旨是分享笑，分享爱，让更多的人在欢声笑语下得到爱的滋润为其永恒不变的主题。网站提供时下每周一期的有奖征文，小清新图片、原创文章，搞笑段子。致力打造一片供人们心灵交流的绿洲。" /> 
  <link type="image/vnd.microsoft.icon" href="${APP_PATH }/static/img/favicon.png" rel="shortcut icon">
  <link rel="stylesheet" type="text/css" href="${APP_PATH }/static/css/lanrenzhijia.css" />
  <link rel="stylesheet" type="text/css" href="${APP_PATH }/static/css/common.css?v7.2" /> 
  <link rel="stylesheet" type="text/css" href="${APP_PATH }/static/css/public.css?v1" /> 
  <link rel="stylesheet" type="text/css" href="${APP_PATH }/static/css/article.css?v3" />
  <script type="text/javascript" src="${APP_PATH }/static/js/jq.js?v4.1"></script> 
  <script type="text/javascript" src="${APP_PATH }/static/js/ss.js?v4.8"></script> 
  <style type="text/css">
  .pb-icons{
	background-image:url("${APP_PATH}/static/img/icons.png");
	}
  </style>
 </head> 
 <body> 
 <!-- 回复评论楼层的时候，弹出编辑框 -->
 <div class="theme-popover" id="theme-popover2">
    <div class="theme-poptit" id="theme-poptit2">
        <a  title="关闭" class="close">×</a>
        <h3></h3>
    </div>
    <div class="" id="">
       <textarea rows="10" cols="20" style="border:1px soild black; font-size: 20px;" id="textarea_content">
                            
       </textarea> 
       <button style="font-size: 20px; color:green; padding-left: 80%;" id="btn_submit_comment">提交回复</button>
    </div>
</div>
<script type="text/javascript">
     $(function(){
    	 var logined = '<%= session.getAttribute("logined")%>';
    	 /* 
    	 使用append出的标签用on绑定事件无效的解决方法:  on方法中要先找到原选择器,再找到动态添加的选择器 
    	 如下,要给info-list中的动态添加的标签绑定事件
    	 以上代码执行时，点击#check_all时，alert一直没反应，后在网上查资料时，才知道on前面的元素也必须在页面加载的时候就存在于dom里面, 那原话是这样的：
支持给动态元素和属性绑定事件的是live和on，其中live在JQUERY 1.7之后就不推荐使用了。现在主要用on，使用on的时候也要注意，on前面的元素也必须在页面加载的时候就存在于dom里面。
动态的元素或者样式等，可以放在on的第二个参数里面。*/
    		 $('#gradeListUL').on("click",".cping",function(){
    			//如果用户没登录，弹窗提醒登录
    			 if(logined!=1){
    	      //   $('#cdk_comment').fadeOut(200);
    	       //  $('.pb-inner-main').css('display', 'none');
    	         $('#theme-popover1').slideDown(200);
    			 }
    			 else{
    			//	 $('#cdk_comment').fadeOut(200);
    	    	     $('#theme-popover2').slideDown(200);
    	    	     
     				 var replyNameId = $(this).parent().parent().find("span#span_reply_2").text();
     				// alert(replyNameId);
     				 var remarkId = $(this).parent().parent().parent().parent().parent().parent().find("span#span_remarkId").text();
     				 //alert(remarkId);
     				 var replyName = $(this).parent().parent().find("a#a_reply").text();
     				 var blogId = ${blogDetail.blogId};
     				 var userId = '<%= session.getAttribute("userId")%>'; 
     				// alert(replyName);
     				 $("#theme-popover2").find("h3").html("回复&nbsp;&nbsp;<font color='black'>"+ replyName +"</font>:");
     				 $('#btn_submit_comment').click(function(){
     					//获取回复文本框中的内容
     					 var comment_content = $("#textarea_content").val();
     					// alert(comment_content);
     					//回复的内容不能为空
     					if(comment_content=="" || comment_content==null){
     						alert("回复的内容不能为空！");
     					}
     					else{
     						var json = {"fromUserId":userId,"blogId":blogId,"content":comment_content,"toUserId":replyNameId,"remarkId":remarkId};
         					var url = "submitReply1";
         						$.post(url,json,function(data){
         							var subStatus = data[0].subStatus;
         							//alert(subStatus);
         							if(subStatus=="true"){
         								/*1.ajax更新显示，用户体验较好但js代码复杂 */
         								//评论提交成功后显示在评论栏，如果当前评论栏评论已满则显示在下一页当中${comments}
         								
         								/*2.刷新整个页面显示，用户体验一般但js简单好理解
         									本项目采用第二种方法
         								*/
         								
         								//刷新页面显示
         						        setTimeout(function(){
     											window.location.reload();//刷新当前页面.
     											},2000);
         								alert("回复提交成功！");
         							}
         							else {
         								alert("服务器异常，评论提交失败！");
         							}
         						},"json");
         				 }
         			 
     					});
    			 }
    			 
    	     });
    	 
    		 $('#gradeListUL').on("click","#id_ping",function(){
    			//如果用户没登录，弹窗提醒登录
    			 if(logined!=1){
    	       //  $('#cdk_comment').fadeOut(200);
    	         $('#theme-popover1').slideDown(200);
    			 }
    			 else{
    				 $('#theme-popover2').slideDown(200);
    				// var remarkId = $(this).parent().parent().parent().attr("ID");
    				// alert(remarkId); 
    				 var replyNameId = $(this).parent().parent().find("a.p7").attr("ID");
    				 var remarkId = $(this).parent().parent().find("span#span_remarkId").text();
    				 var replyName = $(this).parent().parent().find("a.p7").text();
    				 var blogId = ${blogDetail.blogId};
    				 var userId = '<%= session.getAttribute("userId")%>'; 
    				 //alert(replyName);
    				 $("#theme-popover2").find("h3").html("回复&nbsp;&nbsp;<font color='black'>"+ replyName +"</font>:");
    				 $('#btn_submit_comment').click(function(){
    					//获取回复文本框中的内容
    					 var comment_content = $("#textarea_content").val();
    					// alert(comment_content);
    					//回复的内容不能为空
    					if(comment_content=="" || comment_content==null){
    						alert("回复的内容不能为空！");
    					}
    					else{
    						var json = {"fromUserId":userId,"blogId":blogId,"content":comment_content,"toUserId":replyNameId,"remarkId":remarkId};
        					var url = "submitReply1";
        						$.post(url,json,function(data){
        							var subStatus = data[0].subStatus;
        							//alert(subStatus);
        							if(subStatus=="true"){
        								/*1.ajax更新显示，用户体验较好但js代码复杂 */
        								//评论提交成功后显示在评论栏，如果当前评论栏评论已满则显示在下一页当中${comments}
        								
        								/*2.刷新整个页面显示，用户体验一般但js简单好理解
        									本项目采用第二种方法
        								*/
        								
        								//刷新页面显示
        						        setTimeout(function(){
    											window.location.reload();//刷新当前页面.
    											},2000);
        								alert("回复提交成功！");
        							}
        							else {
        								alert("服务器异常，评论提交失败！");
        							}
        						},"json");
        				 }
        			 
    					});
    				 
    			 }
    		 });
    		 
	     $('#theme-poptit2 .close').click(function(){
	      //   $('#cdk_comment').fadeIn(200);
	         $('#theme-popover2').slideUp(200);
	     });
     });
     </script>
<!-- 回复评论楼层的时候，弹出编辑框end -->

 <!-- 登录弹窗样式start -->
 <div class="theme-popover" id="theme-popover1">
    <div class="theme-poptit" id="theme-poptit1">
        <a  title="关闭" class="close">×</a>
        <h3>登录 是一种态度</h3>
    </div>
    <div class="theme-popbod dform" id="theme-popbod1">
        <form class="theme-signin" name="loginform" action="login" method="post">
            <ol>
                <li><h4>请先登录！&nbsp;&nbsp;|&nbsp;&nbsp;没有账号？ <a href="register.jsp">立即注册</a></h4></li>
                <li><strong>用户名：</strong><input class="ipt" type="text" name="username"  size="20" id="username"/></li>
                <li><strong>密码：</strong><input class="ipt" type="password" name="password"  size="20" id="password"/></li>
                <li><span id="errorMsg" style="color:red"></span></li>
                <li><input class="btn btn-primary" type="submit" name="submit" value=" 登 录 " id="sub2"/></li>
            </ol>
        </form>
    </div>
</div>
 
<script>
	$(function() {
		$("#sub2").click(function(){
			var username = $.trim($("#username").val());
			var password = $("#password").val();
			
			var json = {"username":username,"password":password};
			var url = "login";
			$.post(url,json,function(data){
				var logStatus = data[0].logStatus;
				$("#errorMsg").text("");
				//alert(logStatus);
				if(logStatus=="true"){
					//window.location.href = "index.jsp";
					//$(#user-login-form).submit();
					//return true;
					alert("登录成功！");
					$('.pb-container').fadeIn(200);
			        $('.theme-popover').slideUp(200);
			        //刷新页面显示
			        window.location.reload();
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
 <!-- 登录弹窗样式end -->
  <div class="pb-container"> 
   <div class="pb-container-main pb-after-clear"> 
    <!-- 公共头部 --> 
    <%@ include file="header.jsp"%> 
    <!-- 公共头部 --> 
    
    <!-- 面包屑 --> 
    <div class="pb-main pb-breadcrumbs pb-mt40 pb-size-small"> 
     <a href="index.html">首页</a> &gt;&gt; 
     <a href="news.html">科技博客</a> &gt;&gt;
     <a>${blogDetail.blogTitle}</a> 
    </div> 
    <!-- 面包屑结束 --> 
    <!-- 当前页面内容 --> 
    
    <div class="pb-main pb-mt20"> 
     <!--主文章展示--> 
     <div class="atl-main pb-inner-main"> 
      <div class="pb-after-clear"> 
       <h1 class="pb-fl">${blogDetail.blogTitle}</h1> 
       <h3 class="pb-fl"><a href="news_detail.html?-10" class="pb-block">${blogDetail.blogDesc}</a></h3> 
      </div> 
      <div class="pb-mt15 pb-size-tiny meta"> 
       <span class="dt">${blogDetail.time}</span> 
       <span class="at">作者：${blogDetail.userNickname}</span> &nbsp;&nbsp;|&nbsp;&nbsp; 
       <span class="vw"><i class="pb-icons"></i>阅读数（${blogDetail.readNum}）</span> &nbsp;&nbsp;|&nbsp;&nbsp; 
       <span class="ct"><i class="pb-icons"></i>评论（${remarkCount}）</span> &nbsp;&nbsp;|&nbsp;&nbsp; 
      <!--  <span class="sc"><i class="pb-icons"></i>得分（1）</span>  -->
      </div> 
      <div class="pb-mt20 cnt"> 
       ${blogDetail.article}
      </div> 
      
     
      <div class=" pb-mt50"> 
       <h6 class="pb-clr1 pb-size-big">猜你喜欢</h6> 
       <ul class="wqzt pb-mt10"> 
        <c:forEach items="${sciBlogsRecommend}" var="sciRec" varStatus="sciRecvs" begin="0" end="2">
                        	<li> 
                                <dl> 
                                    <dt> 
                                        <a href="articles?blogId=${sciRec.blogId}"><img alt="#" src="${APP_PATH }/static/img/${sciRec.coverImage}" height="163px" /></a> 
                                    </dt> 
                                    <dd>
                                        <a href="articles?blogId=${sciRec.blogId}">${sciRec.blogTitle}</a>
                                    </dd> 
                                </dl> 
                             </li> 
                        </c:forEach>
                        <c:forEach items="${sciBlogsRecommend}" var="sciRec" varStatus="sciRecvs" begin="3" end="3">
                        	<li style="margin-right:0;"> 
                                <dl> 
                                    <dt> 
                                        <a href="articles?blogId=${sciRec.blogId}"><img alt="#" src="${APP_PATH }/static/img/${sciRec.coverImage}" height="163px" /></a> 
                                    </dt> 
                                    <dd>
                                        <a href="articles?blogId=${sciRec.blogId}">${sciRec.blogTitle}</a>
                                    </dd> 
                                </dl> 
                             </li> 
                        </c:forEach>
                        
       </ul> 
      </div> 
      <div id="cdk_comment"> 
      <div class="atl-cmtlist pb-mt50 pb-after-clear" id="pb-cmtlist-wp">
       <div class="head pb-clr1 pb-size-small pb-after-clear"> 
        <span class="pb-fl">全部评论（<i>${remarkCount}</i>）</span> 
       </div> 
       <div class="body pb-mt40 pb-after-clear"> 
        <ul id="gradeListUL"> 
<c:if test="${not(comments eq null)}">
<c:forEach items="${comments}" var="comments" varStatus="commentsvs" begin="0" end="4">
 <li class="pli"  nick="${comments.remNickname}">
    <a target="_blank" href="/user-10430" class="avatars pb-fl">
        <img src="${APP_PATH }/static/img/${comments.remHeadImg}" style="width:60px;height:60px;" alt="${comments.remNickname}">
    </a>
    <div class="rbox">
        <div class="nickbar">
            <div class="point" id="point_745" style="width:0%;" score="4" userId="10430"><i class="pb-icons ">4</i></div>
            <a target="_blank" href="/user-10430" class="p7" id="${comments.fromUserId}">${comments.remNickname}</a><span style="display:none;" id="span_remarkId">${comments.remarkId}</span>
        </div>
        <div class="cnt">${comments.content}</div>
        <div class="btbar pb-size-small pb-after-clear">
            <span title="${comments.time}" class="date">${comments.time}</span>
            <a  class="ping" cpid="745" rcpid="745" userid="10430" id="id_ping"><i class="pb-icons"></i>回复(${comments.replyDetails.size()})</a>
        </div>
    </div>
    <div class="rdiv pb-after-clear">
        <ul id="childgradeListUL">
        <c:forEach items="${comments.replyDetails}" var="replyDetails" varStatus="replyDetailsvs">
            <li id="comment_li" nick="${replyDetails.replyUserNickname}">
                <a target="_blank" href="/user-10348" class="avatars pb-fl">
                    <img src="${APP_PATH }/static/img/${replyDetails.replyUserHeadImg}" style="width:60px;height:60px;" alt="${replyDetails.fromUserId}">
                </a>
                <div class="rbox rrbox">
                    <div class="nickbar rnickbar"><a target="_blank" href="/user-10348" id="a_reply">${replyDetails.replyUserNickname}</a><span style="display: none;" id="span_reply_2">${replyDetails.toUserId}</span>@<a target="_blank" href="/user-10430">${replyDetails.toUserNickname}</a></div>
                    <div class="cnt">${replyDetails.content}</div>
                    <div class="btbar pb-size-small">
                        <span title="${replyDetails.time}">${replyDetails.time}</span>
                        <a class="ping cping" cpid="745" rcpid="751" userid="10348"><i class="pb-icons"></i></a>
                    </div>
                </div>
            </li>
         </c:forEach>
        </ul>
        <input class="pb-mt10 " type="button" value="回复 "/>
        <div contentEditable=true class="pb-size-normal pb-mt10 textarea" cpid="745" rcpid="745"></div>
    </div>
</li>
</c:forEach>
</c:if>
        </ul> 
        <div class="pb-mt50 pb-listpage"> 
        <!-- 分页显示 -->
       <table>
        <tbody>
         <tr>
         	<td><a class="yiiPagerA" id="firstPage">首  页</a></td>
        	<td><a class="yiiPagerA" id="prevPage">上一页</a></td>
        	<td><a class="yiiPagerA" id="nextPage">下一页</a></td>
        	<td><a class="yiiPagerA" id="lastPage">末  页</a></td>
        	<td id="td_page"><label>共${pageUtil.pageNo} / ${pageUtil.pageCount}页&nbsp;</label><td>
         </tr>
        </tbody>
       </table> 
       <!-- 分页显示 end-->
      </div> 
       </div> 
       <div class="pb-mt50 pb-fl pb-listpage"> 
       </div> 
      </div> 
<script>
      <%--文章评论开始--%>
      var blogId = "${blogDetail.blogId}";
      $(function(){
        var currPage = parseInt("${pageUtil.pageNo}");
    	var pageCount = parseInt("${pageUtil.pageCount}");
      	toggleClassToButton(currPage,pageCount);
      	$("#firstPage").click(function(){
      		currPage = 1;
      		getResultAndAppend(currPage);
      	});
      	$("#prevPage").click(function(){
      		if(currPage > 1){
      			currPage -= 1;
      			getResultAndAppend(currPage);
      		}
      	});
      	$("#nextPage").click(function(){
      		if(currPage < pageCount){
      			currPage += 1;
      			getResultAndAppend(currPage);
      		}
      	});
      	$("#lastPage").click(function(){
      		currPage = pageCount;
      		getResultAndAppend(currPage);
      	});
      	
      });
      function getResultAndAppend(currPage){
      	var json = {"blogId":blogId,"pageNo":currPage};
      	$.post("pageComment",json,function(data){
      		//alert(data[1].comments[0].replyDetails[1].replyUserNickname);
      		var dataCount = data[0].pageUtil.totalCount;
      		var currPage1 = data[0].pageUtil.pageNo;
      		var pageCount = data[0].pageUtil.pageCount;
      		var pageDataList = data[1].comments;
      		$("ul#gradeListUL").empty();
      		
      		$.each(pageDataList,function(j,remark){
    			$("ul#gradeListUL").append(
    					"<li class='pli'  nick='remark.remNickname'>" + 
    				    "<a target='_blank' href='/user-10430' class='avatars pb-fl'>" + 
    				        "<img src="  + "/Blog_cdk/static/img/" + remark.remHeadImg + " style='width:60px;height:60px;' alt='remark.remNickname'>" + 
    				    "</a>" + 
    				    "<div class='rbox'>" + 
    				        "<div class='nickbar'>" + 
    				            "<div class='point' id='point_745' style='width:0%;' score='4' userId='10430'>" + "<i class='pb-icons '>" + 4 + "</i>" + "</div>" + 
    				            "<a target='_blank' href='/user-10430' class='p7' id='" + remark.fromUserId + "'>" + remark.remNickname + "</a>" + 
    				            "<span style='display:none;' id='span_remarkId'>" + remark.remarkId + "</span>" +
    				        "</div>" + 
    				        "<div class='cnt'>" + remark.content + "</div>" + 
    				        "<div class='btbar pb-size-small pb-after-clear'>" + 
    				            "<span title='remark.time' class='date'>" + remark.time + "</span>" + 
    				            "<a class='ping' cpid='745' rcpid='745' userid='10430' id='id_ping'>" + "<i class='pb-icons'>" + "</i>" + "回复(" + remark.replyDetails.length + ")</a>" + 
    				        "</div>" + 
    				    "</div>" + 
    				    "<div class='rdiv pb-after-clear'>" + 
    				        "<ul id='" + j + "'>" + "</ul>" +
    				        "<input class='pb-mt10 ' type='button' value='回复 '/>" + 
    				        "<div contentEditable=true class='pb-size-normal pb-mt10 textarea' cpid='745' rcpid='745'>" + "</div>" + 
    				    "</div>" + 
    				"</li>" 
    			);
    			//var ghtml = "";
    			
    			//alert(ghtml);
    		});
      		 $.each(pageDataList,function(j,remark){
      			$.each(remark.replyDetails,function(i,reply){
      				//console.log(reply);
    				$("#"+j).append( "<li  nick='reply.replyUserNickname'>" + 
                    "<a target='_blank' href='/user-10348' class='avatars pb-fl'>" + 
			        "<img src="  + "/Blog_cdk/static/img/" + reply.replyUserHeadImg + " style='width:60px;height:60px;' alt='reply.fromUserId'>" + 
                "</a>" + 
                "<div class='rbox rrbox'>" + 
                    "<div class='nickbar rnickbar'>" + "<a target='_blank' href='/user-10348' id='a_reply'>" + reply.replyUserNickname + "</a>" +
		            "<span style='display:none;' id='span_reply_2'>" + reply.toUserId + "</span>" +
                     "@" + "<a target='_blank' href='/user-10430'>" + reply.toUserNickname + "</a>" + "</div>" + 
                    "<div class='cnt'>" + reply.content + "</div>" + 
                    "<div class='btbar pb-size-small'>" + 
                        "<span title='reply.time'>" + reply.time + "</span>" + 
                        "<a  class='ping cping' cpid='745' rcpid='751' userid='10348'>" + "<i class='pb-icons'>" + "</i>" + "</a>" + 
                    "</div>" + 
                "</div>" + 
            "</li>"
    				)
    			});
      		}); 
		//	$("ul#gradeListUL").append("<font style='color:red'>I love</font>");
      		$("#td_page label").text("共"+ currPage1 + " / " + pageCount+ "页  ");
      	//	toggleClassToButton(currPage1,pageCount);
      	},"json");
      }
      function toggleClassToButton(currPage,pageCount){
      	if(currPage==pageCount){
      		$("#lastPage").removeClass("active");
      		$("#nextPage").removeClass("active");
      	}
      	if(currPage==1){
      		$("#firstPage").removeClass("active");
      		$("#prevPage").removeClass("active");
      	}
      	if(currPage>1){
      		$("#firstPage").addClass("active");
      		$("#prevPage").addClass("active");
      	}
      	if(currPage < pageCount){
      		$("#lastPage").addClass("active");
      		$("#nextPage").addClass("active");
      	}
      }
   //   文章评论end
</script> 

      <div class="atl-cmtbox pb-mt50 pb-after-clear"> 
       <input class="but pb-fr" type="button" value="评&nbsp;论" id="btn_comment"/> 
       <div contenteditable="true" class="pb-size-normal ta pb-fl" cpid="0" rcpid="0" id="foot_area_comment"></div> 
      </div>
      </div> 
     </div> 
     <!-- 提交评论 -->
     <script type="text/javascript">
     $(function(){
    	 var logined = '<%= session.getAttribute("logined")%>';
    		 $('#btn_comment').click(function(){
    			//如果用户没登录，弹窗提醒登录
    			 if(logined!=1){
    	        // $('#cdk_comment').fadeOut(200);
    	         $('#theme-popover1').slideDown(200);
    			 }
    			 else{
    				 //alert($('#foot_area_comment')[0].innerText);
    				var remarkText = $('#foot_area_comment')[0].innerText;
    				 if(remarkText=="" || remarkText==null){
    					 alert("评论内容不能为空！");
    				 }
    				 else{
    					 //获得登录用户对象
    					 var userId = '<%= session.getAttribute("userId")%>';
    					 console.log(userId);
    					 //获得文章作者昵称
    					// var authorNickname = ${blogDetail.userNickname};
    					//获得博客id
    					var blogId = ${blogDetail.blogId};
    					var json = {"userId":userId,"blogId":blogId,"remarkText":remarkText};
    					var url = "submitRemark";
    						$.post(url,json,function(data){
    							var subStatus = data[0].subStatus;
    							//alert(subStatus);
    							if(subStatus=="true"){
    								/*1.ajax更新显示，用户体验较好但js代码复杂 */
    								//评论提交成功后显示在评论栏，如果当前评论栏评论已满则显示在下一页当中${comments}
    								
    								/*2.刷新整个页面显示，用户体验一般但js简单好理解
    									本项目采用第二种方法
    								*/
    								
    								//刷新页面显示
    						        setTimeout(function(){
											window.location.reload();//刷新当前页面.
											},2000);
    								alert("评论提交成功！");
    							}
    							else {
    								alert("服务器异常，评论提交失败！");
    							}
    						},"json");
    				 }
    			 }
    	     });
    	 
	     $('#theme-poptit1 .close').click(function(){
	         $('#cdk_comment').fadeIn(200);
	         $('#theme-popover1').slideUp(200);
	     });
     });
     </script>
     <!--主文章展示 end--> 
     <!--右侧我要投稿公共部分--> 
     <div class="commside"> 
      <div class="pb-iblock pb-fr pb-main-side"> 
       <img style="width:100px;height:100px;" class="pb-fl" alt="小红楼" src="${APP_PATH }/static/img/${blogDetail.userHeadImg}" /> 
       <p class="atl-uinfo-p">作者昵称：${blogDetail.userNickname}<a href="/user-10348"><i class="pb-icons house"></i></a></p> 
       <p class="atl-uinfo-p">当前积分：${blogDetail.userPoints}</p> 
       <p class="atl-uinfo-p">个性签名：${blogDetail.userAbout}</p> 
      </div> 
      <!--右侧阅读排行--> 
      <div class="pb-iblock pb-fr pb-after-clear pb-main-side pb-mt30"> 
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
      <!--右侧阅读排行END--> 
      <div style="clear:both;"></div> 
      <div class="sidewrap  pb-mt40"> 
       <h6 class="pb-clr1 pb-size-big">倾听世界</h6> 
       <div class="pb-line2 pb-mt5"> 
       </div> 
       <div class="con pr" style="height:480px;overflow:hidden;"> 
        <div class="single" style="left:150px;height:150px;top:15px;"> 
         <a href="pic_detail.html?1" title="清纯唯美写真合集"><img style="width:145px;" src="${APP_PATH }/static/img/qing_10001_7b053ee001_310.jpg" alt="清纯唯美写真合集" /></a> 
        </div> 
        <div class="single" style="left:0px;height:150px;top:15px;"> 
         <a href="pic_detail.html?3" title="也许我就是一块老墨"><img style="width:145px;" src="${APP_PATH }/static/img/qing_10001_2278c48f96_310.jpg" alt="也许我就是一块老墨" /></a> 
        </div> 
        <div class="single" style="left:150px;height:150px;top:170px;"> 
         <a href="pic_detail.html?4" title="证件照"><img style="width:145px;" src="${APP_PATH }/static/img/qing_9999_6963913fb8_310.jpg" alt="证件照" /></a> 
        </div> 
        <div class="single" style="left:0px;height:150px;top:170px;"> 
         <a href="pic_detail.html?6" title="享笑网2015-5-30#325806#"><img style="width:145px;" src="${APP_PATH }/static/img/qing_10001_3f5af7636f_310.jpg" alt="享笑网2015-5-30#325806#" /></a> 
        </div> 
        <div class="single" style="left:150px;height:150px;top:325px;"> 
         <a href="pic_detail.html?7" title="爱情就是一百多年的孤寂"><img style="width:145px;" src="${APP_PATH }/static/img/qing_10001_5502d62ca8_310.jpg" alt="爱情就是一百多年的孤寂" /></a> 
        </div> 
        <div class="single" style="left:0px;height:150px;top:325px;"> 
         <a href="pic_detail.html?10" title="中国书法家【郝天明】书法新作(妙笔生辉"><img style="width:145px;" src="${APP_PATH }/static/img/qing_10001_bcf83a76ac_310.jpg" alt="中国书法家【郝天明】书法新作(妙笔生辉" /></a> 
        </div> 
       </div> 
      </div> 
     </div> 
     <!--右侧我要投稿公共部分--> 
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
		<a href="javascript:top.window.location.href='/user#go=cash';" style="position: absolute; cursor:pointer;height: 24px; width: 72px; left: 730px; top: 494px; display:inline-block;background:#fff;opacity:0; filter:alpha(opacity=0);"></a>
	</script> 
  <script language="javascript" type="text/javascript" src="${APP_PATH }/static/js/15502332.js"></script> 
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
	</script> 
  <script type="text/javascript" src="${APP_PATH }/static/js/form.js"></script>  
 </body>
</html>