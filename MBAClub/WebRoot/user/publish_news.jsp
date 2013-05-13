<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.mbaclub.news.dao.NewsDAO"%>
<%@page import="com.mbaclub.news.pojo.News"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	int type = -1;
	try {
		type = Integer.parseInt(request.getParameter("type"));
		if (type == 7) {
			// 7为活动回顾中小图，转化为正常
			type = 1;
		}
	} catch (Exception e) {
		type = -1;
	}
	// 判断当前的动作，是否是修改
	String action = request.getParameter("action");
	News news = null;
	if("modify".equals(action)) {
		int id = -1;
		try{
			id = Integer.parseInt(request.getParameter("id"));
			NewsDAO dao = new NewsDAO();
			news = dao.findById(Long.valueOf(id));
		}catch(Exception e){
		}
	}
	String[] titles = { "活动发布", "活动回顾", "会员单位", "合作企业", "信息交流", "精彩会员", "校园在线" };
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
					<a><%=titles[type] %></a>
				</li>
			</ul>
		</div>
		<div class="content wrapper clearfix">
			<jsp:include page="publish_menu.jsp"></jsp:include>
			<div class="main">
				<div class="title userinput-wrapper">
					<label>
						标题
					</label>
					<input type="text" name="title" class="userinput" value="<%=news != null ? news.getName() : "" %>"/>
				</div>
				<div class="tags userinput-wrapper clearfix">
					<label>
						标签
						<span class="c-999">[用英文分号分开]</span>
					</label>
					<input type="text" name="tag" id="tag" class="userinput fl"
						title="用;分开" value="<%=news != null && news.getSource() != null ? news.getSource() : "" %>"/>
					<div class="fl tags-result clearfix">
						<!--span class="tag-item fl mr-6 button">tag1<a class="close hidden" title="删除">x</a></span>
                        <span class="tag-item fl mr-6 button">tag2<a class="close hidden" title="删除">x</a></span-->
					</div>
				</div>
				<div class="thumb">
					<input type="checkbox" value="使用缩略图" name="thumb-check"
						class="switch">
					使用缩略图
					</input>
					<a class="switchThumbType" type="1">切换格式</a>
					<div class="fileupload hidden"><div align="left"> 
						<script type="text/javascript">
							function callbackThumb(msg, url) {
								document.getElementById("file").outerHTML = document.getElementById("file").outerHTML;
								document.getElementById("msg1").innerHTML = msg;
								document.getElementById("thumb").src = url;
							}
						</script> 
						<img height="80" width="120" border="1" id="thumb" name="thumb" type="0" /> 
						<br> 
						</div><form action="<%=basePath %>upload" id="form1" name="form1"
							encType="multipart/form-data" method="post" target="hidden_frame">
							<input type="file" id="file" name="file" style="width: 450">
							<INPUT type="submit" value="上传文件"
								class="g-button-submit g-button">
							<span id="msg1"></span>
							<br>
							<font color="red"> 支持JPG,JPEG,GIF,BMP,PNG文件的上传 </font>
							<iframe name='hidden_frame' id="hidden_frame"
								style='display: none'>
							</iframe>
						</form>
					</div>
				</div>
				<script type="text/plain" id="myEditor">
					<%=news != null ? news.getContent() : "" %>
				</script>
				<input name="is_modify" type="hidden" value="<%=news != null ? "True" : "False" %>"/>
				<input name="id" type="hidden"
					value="<%=news != null ? news.getId() : "False" %>" />
				<span class="g-button-submit g-button" id="submit">提交</span>
				
			</div>
		</div>
		<jsp:include page="../footer.jsp"></jsp:include>
	</body>
	<script type="text/javascript"
		src="<%=basePath%>js/jquery-1.6.4.min.js">
</script>
	<script type="text/javascript" src="<%=basePath%>js/publish.js">
</script>
</html>

