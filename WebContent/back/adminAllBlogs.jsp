<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="backHeader.jsp"%>
<%@ include file="backLeftSider.jsp"%>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h1>${msg}</h1>
				<h2 class="sub-header">所有文章管理-Smile后台管理</h2>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>blogId</th>
							<th>标题</th>
							<th>封面图</th>
							<th>内容</th>
							<th>发布时间</th>
							<th>作者昵称</th>
							<th>所属类别</th>
							<th>阅读次数</th>
							<th>推广</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="blogDetail" items="${blogDetails}">
						<tr>
							<td>${blogDetail.blogId}</td>
							<td><a href="${APP_PATH }/articles?blogId=${blogDetail.blogId}">${blogDetail.blogTitle}</a></td>
							<td><img src="${APP_PATH }/static/img/${blogDetail.coverImage}" 
					style="cursor: pointer;height: 40px;width: 40px" alt="封面图">
							</td>
							<td>${fn:substring(blogDetail.article,0,20)}...</td>
							<td>${blogDetail.time}</td>
							<td>${blogDetail.userNickname}</td>
							<td>
							<c:if test="${blogDetail.categoryId eq 0}">
							科技博客
							</c:if>
							<c:if test="${blogDetail.categoryId eq 1}">
							倾听世界
							</c:if>
							<c:if test="${blogDetail.categoryId eq 2}">
							每日一笑
							</c:if>
							<c:if test="${blogDetail.categoryId eq 3}">
							叫醒耳朵
							</c:if>
							</td>
							<td>${blogDetail.readNum}</td>
							<td>
							<button class="changeProductStatus" type="button" 
					value="${blogDetail.recommend}">${blogDetail.recommend==0?'<font color="red">未推荐</font>':'<font color="blue">已推荐</font>'}
							</button>
							</td>
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