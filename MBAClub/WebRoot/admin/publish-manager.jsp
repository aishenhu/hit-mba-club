<%@page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.mbaclub.news.pojo.UrlInfo"%>
<%@page import="com.mbaclub.news.util.UrlUtil"%>
<%@page import="com.mbaclub.news.pojo.News"%>
<%@page import="com.mbaclub.news.util.DateUtil"%>
<%@page import="com.mbaclub.news.pojo.Company"%>
<%@page import="com.mbaclub.news.pojo.Member"%>
<jsp:useBean id="newsDao" class="com.mbaclub.news.dao.NewsDAO"></jsp:useBean>
<jsp:useBean id="companyDao" class="com.mbaclub.news.dao.CompanyDAO"></jsp:useBean>
<jsp:useBean id="memberDao" class="com.mbaclub.news.dao.MemberDAO"></jsp:useBean>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	int type = 0;
	try {
		type = Integer.parseInt(request.getParameter("type"));
	} catch (Exception e) {
		type = 0;
	}
	UrlInfo urlInfo = UrlUtil.getPublishManagerUrl(type);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta HTTP-EQUIV="pragma" CONTENT="no-cache"> 
		<meta HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate"> 
		<meta HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57GMT">
		<title>内容管理页面</title>
		<link type="text/css" rel="stylesheet"
			href="<%=basePath%>css/base.css">
		<link type="text/css" rel="stylesheet"
			href="<%=basePath%>css/common.css">
		<link type="text/css" rel="stylesheet"
			href="<%=basePath%>css/page.css">
		<link type="text/css" rel="stylesheet"
			href="<%=basePath%>css/manage.css">
	</head>
	<body>
		<jsp:include page="../user/header.jsp"></jsp:include>
		<div class="page-nav wrapper">
			<ul class="clearfix">
				<li class="fl">
					<span class="c-999">当前位置：</span>
				</li>
				<li class="fl">
					<a href="<%=basePath%>user/index.jsp">管理首页</a>
				</li>
				<li class="fl">
					>
				</li>
				<li class="fl">
					<a>内容管理</a>
				</li>
				<li class="fl">
					>
				</li>
				<li class="fl">
					<a><%=urlInfo.getName()%>管理</a>
				</li>
			</ul>
		</div>
		<div class="content wrapper clearfix">
			<div class="side fl">
				<h2 class="side-title">
					管理操作项
				</h2>
				<ul class="list">
					<li>
						<a href="?type=0">活动发布</a>
					</li>
					<li>
						<a href="?type=1">活动回顾（大图）</a>
					</li>
					<li>
						<a href="?type=7">活动回顾（小图）</a>
					</li>
					<li>
						<a href="?type=2">会员单位</a>
					</li>
					<li>
						<a href="?type=3">合作企业</a>
					</li>
					<li>
						<a href="?type=4">信息交流</a>
					</li>
					<li>
						<a href="?type=5">精彩会员</a>
					</li>
					<li>
						<a href="?type=6">校园在线</a>
					</li>
				</ul>
			</div>
			<div class="main fr">
				<div class="news-list clearfix">
					<form action="" method="" accept-charset="utf-8">
						<table width="600">
							<caption>
								<%=urlInfo.getName()%>
							</caption>
							<%
								if (type == 0 || type == 1 || type == 4 || type == 6 || type == 7) {
									List<News> newsList = newsDao.getNewsByCategoryID(urlInfo
											.getCategoryId());
									if (!newsList.isEmpty()) {
							%>
							<tr>
								<th>
									编号
								</th>
								<th>
									标题
								</th>
								<th>
									发布时间
								</th>
								<th class="w-90">
									详细信息
								</th>
								<th class="w-60">
									状态
								</th>
								<th>
									操作
								</th>
							</tr>
							<%
								for (int i = 0; i < newsList.size(); i++) {
									News n = newsList.get(i);
							%>
							<tr>
								<td class="news-id">
									<%=i + 1%>
								</td>
								<td class="news-title">
									<%=n.getName()%>
								</td>
								<td class="news-index">
									<%=DateUtil.getDatetime(n.getUpdateDate())%>
								</td>
								<td>
									<a href="<%=basePath%>admin/news.jsp?id=<%=n.getId()%>"
										target="_blank">详细信息</a>
								</td>
								<td>
									<%
										if (n.getStatus() != null && n.getStatus() == 1) {
														out.println("正常");
													} else if (n.getStatus() != null && n.getStatus() == 0) {
														out.println("未审核");
													}else{
														out.println("冻结");
													}
									%>
								</td>
								<td  class="w-90">
									<a class="button fl mr-6" href="<%=basePath%>user/publish_news.jsp?type=<%=type%>&action=modify&id=<%=n.getId()%>">修改</a>
									<a class="button fl deleteop"
										href="<%=basePath%>admin/news_manager?action=delete&type=<%=type%>&id=<%=n.getId()%>">删除</a>
								</td>

							</tr>
							<%
								}
									}
								} else if (type == 2 || type == 3) {
									List<Company> companyList = companyDao.getCompanys(urlInfo
											.getCategoryId());
									if (!companyList.isEmpty()) {
							%>
							<tr>
								<th>
									编号
								</th>
								<th>
									名称
								</th>
								<th>
									排序号
								</th>
								<th>
									网址
								</th>
								<th>
									操作
								</th>
							</tr>
							<%
								for (int i = 0; i < companyList.size(); i++) {
											Company c = companyList.get(i);
							%>
							<tr>
								<td class="news-id">
									<%=i + 1%>
								</td>
								<td class="news-title">
									<%=c.getName()%>
								</td>
								<td class="news-index">
									<%=c.getOrderValue()%>
								</td>
								<td>
									<%=UrlUtil.getLegalUrl(c.getUrl())%>
								</td>
								<td class="w-160">
									<a class="button fl mr-6 topop"
										href="<%=basePath%>admin/company_manager?action=top&id=<%=c.getId()%>&type=<%=type%>">置顶</a>
									<!--  <a class="button fl mr-6">修改</a>-->
									<a class="button fl deleteop"
										href="<%=basePath%>admin/company_manager?action=delete&type=<%=type%>&id=<%=c.getId()%>">删除</a>
								</td>

							</tr>
							<%
								}
									}
								} else if (type == 5) {
									List<Member> memberList = memberDao.findAll();
							%>
							<tr>
								<th>
									编号
								</th>
								<th>
									名字
								</th>
								<th>
									公司
								</th>
								<th>
									详细信息
								</th>
								<th>
									操作
								</th>
							</tr>
							<%
								for (int i = 0; i < memberList.size(); i++) {
										Member m = memberList.get(i);
							%>
							<tr>
								<td class="news-id">
									<%=i + 1%>
								</td>
								<td class="news-title">
									<%=m.getName()%>
								</td>
								<td class="news-index">
									<%=m.getCompany()%>
								</td>
								<td>
									<a href="<%=basePath%>member.jsp?id=<%=m.getId()%>">详细信息</a>
								</td>
								<td>
									<a class="button fl mr-6 topop"
										href="<%=basePath%>admin/member_manager?action=top&id=<%=m.getId()%>&type=<%=type%>">置顶</a>
									<a class="button fl mr-6">修改</a>
									<a class="button fl deleteop"
										href="<%=basePath%>admin/member_manager?action=delete&type=<%=type%>&id=<%=m.getId()%>">删除</a>
								</td>

							</tr>
							<%
								}
								}
							%>
						</table>
						<!-- <div class="op">
							<span class="g-button-submit g-button mr-6"><a
								href="<%=basePath%>user/publish_news.jsp">创建新的</a>
							</span>
							<input class="g-button-submit g-button" type="submit"
								value="保存修改" />
						</div> -->
					</form>
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
	<script type="text/javascript"
		src="<%=basePath%>js/jquery-1.6.4.min.js">
</script>
	<script type="text/javascript" src="<%=basePath%>js/publish-manager.js">
</script>
</html>
