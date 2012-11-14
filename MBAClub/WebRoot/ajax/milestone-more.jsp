<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.mbaclub.news.pojo.Milestone"%>
<%@page import="com.mbaclub.news.util.DateUtil"%>
<jsp:useBean id="mileDao" class="com.mbaclub.news.dao.MilestoneDAO"></jsp:useBean>
<%
	String p = request.getParameter("requestPage");
	System.out.println(p);
	int pageNo = 1;
	try {
		pageNo = Integer.parseInt(p);
	} catch (Exception e) {
		pageNo = 1;
	}
	
	List<Milestone> list = mileDao.getMilestones((pageNo + 1) * 3, 3);
	for (int i = 0; i < list.size(); i++) {
		Milestone m = list.get(i);
		Calendar calen = Calendar.getInstance();
		calen.setTime(m.getEventDate());
%>
<div class="milestone" id="milestone<%=i + (pageNo + 1) * 3 %>">
	<div class="time" title="<%=DateUtil.getDate(m.getEventDate()) %>">
		<span class="year"><%=calen.get(Calendar.YEAR)%>/</span>
		<span class="month"><%=calen.get(Calendar.MONTH) + 1%>/</span>
		<br />
		<span class="day"><%=calen.get(Calendar.DAY_OF_MONTH)%></span>
	</div>
	<div class="milestone-content">
		<h2 class="milestone-title">
			<%=m.getTitle()%>
		</h2>
		<div class="description clearfix">
		<%if(m.getImage() != null){ %>
			<img src="assets/<%=m.getImage() %>" />
		<%} %>
			<p>
				<%=m.getContent()%>
			</p>
		</div>
		<div class="addition">
		<%if(m.getMoreUrl() != null){ %>
			<a href="<%=m.getMoreUrl()%>">更多阅读</a>
		<%} %>	
		</div>
	</div>
</div>
<%
	}
%>