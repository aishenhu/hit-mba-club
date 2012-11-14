<%@ page language="java"
	import="java.util.*,com.mbaclub.news.pojo.*,com.mbaclub.news.util.*"
	pageEncoding="UTF-8"%>
<jsp:useBean id="newsDao" class="com.mbaclub.news.dao.NewsDAO"></jsp:useBean>
<jsp:useBean id="usersDao" class="com.mbaclub.news.dao.SecurityUserDAO"></jsp:useBean>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	long id = 0;
	try {
		id = Long.parseLong(request.getParameter("id"));
	} catch (Exception e) {
		id = 0;
	}
	News news = newsDao.findById(id);
	SecurityUser user = (SecurityUser)session.getAttribute("User");
	// 如果通过审核
	if (news.getStatus() != null && news.getStatus() == 1) {
		newsDao.addHit(id);
	}else if(usersDao.isAdmin(user) || news.getSecurityUser().getId() == user.getId()){
		// 如果是管理员或者是发布者，则不受限制
	}else{
		// 不合法的请求
		response.sendRedirect("index.jsp");
	}
	List<News> recentNewsList = newsDao.getNewsByCategoryID(news
			.getNewsCategory().getId(), 0, 10);
	UrlInfo url = UrlUtil.getNewsUrl(news.getNewsCategory().getId()
			.intValue());
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta HTTP-EQUIV="pragma" CONTENT="no-cache"> 
		<meta HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate"> 
		<meta HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57GMT">
		<title><%=url.getName()%></title>
		<link type="text/css" rel="stylesheet"
			href="<%=basePath%>css/base.css">
		<link type="text/css" rel="stylesheet"
			href="<%=basePath%>css/common.css">
		<link type="text/css" rel="stylesheet"
			href="<%=basePath%>css/page.css">
		<link type="text/css" rel="stylesheet"
			href="<%=basePath%>css/activities.css">
	</head>
	<body>
		<jsp:include page="../user/header.jsp"></jsp:include>
		<div class="page-nav wrapper">
			<ul class="clearfix">
				<li class="fl">
					<span class="c-999">当前位置：</span>
				</li>
				<li class="fl">
					<a href="<%=basePath%>index.jsp">首页</a>
				</li>
				<li class="fl">
					>
				</li>
				<li class="fl">
					<a href="<%=basePath + url.getUrl()%>"><%=url.getName()%></a>
				</li>
				<li class="fl">
					>
				</li>
				<li class="fl">
					<a><%=news.getName()%></a>
				</li>
			</ul>
		</div>
		<div class="wrapper content clearfix">
			<div class="side fl">
				<h2 class="side-title">
					最近的活动
				</h2>
				<ul class="list">
					<%
						for (int i = 0; recentNewsList != null && i < recentNewsList.size(); i++) {
							News rnews = recentNewsList.get(i);
					%>
					<li>
						<a href="<%=basePath%>news.jsp?id=<%=rnews.getId()%>"><%=rnews.getName()%></a>
					</li>
					<%
						}
					%>
				</ul>
			</div>
			<div class="main fl">
				<div class="main-wrapper">
					<div class="main-info">
						<h2 class="main-title"><%=news.getName()%></h2>
						<div class="sub-info">
							<span>时间：<%=DateUtil.getDatetime(news.getUpdateDate())%></span>
							<span>阅读：<%=news.getHit()%></span>
							<span>标签：<%=news.getSource()%> </span>
						</div>
						<div class="">
							<%=news.getContent()%>
						</div>

						<div class="post fr">
							<p>
								发表人：<%=news.getSecurityUser().getTruename()%></p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../footer.jsp"></jsp:include>
	</body>
</html>
