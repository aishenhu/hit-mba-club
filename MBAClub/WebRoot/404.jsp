<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>找不到您需要的页面</title>
		<style type="text/css">
<!--
body {
	font-size: 13px;
	FILTER: progid : DXImageTransform.Microsoft.Gradient ( gradientType = 0,
		startColorStr = #dbebfa, endColorStr = #f9fcfd );
	margin: 0px;
	background: #F4F9FC;
}

body {
	font: normal 14px/ 24px "MicroSoft YaHei", "SimHei", "Arial";
}

.main {
	margin: 0 auto;
	width: 800px;
	position: relative;
}

.link {
	text-decoration: underline;
}
-->
</style>
	</head>
	<body>
		<div class="main">
			<h1>
				Page not found
			</h1>
			<img src="<%=basePath %>assets/404.png">
			<a class="link" href="<%=basePath %>index.jsp">回到首页</a>
		</div>
	</body>
</html>
