<%@ page language="java"
	import="java.util.*,com.mbaclub.news.pojo.*,com.mbaclub.news.util.*"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	News n = (News) request.getAttribute("news");
%>

<div class="main-info">
	<h2 class="main-title">
		${news.name }
	</h2>
	<div class="sub-info">
		<span>时间：<%=DateUtil.getDatetime(n.getUpdateDate())%></span>
		<span>阅读：${news.hit }</span>
		<span>标签：${news.source } </span>
	</div>
	<div class="">
		${news.content }
	</div>
	<div class="post fr">
		<p>
			发表人：${news.securityUser.truename}
		</p>
	</div>
</div>
