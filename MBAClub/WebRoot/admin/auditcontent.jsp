<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.mbaclub.news.pojo.News"%>
<%@page import="com.mbaclub.news.util.DateUtil"%>
<jsp:useBean id="newsDao" class="com.mbaclub.news.dao.NewsDAO"></jsp:useBean>
<jsp:useBean id="usersDao" class="com.mbaclub.news.dao.SecurityUserDAO"></jsp:useBean>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	List<News> newsList = newsDao.getAllNotAuditNews();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>内容审核</title>
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
		<script type="text/javascript">
	var type = 1;
</script>
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
					<a>内容审核</a>
				</li>
			</ul>
		</div>
		<div class="content wrapper clearfix">
			<div class="main fl">
				<!--div>
                <p>当前没有新的用户注册申请！</p>
                </div-->
				<h2>
					新的内容发布申请
					<span class="c-999 appNum" num="<%=newsList.size()%>">[<%=newsList.size()%>]</span>
				</h2>
				<%
					if (!newsList.isEmpty()) {
				%>
				<table class="application">
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
						<th>
							发布人
						</th>
						<th>
							<a>预览连接</a>
						</th>
						<th>
							操作
						</th>
					</tr>
					<%
						for (int i = 0; i < newsList.size(); i++) {
								News n = newsList.get(i);
					%>
					<tr id="<%=n.getId()%>">
						<td>
							<%=i + 1%>
						</td>
						<td>
							<%=n.getName()%>
						</td>
						<td>
							<%=DateUtil.getDatetime(n.getUpdateDate())%>
						</td>
						<td>
							<%=n.getSecurityUser().getTruename()%>
						</td>
						<td>
							<a href="<%=basePath%>news.jsp?id=<%=n.getId()%>"
								target="_blank">详细信息</a>
						</td>
						<td>
							<span class="button fl mr-6 pass">通过</span>
							<span class="button fl ignore">忽略</span>
						</td>
					</tr>
					<%
						}
					%>
				</table>
				<%
					}
				%>
			</div>
		</div>
		<jsp:include page="../footer.jsp"></jsp:include>
	</body>
	<script type="text/javascript"
		src="<%=basePath%>js/jquery-1.6.4.min.js">
    </script>
	<script type="text/javascript" src="<%=basePath%>js/audit.js">
    </script>
</html>

