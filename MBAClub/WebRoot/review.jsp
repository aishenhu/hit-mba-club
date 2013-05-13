<%@ page language="java"
	import="java.util.*,com.mbaclub.news.pojo.*,com.mbaclub.news.util.*"
	pageEncoding="UTF-8"%>
<%@page import="com.mbaclub.news.dao.NewsDAO"%>
<jsp:useBean id="newsDao" class="com.mbaclub.news.dao.NewsDAO"></jsp:useBean>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	PageBean pageBean = new PageBean();
	final int PAGE_SIZE = 5;
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
	List<News> recentNewsList = newsDao.getNewsByCategoryID(NewsDAO.NEWS_CATEGORY_REVIEW, (pageNo - 1) * PAGE_SIZE, PAGE_SIZE);
	pageBean.setPageSize(PAGE_SIZE);
	pageBean.setPageAction("review.jsp");
	pageBean.setMethod("");
	pageBean.setTotalRecords(newsDao.getNewsCountByCategoryID(NewsDAO.NEWS_CATEGORY_REVIEW_MINI)
		+ newsDao.getNewsCountByCategoryID(NewsDAO.NEWS_CATEGORY_REVIEW_NORMAL));
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>活动回顾</title>
		<link rel="stylesheet" type="text/css"
			href="css/jquery.lightbox-0.5.css" media="screen" />
		<link type="text/css" rel="stylesheet" href="css/base.css">
		<link type="text/css" rel="stylesheet" href="css/common.css">
		<link type="text/css" rel="stylesheet" href="css/page.css">
		<link type="text/css" rel="stylesheet" href="css/review.css">
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
					<a href="<%=basePath %>review.jsp">活动回顾</a>
				</li>
			</ul>
		</div>
		<div class="content wrapper clearfix">
			<div class="type-switch clearfix">
				<span class="fl c-999">显示方式：</span>
				<a class="type-thumb type-current" title="缩略图"></a>
				<a class="type-list" title="列表"></a>
			</div>
			<div class="thumb">
				<div class="review-wrapper clearfix">
					<%
					for(int i = 0; i < recentNewsList.size(); i++){
						News news = recentNewsList.get(i);
				%>
					<div class="activity  fl">
						<a href="<%=news.getImage() %>" class="image">
						<img height="80px" width="120px" src="<%=basePath%><%=news.getImage() == null ? "assets/news.png" : news.getImage() %>" /></a>
						<a class="activity-title" href="<%=basePath %>news.jsp?id=<%=news.getId() %>" target="_black"><%=news.getName() %></a>
						<p>
							创建者：<%=news.getSecurityUser().getTruename() %>
						</p>
						<p>
							创建时间：<%=DateUtil.getDate(news.getUpdateDate()) %>
						</p>
					</div>
					<%
					}
				%>

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
			<!--div>being list show</div-->
			<div class="list clearfix hidden">
				<div class="side-box fl">
					<h2 class="side-title">
						最近结束的活动
					</h2>
					<ul>
						<%
							recentNewsList = newsDao.getNewsByCategoryID(NewsDAO.NEWS_CATEGORY_REVIEW_NORMAL, 0, 5);
							for (int i = 0; recentNewsList != null && i < recentNewsList.size(); i++) {
								News news = recentNewsList.get(i);
						%>
						<li class="clearfix">
							<a class="fl" id="<%=news.getId() %>" title="<%=news.getName() %>">
							<%=news.getName().length() > 10 ? news.getName().substring(0, 14) + "..." : news.getName() %></a>
							<em class="c-999 fl">[<%=DateUtil.getDate(news.getUpdateDate())%>]</em>
						</li>
						<%
							}
							recentNewsList = newsDao.getNewsByCategoryID(NewsDAO.NEWS_CATEGORY_REVIEW_NORMAL, 5, 6);
						%>
					</ul>
					<h2 class="side-title">
						更早的活动
					</h2>
					<ul>
						<%
							for (int i = 0; recentNewsList != null && i < recentNewsList.size(); i++) {
								News news = recentNewsList.get(i);
						%>
						<li class="clearfix">
							<a class="fl" id="<%=news.getId() %>" title="<%=news.getName() %>">
							<%=news.getName().length() > 10 ? news.getName().substring(0, 14) + "..." : news.getName() %></a>
							<em class="c-999 fl">[<%=DateUtil.getDate(news.getUpdateDate())%>]</em>
						</li>
						<%
							}
						%>
					</ul>
					<div class="more button">
						<span class="more-loading" next="2">获取更多</span>
					</div>
				</div>
				<div class="main hidden fl">
					<div class="loading-status">
						<h2>
							正在加载
						</h2>
						<img src="assets/loading.gif" />
					</div>
					<div class="main-content"></div>
				</div>
			</div>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</body>
	<script type="text/javascript" src="js/jquery-1.6.4.min.js">
	
</script>
	<script type="text/javascript" src="js/jquery.lightbox-0.5.min.js">
	
</script>
	<script type="text/javascript" src="js/review.js">
	
</script>
</html>
