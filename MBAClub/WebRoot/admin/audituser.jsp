<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.mbaclub.news.pojo.SecurityUser"%>
<jsp:useBean id="userDao" class="com.mbaclub.news.dao.SecurityUserDAO"></jsp:useBean>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	List<SecurityUser> userList = userDao.getNewUsers();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>用户审核</title>
		<link type="text/css" rel="stylesheet"
			href="<%=basePath%>css/base.css">
		<link type="text/css" rel="stylesheet"
			href="<%=basePath%>css/common.css">
		<link type="text/css" rel="stylesheet"
			href="<%=basePath%>css/page.css">
		<link type="text/css" rel="stylesheet"
			href="<%=basePath%>css/audit.css">
	</head>
	<body>
		<jsp:include page="../user/header.jsp"></jsp:include>
		<div class="page-nav wrapper">
			<ul class="clearfix">
				<li class="fl">
					<span class="c-999">当前位置：</span>
				</li>
				<li class="fl">
					<a href="<%=basePath %>user/index.jsp">首页</a>
				</li>
				<li class="fl">
					>
				</li>
				<li class="fl">
					<a>用户审核</a>
				</li>
			</ul>
		</div>
		<div class="content wrapper clearfix">
			<div class="main fl">
				<!--div>
                <p>当前没有新的用户注册申请！</p>
                </div-->
				<h2>
					新的用户注册申请
					<span class="c-999 appNum" num="2">[<%=userList.size()%>]</span>
				</h2>
				<%
					if (!userList.isEmpty()) {
				%>
				<table class="application">
					<tr>
						<th>
							ID
						</th>
						<th>
							用户名
						</th>
						<th>
							真实姓名
						</th>
						<th>
							邮箱
						</th>
						<th>
							毕业院校
						</th>
						<th>
							入学年限
						</th>
						<th>
							工作单位
						</th>
						<th>
							审核信息
						</th>
						<th>
							操作
						</th>
					</tr>
					<%
						for (int i = 0; i < userList.size(); i++) {
								SecurityUser user = userList.get(i);
					%>
					<tr id="1">
						<td>
							<%=i + 1%>
						</td>
						<td>
							<%=user.getUsername() %>
						</td>
						<td>
							<%=user.getTruename() %>
						</td>
						<td>
							<%=user.getEmail() %>
						</td>
						<td>
							<%=user.getCode() == null ? "无" : user.getCode() %>
						</td>
						<td>
							<%=user.getTel() == null ? "无" : user.getTel() %>
						</td>
						<td>
							<%=user.getDuty() %>
						</td>
						<td>
							<%=user.getDescn() %>
						</td>
						<td>
							<span class="button fl mr-6 pass"><a href="user?action=user_audit&operate=1&uid=<%=user.getId() %>">通过</a></span>
							<span class="button fl ignore"><a href="user?action=user_audit&operate=0&uid=<%=user.getId() %>">忽略</a></span>
						</td>
					</tr>
					<%
						}
					%>
				</table>
				<%
					}
				%>
				<!-- <div class="operation">
					<ul class="op-page clearfix">
						<li class="fl">
							<a class="button">上一页</a>
						</li>
						<li class="fl">
							<a class="button" href="activities.html?page=1">1</a>
						</li>
						<li class="fl">
							<a class="button">2</a>
						</li>
						<li class="fl">
							<a class="button">3</a>
						</li>
						<li class="fl">
							<a class="button">下一页</a>
						</li>
					</ul>
				</div> -->
			</div>
		</div>
		<div class="footer wrapper">
			<p class="c-999">
				黑ICP备1006889612 版权所有Copyright © 2012 All rights reserved.
			</p>
			<p class="c-999">
				黑龙省MBA
			</p>
		</div>
	</body>
	<script type="text/javascript"
		src="<%=basePath%>js/jquery-1.6.4.min.js">
    </script>
	<script type="text/javascript" src="<%=basePath%>js/audit.js">
    </script>
</html>

