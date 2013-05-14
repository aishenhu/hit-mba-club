<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.mbaclub.news.pojo.Member"%>
<%@page import="com.mbaclub.news.util.TextUtil"%>
<jsp:useBean id="memberDao" class="com.mbaclub.news.dao.MemberDAO"></jsp:useBean>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	List<Member> allMember = memberDao.findAll();
	List<Member> imageMember = memberDao.findAll();
	Member curMember = null;
	if(request.getParameter("id") == null && !allMember.isEmpty()){
		curMember = allMember.get(0);
	}else if(request.getParameter("id") != null){
		long id = 1;
		try{
			id = Integer.parseInt(request.getParameter("id"));
		}catch(Exception e){
			id = 1;	
		}
		curMember = memberDao.findById(id);
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>精彩会员</title>
		<link type="text/css" rel="stylesheet"
			href="<%=basePath%>css/base.css">
		<link type="text/css" rel="stylesheet"
			href="<%=basePath%>css/common.css">
		<link type="text/css" rel="stylesheet"
			href="<%=basePath%>css/page.css">
		<link type="text/css" rel="stylesheet"
			href="<%=basePath%>css/member.css">
	</head>
	<body>
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
					<a>精彩会员</a>
				</li>
			</ul>
		</div>
		<div class="main wrapper clearfix">
			<div class="outline">
				<a class="outline-op" title="精彩会员列表"></a>
				<div class="outline-list hidden">
					<%
					for(int i = 0; i < allMember.size(); i++){
						Member m = allMember.get(i);
				%>
					<a href="member.jsp?id=<%=m.getId() %>"><%=m.getName() %></a>
					<%
					} 
				%>
				</div>
			</div>
			<div class="slide-show">
				<ul class="clearfix">
					<%
					for(int i = 0; i < imageMember.size(); i++){
						Member m = imageMember.get(i);
				%>
					<li class="fl">
						<a href="member.jsp?id=<%=m.getId() %>" class="image"
							title="<%=m.getName() %>"><img height="160" width="200"
								src="member/<%=m.getImage() == null ? "default_user_200x160.png" : m.getImage() %>" /> </a>
					</li>
					<%
					}
				%>
				</ul>
			</div>
			<%if(curMember != null){ %>
			<div class="content">
				<h2 class="title">
					<%=curMember.getName() %>
				</h2>
				<%if(curMember.getImage() != null){ 
					String url = curMember.getUrl();
					if (url != null && url.startsWith("http")) {
						
					} else {
						url = "http://" + url;
					}
				%>
					<img src="<%=curMember.getImage() %>" height="160" width="200"/>
				<%} %>
				<p>
				    <div class="info-box">
						<h2 class="info-title">
							会员信息
						</h2>
						<div class="info-item clearfix">
							<span class="label fl">姓名</span>
							<span class="value fl"><%=TextUtil.filterNull(curMember.getName()) %></span>
						</div>
						<div class="info-item clearfix">
							<span class="label fl">公司</span>
							<span class="value fl"><%=TextUtil.filterNull(curMember.getCompany()) %></span>
						</div>
						<div class="info-item clearfix">
							<span class="label fl">毕业学校</span>
							<span class="value fl"><%=TextUtil.filterNull(curMember.getSchool()) %></span>
						</div>
						<div class="info-item clearfix">
							<span class="label fl">成功格言</span>
							<span class="value fl"><%=TextUtil.filterNull(curMember.getMotto()) %></span>
						</div>
						<div class="info-item clearfix">
							<span class="label fl">个人主页</span>
							<%
							String url = curMember.getUrl();
							if (url != null && url.startsWith("http")) {
								
							} else {
								url = "http://" + url;
							} %>
							<a class="value fl"
								href="<%=url %>"
								target="_blank"> <%=TextUtil.filterNull(curMember.getUrl()) %></a>
						</div>
					</div>
					<%=curMember.getIntroduce() %>
				</p>
				
			</div>
			<%} %>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
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
	<script type="text/javascript" src="js/member.js">
	
</script>
</html>
