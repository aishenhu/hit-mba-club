<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<div class="header wrapper clearfix">
	<!-- div class="logo">
	</div>
	<div class="logo-word">
	</div> -->
	<div class="site-nav">
		<ul class="clearfix">
			<li class="site-nav-item">
				<a href="<%=basePath %>index.jsp">首页</a>
			</li>
			<li class="site-nav-item">
				|
			</li>
			<li class="site-nav-item">
				<a href="<%=basePath %>introduction.jsp">俱乐部介绍</a>
			</li>
			<li class="site-nav-item">
				|
			</li>
			<li class="site-nav-item">
				<a href="<%=basePath %>milestone.jsp">俱乐部大事记</a>
			</li>
			<li class="site-nav-item">
				|
			</li>
			<li class="site-nav-item">
				<a href="<%=basePath %>register.jsp">成为会员</a>
			</li>
			<li class="site-nav-item">
				|
			</li>
			<li class="site-nav-item">
				<a href="<%=basePath %>login.jsp">会员登陆</a>
			</li>
			<li class="site-nav-item">
				|
			</li>
			<li class="site-nav-item">
				<a href="<%=basePath %>contact.jsp">联络我们</a>
			</li>
			<li class="site-nav-item">
				|
			</li>
			<li class="site-nav-item">
				<a>基金会</a>
			</li>
			<%
				if(request.getSession().getAttribute("User") != null){
			 %>
			<li class="site-nav-item">
				|
			</li>
			<li class="site-nav-item">
				<a href="<%=basePath %>user/resource.jsp">资源共享</a>
			</li>
			<%} %>
		</ul>
	</div>
</div>