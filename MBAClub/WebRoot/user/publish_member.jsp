<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
		<title>内容管理页面</title>
		<link type="text/css" rel="stylesheet"
			href="<%=basePath%>css/base.css">
		<link type="text/css" rel="stylesheet"
			href="<%=basePath%>css/common.css">
		<link type="text/css" rel="stylesheet"
			href="<%=basePath%>css/page.css">
		<link type="text/css" rel="stylesheet"
			href="<%=basePath%>css/publish.css">
		<script type="text/javascript"
			src="<%=basePath%>ueditor/editor_config.js">
</script>
		<script type="text/javascript"
			src="<%=basePath%>ueditor/editor_all.js">
</script>
		<link rel="stylesheet"
			href="<%=basePath%>ueditor/themes/default/ueditor.css">
	</head>
	<body>
		<jsp:include page="header.jsp"></jsp:include>
		<div class="page-nav wrapper">
			<ul class="clearfix">
				<li class="fl">
					<span class="c-999">当前位置：</span>
				</li>
				<li class="fl">
					<a href="<%=basePath%>user/index.jsp">首页</a>
				</li>
				<li class="fl">
					>
				</li>
				<li class="fl">
					<a>内容发布</a>
				</li>
				<li class="fl">
					<a class="other" title="点击选择其它">></a>
				</li>
				<li class="fl">
					<a>精彩会员</a>
				</li>
			</ul>
		</div>
		<div class="content wrapper clearfix">
			<jsp:include page="publish_menu.jsp"></jsp:include>
			<div class="userinfo">
					<h2>
						用户信息输入区
					</h2>
					<div>
						<label>
							姓名
						</label>
						<input type="text" name="username" class="userinput" />
						<input type="hidden" name="stype" value="<%=request.getParameter("type") %>"/>
					</div>
					<div>
						<label>
							公司
						</label>
						<input type="text" name="usercompany" class="userinput" />
					</div>
					<div>
						<label>
							毕业学校
						</label>
						<input type="text" name="userschool" class="userinput" />
					</div>
					<div>
						<label>
							座右铭
						</label>
						<input type="text" name="usermotto" class="userinput" />
					</div>
					<div>
						<label>
							个人主页
						</label>
						<input type="text" name="userpage" class="userinput" />
					</div>
					<div>
						<label>
							个人简介
						</label>
						<textarea name="userinfo" class="" cols="30" rows="10"></textarea>
					</div>
				</div>
				<div class="image">
					<input type="checkbox" value="使用人物头像" name="image-check"
						class="switch">
					使用人物头像
					</input>
					<div class="fileupload hidden">
					<script type="text/javascript">
						function callbackImage(msg, url) {
							document.getElementById("file").outerHTML = document.getElementById("file").outerHTML;
							document.getElementById("msg2").innerHTML = msg;
							document.getElementById("img").src = url;
						}
					</script>
						<img id="img" border="1">
						<br>
						<form action="../upload" id="form1" name="form1"
							encType="multipart/form-data" method="post" target="hidden_frame">
							<input type="file" id="file" name="file" style="width: 450">
							<input type="hidden" id="type" name="type" value="5">
							<INPUT type="submit" value="上传文件"
								class="g-button-submit g-button">
							<span id="msg2"></span>
							<br>
							<font color="red"> 支持JPG,JPEG,GIF,BMP,PNG文件的上传 </font>
							<iframe name='hidden_frame' id="hidden_frame"
								style='display: none'>
							</iframe>
						</form>
					</div>
				</div>
			<span class="g-button-submit g-button" id="submit">提交</span>
		</div>
		<jsp:include page="../footer.jsp"></jsp:include>
	</body>
	<script type="text/javascript"
		src="<%=basePath%>js/jquery-1.6.4.min.js">
</script>
	<script type="text/javascript" src="<%=basePath%>js/publish-company.js">
</script>
</html>
