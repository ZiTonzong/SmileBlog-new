<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="backHeader.jsp"%>
<%@ include file="backLeftSider.jsp"%>
				<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="text-align: center;">
					<button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
						<h4 class="sub-header">个人详细信息</h4>
					</button>
					<div class="collapse" id="collapseExample">
					  <div class="well">
					  <c:if test="${msg!=null }">
					  <h1>${msg}</h1>
					  </c:if>
					  
					  <c:if test="${userinfo != null}">
						<img src="${APP_PATH }/static/img/${userinfo.userHeadImg}" alt="userImg" class="img-circle">
						<hr />
						<p>userId：${userinfo.userId}</p>
						<p>昵称：${userinfo.userNickname}</p>
						<p>年龄：${userinfo.userAge}</p>
						<p>个人邮箱：${userinfo.userEmail}</p>
						<p>个性签名：${userinfo.userAbout}</p>
						<p>个人积分：${userinfo.userPoints}</p>
						
						<c:if test="${user.roleId==1}">
							<p>用户类型：<font color="red">管理员</font></p>
						</c:if>
						<c:if test="${user.roleId==2}">
							<p>用户类型：<font color="blue">普通用户</font></p>
						</c:if>
						</c:if>
					  </div>
					</div>
				</div>
<%@ include file="backFooter.jsp"%>