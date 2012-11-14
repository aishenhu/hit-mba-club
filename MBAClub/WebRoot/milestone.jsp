<%@ page language="java" import="java.util.*,com.mbaclub.news.pojo.*"
	pageEncoding="UTF-8"%>
<%@page import="com.mbaclub.news.util.DateUtil"%>
<jsp:useBean id="mileDao" class="com.mbaclub.news.dao.MilestoneDAO"></jsp:useBean>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	List<Milestone> list = mileDao.getMilestones(0, 6);
	List<Milestone> allList = mileDao.findAll();
	
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<link type="text/css" rel="stylesheet"
			href="<%=basePath %>css/base.css">
		<link type="text/css" rel="stylesheet"
			href="<%=basePath %>css/common.css">
		<link type="text/css" rel="stylesheet"
			href="<%=basePath %>css/page.css">
		<link type="text/css" rel="stylesheet"
			href="<%=basePath %>css/milestone.css">
		<title>俱乐部大事记</title>
	</head>
	<body>
		<jsp:include page="header.jsp"></jsp:include>
		<div class="page-nav wrapper">
			<ul class="clearfix">
				<li class="fl">
					<span class="c-999">当前位置：</span>
				</li>
				<li class="fl">
					<a href="<%=basePath %>index.jsp">首页</a>
				</li>
				<li class="fl">
					>
				</li>
				<li class="fl">
					<a>俱乐部大事记</a>
				</li>
			</ul>
		</div>
		<div class="content wrapper">
			<div class="milestone-list">
				<%
        	for (int i = 0; i < list.size(); i++) {
				Milestone m = list.get(i);
				Calendar calen = Calendar.getInstance();
				calen.setTime(m.getEventDate());
        %>
				<div class="milestone" id="milestone<%=i + 1 %>">
					<div class="time" title="<%=DateUtil.getDate(m.getEventDate()) %>">
						<span class="year"><%=calen.get(Calendar.YEAR)%>/</span>
						<span class="month"><%=calen.get(Calendar.MONTH) + 1%>/</span>
						<br />
						<span class="day"><%=calen.get(Calendar.DAY_OF_MONTH)%></span>
					</div>
					<div class="milestone-content">
						<h2 class="milestone-title">
							<%=m.getTitle()%>
						</h2>
						<div class="description clearfix">
							<%if(m.getImage() != null){ %>
							<img src="assets/<%=m.getImage() %>" />
							<%} %>
							<p>
								<%=m.getContent()%>
							</p>
						</div>
						<div class="addition">
						<%if(m.getMoreUrl() != null){ %>
							<a href="<%=m.getMoreUrl()%>">更多阅读</a>
						<%} %>	
						</div>
					</div>
				</div>
				<%
           		}
           %>
				<a class="milestone-more" next="1">载入更多</a>
			</div>
			<div class="outline">
				<a class="outline-op " title="List"></a>
				<div class="outline-list hidden">
					<h2>
						俱乐部大事记列表
					</h2>
					<ul>
				<%
        			for (int i = 0; i < allList.size(); i++) {
						Milestone m = allList.get(i);
				%>
						<li>
							<a href="#milestone<%=i + 1 %>"><%=m.getTitle() %></a>
						</li>
				<%
					}
				 %>
					</ul>
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
	<script type="text/javascript" src="js/jquery-1.6.4.min.js">
	
</script>
	<!–[if IE]>
	<script type="text/javascript" src="js/jquery.corner.js">
	
</script>
	<script type="text/javascript">
	$(".outline-list").corner("10px");
</script>
	<![endif]–>
	<script type="text/javascript" src="js/milestone.js">
	
</script>
</html>
