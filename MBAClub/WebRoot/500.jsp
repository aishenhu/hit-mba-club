<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
	<head>
		<title>500 Internal Server Error</title>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<style type="text/css">
body {
	background: #EDE7D1;
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
</style>
	</head>
	<body>
		<div class="main">
			<h1>
				Internal Server Error
			</h1>
			<img src="<%=basePath%>assets/500.png">
			<a class="link" href="<%=basePath%>index.jsp">回到首页</a>
		</div>
	</body>
</html>