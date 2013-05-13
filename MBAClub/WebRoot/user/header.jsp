<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.mbaclub.news.pojo.SecurityUser"%>
<jsp:useBean id="userDao" class="com.mbaclub.news.dao.SecurityUserDAO"></jsp:useBean>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	SecurityUser user = (SecurityUser)session.getAttribute("User");
%>
<div class="header wrapper clearfix">
	<p style="position:absolute;left:10px;bottom:10px">
	欢迎您，<%=user.getTruename() %> | 您是<%
		if(userDao.isAdmin(user)){
			out.print("管理员");
		} else {
			out.print("普通用户");
		}
	 %>
	</p>
	<div class="site-nav">
		<ul class="clearfix">
			<li class="site-nav-item">
				<a href="<%=basePath %>index.jsp">首页</a>
			</li>
			<li class="site-nav-item">
				|
			</li>
			<%
				if(userDao.isAdmin(user)){
			%>
			<li class="site-nav-item">
				<a href="<%=basePath %>admin/audituser.jsp">用户审核</a>
			</li>
			<li class="site-nav-item">
				|
			</li>
			<li class="site-nav-item">
				<a href="<%=basePath %>admin/user-manager.jsp">用户管理</a>
			</li>
			<li class="site-nav-item">
				|
			</li>
			<li class="site-nav-item">
				<a href="<%=basePath %>admin/auditcontent.jsp">内容审核</a>
			</li>
			<li class="site-nav-item">
				|
			</li>
			<li class="site-nav-item">
				<a href="<%=basePath %>admin/publish-manager.jsp">内容管理</a>
			</li>
			<li class="site-nav-item">
				|
			</li>
			<%
				}
			%>
			<li class="site-nav-item">
				<a href="<%=basePath %>user/index.jsp">内容发布</a>
			</li>
			<li class="site-nav-item">
				|
			</li>
			<li class="site-nav-item">
				<a href="<%=basePath %>logout">登出</a>
			</li>
		</ul>
	</div>
</div>