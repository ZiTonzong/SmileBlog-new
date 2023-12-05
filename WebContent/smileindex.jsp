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
  <title>首页 - smile博客</title> 
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
    </style>
  <script type="text/javascript">
                    $(document).ready(function() {
                        $('#bSlideBox').slideBox({
                            duration: 0.7,
                            //direction : 'top',
                            easing: 'linear',
                            delay: 10,
                            hideClickBar: true,
                            clickBarRadius: 10
                        });
                    });
  </script> 
</head>
 <body> 
  <div class="pb-container"> 
            <div class="pb-container-main pb-after-clear"> 
                <!-- 公共头部 --> 
                <%@ include file="header.jsp"%>   
                <!-- 公共头部 --> 
                <!-- 当前页面内容 --> 
                
                <div class="pb-main pb-mt10"> 
                    <div id="bSlideBox" class="pb-main slideBox"> 
                        <ul class="items"> 
                            <li><a target="_blank" onclick="Sys.commStat(46);" href="#"><img src="${APP_PATH }/static/img/banner_10001_3f4dac09bb.jpg" alt="开学季 开学梦想 开学展望 开学励志 九月开学 青春梦想" /></a></li> 
                            <li><a target="_blank" onclick="Sys.commStat(47);" href="#"><img src="${APP_PATH }/static/img/banner_10001_300a22a90b.jpg" alt="倾听世界,世界这么大,我想去走走" /></a></li> 
                        	<li><a target="_blank" onclick="Sys.commStat(47);" href="#"><img src="${APP_PATH }/static/img/bg2.jpg" alt="倾听世界,世界这么大,我想去走走" /></a></li> 
                        </ul> 
                    </div> 
                </div>  
                
                
                <div style="clear:both;"></div> 
                <div class="pb-main pb-mt20"> 
                    <h3 class="idx-t1"> <a href="news.html" class="pb-clr1">科技博客</a> </h3> 
                    <div class="idx-line1"> 
                    </div> 
                    <div class="idx-ycwz-1 pb-mt20 pb-after-clear"> 
                        <a href="news_detail.html?-10" class="pb-iblock pb-fl"> <img src="${APP_PATH }/static/img/science.jpg" width="300px" class="pb-block" alt="本期科技博客" /> </a> 
                        <div class="pb-iblock pb-fl d1"> 
                            <h6><a href="news_detail.html?-10" class="pb-clr1 pb-size-big">近期科技博文 | <span>xxxxxxx</span></a></h6> 
                            <div class="pb-line2 pb-mt5" style="border:0;"> 
                            </div> 
                            <ul> 
                            <c:forEach items="${sciBlogsLast}" var="last" varStatus="lastvs">
                            	<li class="pb-mt20">
                            	 <a href="articles?blogId=${last.blogId}"><img src="${APP_PATH }/static/img/${last.coverImage}" class="pb-fl" alt="#" /></a> 
                                 <a href="articles?blogId=${last.blogId}" class="pb-fl rt">${last.blogTitle} / ${last.userNickname}</a> 
                                 <p class="pb-iblock">${fn:substring(last.blogDesc,0,37)}...</p>
                            	</li>
                            </c:forEach>
                            </ul> 
                        </div> 
                        <!--右侧博文推荐--> 
                        <div class="pb-iblock pb-fr pb-after-clear pb-main-side"> 
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
                        <!--右侧博文推荐--> 
                    </div> 
                    
                    <h3 class="idx-t2 pb-mt50 pb-clr1">猜你喜欢</h3> 
                    <div class="pb-line2 pb-mt5"> 
                    </div> 
                    <div class="idx-wqzt pb-mt15 pb-after-clear"> 
                        <ul class="idx-wqzt pb-mt10"> 
                        <c:forEach items="${sciBlogsRecommend}" var="sciRec" varStatus="sciRecvs" begin="0" end="3">
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
                        <c:forEach items="${sciBlogsRecommend}" var="sciRec" varStatus="sciRecvs" begin="4" end="4">
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
                    <h3 class="idx-qtsj-t pb-mt50"> 
                        <div class="inx-qtsj-line pb-fr"></div> 
                        <div class="inx-qtsj-line pb-fl"></div> <a href="pic.html"> <span class="chn">倾听世界</span> <br /> <span class="eng">LISTEN TO THE WORLD</span> </a> </h3> 
                    <div class="idx-qtsj pb-mt20 pb-after-clear"> 
                        <ul> 
                            <li> <a href="pic_detail.html?1"> <img src="${APP_PATH }/static/img/qing_10001_7b053ee001_310.jpg" class="pb-block" style="width:200px;" alt="美女,清纯唯美写真合集" /> </a> 
                                <table class="pb-opac70"> 
                                    <tbody>
                                        <tr> 
                                            <td class="tle">美女</td> 
                                            <td class="num">+${number[0]}</td> 
                                        </tr> 
                                    </tbody>
                                </table> </li> 
                            <li> <a href="pic_detail.html?3"> <img src="${APP_PATH }/static/img/qing_10001_2278c48f96_310.jpg" class="pb-block" style="width:200px;" alt="旅行,也许我就是一块老墨" /> </a> 
                                <table class="pb-opac70"> 
                                    <tbody>
                                        <tr> 
                                            <td class="tle">旅行</td> 
                                            <td class="num">+${number[1]}</td> 
                                        </tr> 
                                    </tbody>
                                </table> </li> 
                            <li> <a href="pic_detail.html?4"> <img src="${APP_PATH }/static/img/qing_9999_6963913fb8_310.jpg" class="pb-block" style="width:200px;" alt="搞笑,证件照" /> </a> 
                                <table class="pb-opac70"> 
                                    <tbody>
                                        <tr> 
                                            <td class="tle">搞笑</td> 
                                            <td class="num">+${number[2]}</td> 
                                        </tr> 
                                    </tbody>
                                </table> </li> 
                            <li> <a href="pic_detail.html?6"> <img src="${APP_PATH }/static/img/qing_10001_3f5af7636f_310.jpg" class="pb-block" style="width:200px;" alt="性感,享笑网2015-5-30#325806#" /> </a> 
                                <table class="pb-opac70"> 
                                    <tbody>
                                        <tr> 
                                            <td class="tle">性感</td> 
                                            <td class="num">+${number[3]}</td> 
                                        </tr> 
                                    </tbody>
                                </table> </li> 
                            <li style="margin-right:0;"> <a href="pic_detail.html?7"> <img src="${APP_PATH }/static/img/qing_10001_5502d62ca8_310.jpg" class="pb-block" style="width:200px;" alt="情感,爱情就是一百多年的孤寂" /> </a> 
                                <table class="pb-opac70"> 
                                    <tbody>
                                        <tr> 
                                            <td class="tle">情感</td> 
                                            <td class="num">+${number[4]}</td> 
                                        </tr> 
                                    </tbody>
                                </table> </li> 
                            <li> <a href="pic_detail.html?10"> <img src="${APP_PATH }/static/img/qing_10001_bcf83a76ac_310.jpg" class="pb-block" style="width:200px;" alt="艺术,中国书法家【郝天明】书法新作(妙笔生辉" /> </a> 
                                <table class="pb-opac70"> 
                                    <tbody>
                                        <tr> 
                                            <td class="tle">艺术</td> 
                                            <td class="num">+${number[5]}</td> 
                                        </tr> 
                                    </tbody>
                                </table> </li> 
                            <li> <a href="pic_detail.html?13"> <img src="${APP_PATH }/static/img/qing_10001_8b07d372b1_310.jpg" class="pb-block" style="width:200px;" alt="漫画,享笑网2015-6-8#529409#" /> </a> 
                                <table class="pb-opac70"> 
                                    <tbody>
                                        <tr> 
                                            <td class="tle">漫画</td> 
                                            <td class="num">+${number[6]}</td> 
                                        </tr> 
                                    </tbody>
                                </table> </li> 
                            <li> <a href="pic_detail.html?15"> <img src="${APP_PATH }/static/img/qing_10001_7610be26ad_310.jpg" class="pb-block" style="width:200px;" alt="超萌,步调一致" /> </a> 
                                <table class="pb-opac70"> 
                                    <tbody>
                                        <tr> 
                                            <td class="tle">超萌</td> 
                                            <td class="num">+${number[7]}</td> 
                                        </tr> 
                                    </tbody>
                                </table> </li> 
                            <li> <a href="pic_detail.html?22"> <img src="${APP_PATH }/static/img/qing_9999_578544d87f_310.jpg" class="pb-block" style="width:200px;" alt="回忆,如果你喜欢的人不喜欢你,那么就算全世界的人都喜欢你 也还是会觉得很孤单吧。" /> </a> 
                                <table class="pb-opac70"> 
                                    <tbody>
                                        <tr> 
                                            <td class="tle">回忆</td> 
                                            <td class="num">+${number[8]}</td> 
                                        </tr> 
                                    </tbody>
                                </table> </li> 
                            <li style="margin-right:0;"> <a href="pic_detail.html?24"> <img src="${APP_PATH }/static/img/qing_10001_4f8ce7bfa4_310.jpg" class="pb-block" style="width:200px;" alt="清新,最大的遗憾" /> </a> 
                                <table class="pb-opac70"> 
                                    <tbody>
                                        <tr> 
                                            <td class="tle">清新</td> 
                                            <td class="num">+${number[9]}</td> 
                                        </tr> 
                                    </tbody>
                                </table> </li> 
                        </ul> 
                    </div> 
                    <div style="clear:both;"></div> 
                    <h3 class="idx-t1 pb-mt50"> <a href="laugh.html" class="pb-clr1">每日一笑</a> </h3> 
                    <div class="idx-line1"> 
                    </div> 
                    <div class="idx-mryx pb-mt20 pb-after-clear"> 
                        <div class="d1 pb-fl"> 
                            <img src="${APP_PATH }/static/img/b_smile_left.jpg" class="pb-fl" alt="最新搞笑段子,每日一笑" /> 
                            <a href="laugh.html" class="tle pb-fl pb-clr1">搞笑段子&nbsp;&nbsp;|&nbsp;&nbsp; <span class="pb-clr2">更多</span></a> 
                            <ul class="pb-mt15 pb-fl pb-size-normal"> 
                            <c:forEach items="${laughLast}" var="llast" varStatus="llastvs">
                            	<li> <span>.</span> <a href="articles?blogId=${llast.blogId}">${llast.blogTitle}</a> </li> 
                            </c:forEach>
                            </ul> 
                        </div> 
                        <div class="d1 pb-fl d1-2"> 
                            <img src="${APP_PATH }/static/img/b_smile_left1.jpg" class="pb-fl" alt="本周搞笑段子排行榜,笑话排,每日一笑" /> 
                            <a href="/jokes?priority=pop" class="tle pb-fl pb-clr1">笑话排行&nbsp;&nbsp;|&nbsp;&nbsp; <span class="pb-clr2">更多</span></a> 
                            <ul class="pb-mt15 pb-fl pb-size-normal"> 
                            <c:forEach items="${laughHot}" var="lhot" varStatus="lhotvs">
                            	<li> <span>.</span> <a href="articles?blogId=${lhot.blogId}">${lhot.blogTitle}</a> </li> 
                            </c:forEach>
                            </ul> 
                        </div> 
                        <div class="d2 pb-fr"> 
                            <img class="pb-block" src="${APP_PATH }/static/img/b_smile_right.jpg" alt="少儿不宜搞笑段子,超级内涵搞笑段子，校园搞笑段子,生活中的搞笑段子" /> 
                            <table class="pb-mt10"> 
                                <tbody>
                                    <tr> 
                                        <td><a href="laugh.html">各种口味</a></td> 
                                        <td><a href="/jokes-2">少儿不宜</a></td> 
                                        <td><a href="/jokes-4">超级内涵</a></td> 
                                    </tr> 
                                    <tr> 
                                        <td><a href="/jokes-1">图片笑话</a></td> 
                                        <td><a href="/jokes-5">贴近生活</a></td> 
                                        <td><a href="/jokes-3">校园趣闻</a></td> 
                                    </tr> 
                                </tbody>
                            </table> 
                        </div> 
                    </div> 
                    <div style="clear:both;"></div> 
                    <h3 class="idx-t1 pb-mt50"> <a href="http://www.lanrenzhijia.com/" class="pb-clr1">叫醒耳朵</a> </h3> 
                    <div class="idx-line1"> 
                    </div> 
                    <div class="idx-jxed pb-mt20 pb-after-clear"> 
                        <div class="pb-fl d1"> 
                            <ul> 
                            <c:forEach items="${earLast}" var="elast" varStatus="elastvs" begin="0" end="1">
                            	<li> 
                            	<div class="line">
									    <div class="leftimg">
									      <img class="pb-fl" src="${APP_PATH }/static/img/${elast.coverImage}" width="150px" style="display: inline-block;" alt="#" /> 
								        </div>
							<div class="righttxt" >
								  <dl style=""> 
                                        <dt>
                                            <a href="articles?blogId=${elast.blogId}">${elast.blogTitle}</a>
                                        </dt> 
                                        <dd class="author">
                                                                                                                   作者：${elast.userNickname}
                                        </dd> 
                                        <dd class="cnt">
											${fn:substring(elast.blogDesc,0,60)}...                                        
										</dd> 
										<dd class="ap"> 
                                            <span class="auplayer" id="auplayer_240" ></span> 
                                        </dd> 
                                    </dl> 
						   </div>
								</div>
                            	
                                 </li>
                            </c:forEach>
                            
                            </ul> 
                        </div> 
                        <div class="d2 pb-fr"> 
                        <c:forEach items="${earHot}" var="ehot" varStatus="ehotvs">
                        <dl> 
                                <dt> 
                                    <a href="articles?blogId=${ehot.blogId}"> <img src="${APP_PATH }/static/img/${ehot.coverImage}" alt="#" /> </a> 
                                </dt> 
                                
                                <dd class="tle">
                                    <a href="articles?blogId=${ehot.blogId}">推荐：${ehot.blogTitle}</a>
                                </dd> 
                            </dl> 
                        </c:forEach>
                        </div> 
                    </div> 
                     
                </div> 
                <script type="text/javascript" src="${APP_PATH }/static/js/jquery.slideBox.js"></script> 
                <script type="text/javascript" src="${APP_PATH }/static/js/ap.js"></script> 
                <script>
                     $(document).ready(function() {
                         $(".idx-qtsj li").hover(function() {
                             $(this).find('table').stop().animate({'bottom': '-40px'}, 500);
                         }, function() {
                             $(this).find('table').stop().animate({'bottom': '0px'}, 500);
                         });
                     });
                </script> 
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
        <script language="javascript" type="text/javascript" src="${APP_PATH }/static/js/15502332.js"></script> 
        <noscript>
            <a href="http://www.51.la/?15502332" target="_blank"><img alt="我要啦免费统计" src="${APP_PATH }/static/img/15502332.asp" style="border:none" /></a>
        </noscript> 
        <script type="text/javascript" language="javascript">
               $(document).ready(function() {
                   $(".pb-ucenter").bind('mouseenter', function() {
                       $(this).find('ul').stop().slideDown('fast');
                       Sys.clearFlicker('uMessageCenter');
                   }).bind('mouseleave', function() {
                       $(this).find('ul').stop().slideUp('fast');
                   });

                   $("#goTopButton").click(function() {
                       Sys.scrollTo($('body'));
                       Sys.commStat(33);
                   });
                   if (vars.browser != 'IE6') {
                       var w_w = parseInt($("body").width());
                       var obj = $("#goTopButton");
                       $(window).scroll(function() {
                           if ($(this).scrollTop() > 500) {
                               if (!isNaN(w_w) && w_w > 0) {
                                   obj.css('left', (Math.ceil((w_w - 1050) / 2) + 1050 + 10) + "px");
                               }
                               obj.fadeIn();
                           } else {
                               obj.fadeOut();
                           }
                       });
                   }
                   Sys.hide51();
               });
        </script>  
</html>