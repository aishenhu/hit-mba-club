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
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>申请成为会员</title>
		<link type="text/css" rel="stylesheet" href="css/base.css">
		<link type="text/css" rel="stylesheet" href="css/common.css">
		<link type="text/css" rel="stylesheet" href="css/page.css">
		<link type="text/css" rel="stylesheet" href="css/register.css">
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
						MBA会员注册
					</h2>
					<form method="post" action="register">
						<div class="clearfix userinput-wrapper">
							<label for="username">
								<em class="imp">*</em>用户名
							</label>
							<input type="text" id="username" name="username"
								class="userinput fl" onkeyup="value=value.replace(/[\u4E00-\u9FA5]/g,'')"/>
							<span class="fl hidden result username"></span>
						</div>
						<div class="clearfix userinput-wrapper">
							<label for="email">
								<em class="imp">*</em>邮箱
							</label>
							<input type="text" id="email" name="email" class="userinput fl" />
							<span class="hidden result email fl"></span>
						</div>
						<div class="clearfix userinput-wrapper">
							<label for="password">
								<em class="imp">*</em>密码
							</label>
							<input type="password" id="password" name="password"
								class="userinput fl" />
							<span class="hidden result password fl"></span>
						</div>
						<div class="clearfix userinput-wrapper">
							<label for="passwordag">
								<em class="imp">*</em> 密码确认
							</label>
							<input type="password" id="passwordag" name="passwordag"
								class="userinput fl" />
							<span class="hidden result passwordag fl"></span>
						</div>
						<div class="clearfix userinput-wrapper">
							<label for="truename">
								<em class="imp">*</em>真实姓名
							</label>
							<input type="text" id="truename" name="truename"
								class="userinput fl" />
							<span class="fl hidden result truename"></span>
						</div>
						<div class="clearfix userinput-wrapper">
							<label for="school">
								<em class="imp">*</em>毕业学校
							</label>
							<input type="text" id="school" name="school"
								class="userinput fl" />
							<span class="fl hidden result school"></span>
						</div>
						<div class="clearfix userinput-wrapper">
							<label for="date">
								<em class="imp">*</em>入学年份
							</label>
							<input type="text" id="date" name="date"
								class="userinput fl" />
							<span class="fl hidden result date"></span>
						</div>
						<div class="clearfix userinput-wrapper">
							<label for="phone">
								<em class="imp">*</em>手机号码
							</label>
							<input type="text" id="phone" name="phone"
								class="userinput fl" />
							<span class="fl hidden result phone"></span>
						</div>
						<div class="clearfix userinput-wrapper">
							<label for="company">
								工作单位
							</label>
							<input type="text" id="company" name="company"
								class="userinput fl" />
							<span class="hidden result company fl"></span>
						</div>
						<div class="clearfix userinput-wrapper">
							<label for="infor">
								审核信息
							</label>
							<input type="text" id="infor" name="infor" class="userinput fl" />
							<span class="hidden result infor fl"></span>
						</div>
						<div class="formop">
							<input type="submit" value="提交" class="g-button-submit g-button" />
							<input type="reset" value="重置" class="g-button-submit g-button" />
						</div>
					</form>
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
	<script type="text/javascript" src="js/jquery-1.6.4.min.js">
	
</script>
	<script type="text/javascript" src="js/register.js">
	
</script>
</html>
