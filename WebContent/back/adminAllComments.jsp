<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="backHeader.jsp"%>
<%@ include file="backLeftSider.jsp"%>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h1>${msg}</h1>
				<h2 class="sub-header">所有评论管理-Smile后台管理</h2>
				<table class="table table-hover">
					<thead>
						<tr>
						<!-- 在本项目中，“评价”是“评论”和“&nbsp;回复&nbsp;”的统称，“评论指的是对文章的评论，“&nbsp;回复&nbsp;”指的是对“评论”的&nbsp;回复&nbsp; -->
							<th>评论/回复&nbsp; ID</th>
							<th>回复者(ID) &nbsp;回复&nbsp; 被回复者(ID)/文章ID</th>
							<th>评价内容</th>
							<th>评价时间</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${comments}" var="comment" >
						<tr style="background-color: #E9EAEE;">
							<td>${comment.remarkId}</td>
							<td>
							<a href="${APP_PATH }/back/userinfo?userId=${comment.fromUserId}">${comment.remNickname}</a> &nbsp;回复&nbsp;   <a href="${APP_PATH }/articles?blogId=${comment.blogId}">（文章ID） ${comment.blogId}</a>
							</td>
							<td>${comment.content}</td>
							<td>${comment.time}</td>
							<td>
								<div class="btn-group">
									<button type="button"
										class="btn btn-sm btn-default dropdown-toggle"
										data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false">
										操作 <span class="caret"></span>
									</button>
									<ul class="dropdown-menu">
										<li><a href="${APP_PATH}/admin/getBlog?id=${blogsInfo.blogid}">编辑</a></li>
										<li><a href="${APP_PATH}/admin/deleteBlogById?blogid=${blogsInfo.blogid }">删除</a></li>
									</ul>
								</div>
							</td>
						</tr>
						<c:forEach items="${comment.replyDetails}" var="replyDetail" >
							<tr>
							<td>${replyDetail.replyId}</td>
							<td>
							<a href="${APP_PATH }/back/userinfo?userId=${replyDetail.fromUserId}">${replyDetail.replyUserNickname} (${replyDetail.fromUserId})</a> &nbsp;回复&nbsp;   
							<a href="${APP_PATH }/back/userinfo?userId=${replyDetail.toUserId}">${replyDetail.toUserNickname} (${replyDetail.toUserId})</a>
							</td>
							<td>${replyDetail.content}</td>
							<td>${replyDetail.time}</td>
							<td>
								<div class="btn-group">
									<button type="button"
										class="btn btn-sm btn-default dropdown-toggle"
										data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false">
										操作 <span class="caret"></span>
									</button>
									<ul class="dropdown-menu">
										<li><a href="${APP_PATH}/admin/getBlog?id=${blogsInfo.blogid}">编辑</a></li>
										<li><a href="${APP_PATH}/admin/deleteBlogById?blogid=${blogsInfo.blogid }">删除</a></li>
									</ul>
								</div>
							</td>
							</tr>
						</c:forEach>
						</c:forEach>
					</tbody>
				</table>
				<!-- 分页信息 -->
				<div class="col-md-6">
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
			</div>
<%@ include file="backFooter.jsp"%>