<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	int type = -1;
	try {
		type = Integer.parseInt(request.getParameter("type"));
	} catch (Exception e) {
		type = -1;
	}
	String[] titles = { "活动发布", "活动回顾", "会员单位", "合作企业", "信息交流", "精彩会员", "校园在线" };
	String[] urls = { "publish_news.jsp", "publish_news.jsp", "publish_company.jsp", "publish_company.jsp", "publish_news.jsp", "publish_member.jsp", "publish_news.jsp" };
%>

<div class="side">
	<h2 class="side-title" type=<%=type %>>
		管理操作项
	</h2>
	<ul class="list clearfix">
	<%
		for(int i = 0; i < titles.length; i++){
	%>
		<li class="fl<%if(type == i) out.print(" current"); %>" value="<%=i %>">
			<a href="<%=urls[i] %>?type=<%=i %>"><%=titles[i] %></a>
		</li>
	<%
		}
	%>
	</ul>
</div>
