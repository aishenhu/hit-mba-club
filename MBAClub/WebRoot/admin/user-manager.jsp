<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.mbaclub.news.pojo.SecurityUser"%>
<%@page import="com.mbaclub.news.util.PageBean"%>
<jsp:useBean id="userDao" class="com.mbaclub.news.dao.SecurityUserDAO"></jsp:useBean>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

	PageBean pageBean = new PageBean();
	final int PAGE_SIZE = 10;
	String p = request.getParameter("pageNo");
	int pageNo = 1;
	if (p == null || "".equals(p)) {
		pageBean.setPageNo(1);
	} else {
		try {
			pageNo = Integer.parseInt(p);
		} catch (Exception e) {
			pageNo = 1;
		}
		pageBean.setPageNo(pageNo);
	}
	pageBean.setPageSize(PAGE_SIZE);
	pageBean.setPageAction("user-manager.jsp");
	pageBean.setTotalRecords(userDao.getCount());

	List<SecurityUser> userList = userDao.findAll();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>用户管理页面</title>
		<link type="text/css" rel="stylesheet"
			href="<%=basePath%>css/base.css">
		<link type="text/css" rel="stylesheet"
			href="<%=basePath%>css/common.css">
		<link type="text/css" rel="stylesheet"
			href="<%=basePath%>css/page.css">
		<link type="text/css" rel="stylesheet"
			href="<%=basePath%>css/manage.css">
		<style>
table {
	width: 860px;
}

.main {
	width: 960px;
}

.operation {
	margin-top: 10px;
}

tr:hover {
	cursor: default;
}
</style>
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
					<a>用户管理</a>
				</li>
			</ul>
		</div>
		<div class="content wrapper clearfix">
			<div class="main fr">
				<div class="news-list">
					<table>
						<caption>
							用户管理
						</caption>
						<tr>
							<th>
								编号
							</th>
							<th>
								用户ID
							</th>
							<th>
								用户姓名
							</th>
							<th>
								用户权限
							</th>
							<th>
								当前状态
							</th>
							<th>
								操作
							</th>
						</tr>
						<%
							for (int i = 0; i < userList.size(); i++) {
								SecurityUser user = userList.get(i);
						%>
						<form action="user" method="post" accept-charset="utf-8">
							<tr>
								<td class="user-id">
									<%=i + 1%><input type="hidden" value="<%=user.getId()%>"
										name="uid" />
								</td>
								<td class="user-name">
									<%=user.getUsername()%>
								</td>
								<td class="user-name">
									<%=user.getTruename() == null ? "" : user.getTruename()%>
								</td>
								<td class="user-permission">
									<select name="role">
										<option value="2"
											<%boolean isAdmin = userDao.isAdmin(user);
				if (isAdmin)
					out.print("selected=\"true\"");%>>
											管理员
										</option>
										<option value="3"
											<%if (!isAdmin)
					out.print("selected=\"true\"");%>>
											普通用户
										</option>
									</select>
								</td>
								<td class="user-recommend">
									<input type="radio" name="enabled-<%=user.getId()%>" value="1"
										<%if (user.getStatus() != null && user.getStatus() == 1)
					out.print("checked");%>>
									正常
									</input>
									<input type="radio" name="enabled-<%=user.getId()%>" value="0"
										<%if (user.getStatus() == null || user.getStatus() != 1)
					out.print("checked");%>>
									冻结
									</input>
								</td>
								<td>
									<input value="保存" type="submit" class="button fl" />
								</td>
							</tr>
						</form>
						<%
							}
						%>
					</table>
					<div class="operation">
						<%
							if (!pageBean.isTopPage()) {
								out.println(pageBean.getTopPageBar());
							}
							out.println(pageBean.getPageToolBar1());
							if (!pageBean.isBottoomPage()) {
								out.println(pageBean.getBottomPageBar());
							}
						%>
					</div>
					<!--div class="op">
                                <span class="g-button-submit g-button mr-6">创建新的</span>
                                <input class="g-button-submit g-button" type="submit" value="保存修改"/>
                                </div-->
				</div>
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
</html>
