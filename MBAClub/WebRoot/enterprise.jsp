<%@ page language="java"
	import="java.util.*,com.mbaclub.news.pojo.*,com.mbaclub.news.util.*"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="companyDao" class="com.mbaclub.news.dao.CompanyDAO"></jsp:useBean>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	PageBean pageBean = new PageBean();
	final int PAGE_SIZE = 5;
	String p = request.getParameter("pageNo");
	int pageNo = 1;
	int method = companyDao.CATEGORY_TYPE_MEMBER;
	try {
		pageNo = Integer.parseInt(p);
	} catch (Exception e) {
		pageNo = 1;
	}
	try{
		method = Integer.parseInt(request.getParameter("method"));
	}catch(Exception e){
		method = companyDao.CATEGORY_TYPE_MEMBER;
	}
	pageBean.setPageNo(pageNo);
	pageBean.setMethod(method + "");
	pageBean.setPageSize(PAGE_SIZE);
	pageBean.setPageAction("enterprise.jsp");
	pageBean.setTotalRecords(companyDao.getAllCount(method));
	request.setAttribute("companyList", companyDao.getCompanys(method));
	String title = "";
	if (method == companyDao.CATEGORY_TYPE_MEMBER) {
		title = "会员单位";
	} else if (method == companyDao.CATEGORY_TYPE_ENTERPRISE) {
		title = "合作企业";
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title><%=title %></title>
		<link type="text/css" rel="stylesheet"
			href="<%=basePath%>css/base.css">
		<link type="text/css" rel="stylesheet"
			href="<%=basePath%>css/common.css">
		<link type="text/css" rel="stylesheet"
			href="<%=basePath%>css/page.css">
		<link type="text/css" rel="stylesheet"
			href="<%=basePath%>css/enterprise.css">
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
					<a href="<%=basePath%>enterprise.jsp?method=<%=method %>"><%=title %></a>
				</li>
			</ul>
		</div>
		<div class="main wrapper">
			<div class="enterprise-list">
				<c:forEach var="company" items="${companyList}">
					<div class="enterprise">
						<h2 class="title">
							${company.name }
						</h2>
						<c:if test="${company.logo != null}">
							<img src="${company.logo }" title="${company.introduce }" />
						</c:if>
						<p class="des">
							${company.introduce }
						</p>
						<c:if test="${company.url != null}">
							<a class="link" href="${company.url }">主页</a>
						</c:if>
					</div>
				</c:forEach>
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
