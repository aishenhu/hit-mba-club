<%@ page language="java"
	import="java.util.*,com.mbaclub.news.pojo.*,com.mbaclub.news.util.*"
	pageEncoding="UTF-8"%>
<jsp:useBean id="newsDao" class="com.mbaclub.news.dao.NewsDAO"></jsp:useBean>
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
	pageBean.setPageAction("school.jsp");
	pageBean.setTotalRecords(newsDao
			.getNewsCountByCategoryID(newsDao.NEWS_CATEGORY_SCHOOL));

	List<News> newsList = newsDao.getNewsByCategoryID(
			newsDao.NEWS_CATEGORY_SCHOOL, (pageNo - 1) * PAGE_SIZE,
			PAGE_SIZE);
	List<News> recentNewsList = newsDao.getNewsByCategoryID(
			newsDao.NEWS_CATEGORY_SCHOOL, 0, 10);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>校园在线</title>
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
		<jsp:include page="header.jsp"></jsp:include>
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
					<a href="<%=basePath%>school.jsp">校园在线</a>
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
							News news = recentNewsList.get(i);
					%>
					<li>
						<a href="<%=basePath%>news.jsp?id=<%=news.getId()%>"><%=news.getName()%></a>
					</li>
					<%
						}
					%>
				</ul>
			</div>
			<div class="main fl">
				<div class="main-wrapper">
					<div class="main-info">
						<h2 class="main-title">
							校园在线
						</h2>
						<ul class="info-list">
							<%
								for (int i = 0; newsList != null && i < newsList.size(); i++) {
									News news = newsList.get(i);
							%>
							<li>
								<div>
									<a title="点击查看活动详情"
										href="<%=basePath%>news.jsp?id=<%=news.getId()%>"> <%=news.getName()%></a>
									<span> <%
											 	if (news.getImage() != null)
											 			out.println("[图文]");
											 %> </span>
									<span class="info-time c-999"><%=DateUtil.getDate(news.getUpdateDate())%></span>
								</div>
							</li>
							<%
								}
							%>
						</ul>
					</div>
				</div>
				<div class="operation">
					<ul class="op-page clearfix">
						<%
							if (!pageBean.isTopPage()) {
								out.println(pageBean.getTopPageBar());
							}
							out.println(pageBean.getPageToolBar1());
							if (!pageBean.isBottoomPage()) {
								out.println(pageBean.getBottomPageBar());
							}
						%>
					</ul>
				</div>
			</div>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</body>
</html>
