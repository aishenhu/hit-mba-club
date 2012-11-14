<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link type="text/css" rel="stylesheet" href="<%=basePath %>css/base.css">
		<link type="text/css" rel="stylesheet" href="<%=basePath %>css/common.css">
		<link type="text/css" rel="stylesheet" href="<%=basePath %>css/page.css">
		<title>联系我们</title>
		<style type="text/css">
html {
	height: 100%
}

body {
	height: 100%;
	margin: 0px;
	padding: 0px
}

#container {
	width: 600px;
	height: 400px;
	border: 1px solid #ccc;
}

.main {
	min-height: 400px;
	height: 450px;
	position: relative;
}

.info-box {
	background-color: #eee;
	position: absolute;
	padding: 10px 20px 20px 20px;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 0 10px 0 #BBB;
	-moz-box-shadow: 0 0 10px 0 #bbb;
	box-shadow: 0 0 10px 0 #BBB;
	overflow: visible;
	width: 300px;
	color: #333;
	right: 0;
	top: 30px;
}

.info-title {
	border-bottom: 1px solid #ccc;
}

.label {
	display: block;
	width: 60px;
}

.info-item {
	line-height: 24px;
}

a {
	text-decoration: underline;
}

.value {
	display: block;
	width: 130px;
}

.footer {
	border-top: 1px solid #e1e1e1;
}
</style>
		<script type="text/javascript"
			src="http://api.map.baidu.com/api?v=1.3">
	
</script>
	</head>
	<body>
		<jsp:include page="header.jsp"></jsp:include>
		<div class="page-nav wrapper">
			<ul class="clearfix">
				<li class="fl">
					<span class="c-999">当前位置：</span>
				</li>
				<li class="fl">
					<a href="<%=basePath %>index.jsp">首页</a>
				</li>
				<li class="fl">
					>
				</li>
				<li class="fl">
					<a>联系我们</a>
				</li>
			</ul>
		</div>
		<div class="main">
			<div class="content wrapper">
				<h2>
					我们在这里
				</h2>
				<div id="container">
				</div>
				<div class="info-box">
					<h2 class="info-title">
						俱乐部信息
					</h2>
					<div class="info-item clearfix">
						<span class="label fl">名称</span>
						<span class="value fl">黑龙江省MBA俱乐部</span>
					</div>
					<!--div class="info-item clearfix">
						<span class="label fl">地点</span>
						<span class="value fl">黑龙江省哈尔滨市</span>
					</div>
					<>div class="info-item clearfix">
						<span class="label fl">联系电话</span>
						<span class="value fl">0451-86231876</span>
					</div-->
					<div class="info-item clearfix">
						<span class="label fl">联系人</span>
						<span class="value fl">俱乐部管理员</span>
					</div>
					<div class="info-item clearfix">
						<span class="label fl">地址</span>
						<span class="value fl">黑龙江省哈尔滨市</span>
					</div>
					<div class="info-item clearfix">
						<span class="label fl">邮编</span>
						<span class="value fl">150001</span>
					</div>
					<div class="info-item clearfix">
						<span class="label fl">公司邮箱</span>
						<span class="value fl">hljmba@163.com</span>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
		<script type="text/javascript">
	var map = new BMap.Map("container");
	// 创建地址解析器实例  
	var myGeo = new BMap.Geocoder();
	// 将地址解析结果显示在地图上，并调整地图视野  
	myGeo.getPoint("哈尔滨工业大学软件学院", function(point) {
		if (point) {
			map.centerAndZoom(point, 16);
			map.addOverlay(new BMap.Marker(point));
			map.addControl(new BMap.NavigationControl());
			map.addControl(new BMap.ScaleControl());
			map.addControl(new BMap.OverviewMapControl());
			map.addControl(new BMap.MapTypeControl());
		}
	}, "哈尔滨市");
</script>
	</body>
	<script type="text/javascript" src="js/jquery-1.6.4.min.js">
	
</script>
	<!–[if IE]>
	<script type="text/javascript" src="js/jquery.corner.js">
	
</script>
	<script type="text/javascript">
	$(".outline-list").corner("10px");
	$(".info-box").corner("10px");
</script>
	<![endif]–>
</html>
