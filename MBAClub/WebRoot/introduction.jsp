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
		<title>俱乐部介绍</title>
		<link type="text/css" rel="stylesheet" href="<%=basePath %>css/base.css">
		<link type="text/css" rel="stylesheet" href="<%=basePath %>css/common.css">
		<link type="text/css" rel="stylesheet" href="<%=basePath %>css/page.css">
		<link type="text/css" rel="stylesheet" href="<%=basePath %>css/introduction.css">
	</head>
	<body>
		<div class="main wrapper">
			<h1 class="title">
				黑龙江MBA俱乐部(黑龙江MBA同学会)介绍
			</h1>
			<h2>
				我们是谁？
			</h2>
			<img src="<%=basePath %>assets/logo.png" class="fl" />
			<p>
				黑龙江MBA俱乐部(黑龙江MBA同学会)是黑龙江MBA中最有影响力、最受关注、最受拥护的同学组织。作为全省MBA沟通交流、资源扩展的唯一高效平台，自2006年开始筹备，2008年初正式成立，至今已经组织了几十次活动，包括2010、2011、2012三届全省MBA年会，2010、2011两届全省MBA羽毛球赛，以及首届MBA案例大赛，参与人次超过1000人。俱乐部凝聚了来自全省各地、各届、各行业的MBA同学，经过近6年的发展，得到了各校MBA中心以及同学们的信任和支持，工大、工程、商大、黑大、吉大、东财、理工等超过十五所院校，跨度达10余届的同学活跃在俱乐部中，大家在俱乐部中交流思想、交换资源、共享信息，无数的同学在俱乐部的支持下扩展了人脉、促进了事业的发展。为与各学校的MBA联合会区分，避免引起误会，黑龙江MBA俱乐部对外以黑龙江MBA同学会为载体，吸收全省MBA同学加入。
			</p>
			<h2>
				我们在做什么？
			</h2>
			<p>
				黑龙江MBA俱乐部为全省MBA同学创建了一个安惬心灵的家园，一个不断扩展着并共享的资源平台，一个促进成长的基石。无论是就读或毕业在哪个学校，无论是毕业于哪一年届，无论是深处龙江大地的何处，俱乐部已经成为一个不断吸引龙江MBA，聚集龙江MBA的组织。无论是激荡智慧、刺激头脑的首届全省MBA案例大赛，还是轻松身心的两届MBA羽毛球精英赛，或是交流思想、分享资源的MBA沙龙，每个月俱乐部组织的各种活动，都在为MBA同学沟通、联系创造无限机会。无数的同学通过俱乐部相知、相识，成为生活上互相帮助的朋友，成为事业上促进成长的伙伴，成长中我们不忘师恩，不辜负MBA中心的培养。因为有了俱乐部，每名MBA俱乐部同学在生活和工作之中都多了一份坚强支撑和振奋的力量。我们相信，当我们汇聚在一起，我们就是精英之族，我们每一个同学都会互相照耀而分外精彩辉煌！
			</p>
			<h2>
				我们需要你！
				<a class="help" href="<%=basePath %>register.jsp">加入我们</a>
			</h2>
			<p>
				俱乐部由MBA组成，更是由会员组成，我们注重人品，注重能力，加入这里，你就可能获得更大的支持，汲取更多的资源，在宽阔的平台上让你展示，还有更广的空间任你翱翔！成为俱乐部的会员，我们会提前通知俱乐部组织的各项活动，给每个一人创造与更多同学相识的机会，可以共享全省MBA同学资源库，也可以提出各种你的畅想和建议！
			</p>
			<h2>
				我们的未来！
			</h2>
			<p>
				龙江MBA，风雨二十载，同学三千人。俱乐部第一个使众多院校同学有组织的连线在一起，凝聚在一起，在这里我们支持每一名会员的成长和发展。我们建立全省MBA资源库，帮助你发挥自己的资源优势，与他人的资源进行对接。我们组织休闲活动，帮助你放松心灵、健康身心。我们聚集同学，帮助你激发灵感，让大家的智慧汇集起来帮助你解答疑惑。我们融入在一起，凝聚力量，让每一个俱乐部的成员共享它的资源，感受这个集体的温暖，获得同学们的帮助，吸收更多的智慧能量，这就是我们追求的未来！
			</p>
			<p>
				黑龙江MBA俱乐部，你的精彩从现在开始！
			</p>
			<p>
				官方QQ群号码：165868248
				<a class="g-button fr" href="<%=basePath %>index.jsp">返回首页</a>
			</p>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</body>
</html>
