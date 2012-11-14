<%@ page language="java" import="java.util.*" pageEncoding="UTf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>申请成为会员</title>
		<link type="text/css" rel="stylesheet" href="css/base.css">
		<link type="text/css" rel="stylesheet" href="css/common.css">
		<link type="text/css" rel="stylesheet" href="css/page.css">
		<link type="text/css" rel="stylesheet" href="css/register.css">
		<style>
.result {
	font-size: 18px;
}
</style>
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
					<a>会员注册</a>
				</li>
			</ul>
		</div>
		<div class="content wrapper clearfix">
			<div class="main fl">
				<div class="register-box">
					<h2 class="content-title">
						注册完成
					</h2>
					<p class="result">
						<span class="time">3</span>秒后跳转到登陆页...
					</p>
				</div>
			</div>
			<div class="side fr">
				<div class="side-box">
					<!--h2 class="side-title">注册信息</h2-->
					<div>
						<span>已有账号?</span>
						<br />
						<a href="<%=basePath%>login.jsp" class="g-button login">登陆</a>
						<div class="info">
							<p>
								当前状态：审核中
							</p>
						</div>
						<div class="info">
							<span>遇到问题?</span>
							<br />
							<a href="mailto:admin@mba.com" class="g-button mail">发邮件</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</body>
	<script type="text/javascript"
		src="<%=basePath%>js/jquery-1.6.4.min.js">
	
</script>
	<script type="text/javascript">
	$(document).ready(function() {
		var time = 3;
		setInterval(function() {
			time -= 1;
			$(".time").text(time);
			if (time == 0) {
				window.location.href = "login.jsp";
			}
		}, 1000);
	});
</script>
</html>
