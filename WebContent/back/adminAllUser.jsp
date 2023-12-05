<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	
<%@ include file="backHeader.jsp"%>
<%@ include file="backLeftSider.jsp"%>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h1>${msg}</h1>
				<h2 class="sub-header">所有用户管理（包括管理员）</h2>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>userId</th>
							<th>登录名</th>
							<th>注册邮箱</th>
							<th>用户状态</th>
							<th>用户类别</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
							<c:if test="${fn:length(users)>0}">
								<c:forEach var="user" items="${users}">
								<tr>  
			                        <td>${user.userId}</td>  
			                        <td><a href="${APP_PATH }/back/userinfo?userId=${user.userId}">${user.username}</a></td>
			                        <td>${user.email}</td>
			                        <td>
			                        	<c:if test="${user.state==0}">
			                        		<font color="red">用户账号未激活</font>
			                        	</c:if>
			                        	<c:if test="${user.state==1}">
			                        		<font color="green">用户账号已激活</font>
			                        	</c:if>
			                        </td>
			                        <td>
			                        	<c:if test="${user.roleId==1}">
			                        		管理员
			                        	</c:if>
			                        	<c:if test="${user.roleId==2}">
			                        		用户
			                        	</c:if>
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
												<li><a href="${APP_PATH}/back/getUser?id=${user.userId}">编辑</a></li>
												<li><a href="${APP_PATH}/back/deleteUser?id=${user.userId }">删除</a></li>
											</ul>
										</div>
			                        </td>
			                    </tr>
			           </c:forEach>
								</c:if>	               
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