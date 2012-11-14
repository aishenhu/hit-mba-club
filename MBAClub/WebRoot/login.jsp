<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	if(request.getSession().getAttribute("User") != null) {
		response.sendRedirect(basePath + "user/index.jsp");
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>会员登陆</title>
		<link type="text/css" rel="stylesheet" href="css/base.css">
		<link type="text/css" rel="stylesheet" href="css/common.css">
		<link type="text/css" rel="stylesheet" href="css/page.css">
		<link type="text/css" rel="stylesheet" href="css/register.css">
	</head>
	<body>
		<style>
.main {
	min-height: 300px;
	_height: 300px;
}
</style>
		<jsp:include page="header.jsp"></jsp:include>
		<div class="page-nav wrapper">
			<ul class="clearfix">
				<li class="fl">
					<span class="c-999">当前位置：</span>
				</li>
				<li class="fl">
					<a href="index.jsp">首页</a>
				</li>
				<li class="fl">
					>
				</li>
				<li class="fl">
					<a>会员登陆</a>
				</li>
			</ul>
		</div>
		<div class="content wrapper clearfix">
			<div class="main fl">
				<div class="register-box">
					<h2 class="content-title">
						MBA会员登陆
					</h2>
					<form accept-charset="utf-8" method="post" action="login">
						<div class="clearfix userinput-wrapper">
							<label for="username">
								<em class="imp">*</em>用户名
							</label>
							<input type="text" id="username" name="username"
								class="userinput fl" />
							<span class="hidden result username fl"></span>
						</div>
						<div class="clearfix userinput-wrapper">
							<label for="password">
								<em class="imp">*</em>密码
							</label>
							<input type="password" id="password" name="password"
								class="userinput fl" />
							<span class="hidden result password fl"></span>
						</div>
						<div class="formop">
							<input type="submit" value="提交" class="g-button-submit g-button" />
							<input type="reset" value="重置" class="g-button-submit g-button" />
						</div>
						<div class="login-result result error">
							<%=request.getAttribute("result") == null ? "" : request
					.getAttribute("result")%>
						</div>
					</form>
				</div>
			</div>
			<div class="side fr">
				<div class="side-box">
					<!--h2 class="side-title">注册信息</h2-->
					<div>
						<span>还没有账号?</span>
						<br />
						<a href="register.jsp" class="g-button register">注册</a>
						<div class="info">
							<p>
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
		<div class="footer wrapper">
			<p class="c-999">
				黑ICP备1006889612 版权所有Copyright © 2012 All rights reserved.
			</p>
			<p class="c-999">
				黑龙省MBA
			</p>
		</div>
	</body>
	<script type="text/javascript" src="js/jquery-1.6.4.min.js">
	
</script>
	<script type="text/javascript" src="js/login.js">
	
</script>
</html>
