<%@ page language="java" import="java.util.*,com.mbaclub.news.pojo.*"
	pageEncoding="UTF-8"%>
<%@page import="com.mbaclub.news.dao.CompanyDAO"%>
<%@page import="com.mbaclub.news.dao.NewsDAO"%>
<%@page import="com.mbaclub.news.util.UrlUtil"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<jsp:useBean id="newsDao" class="com.mbaclub.news.dao.NewsDAO"></jsp:useBean>
<jsp:useBean id="companyDao" class="com.mbaclub.news.dao.CompanyDAO"></jsp:useBean>
<jsp:useBean id="memberDao" class="com.mbaclub.news.dao.MemberDAO"></jsp:useBean>
<jsp:useBean id="schoolImageDao"
	class="com.mbaclub.news.dao.SchoolImageDAO"></jsp:useBean>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	List<Member> imageList = memberDao.findAll();//.getMemberWithImage();
	request.setAttribute("imageList", imageList);
	request.setAttribute("noimageCompanyList", companyDao
			.getCompanysNoImage(CompanyDAO.CATEGORY_TYPE_MEMBER));
	request.setAttribute("schoolList", newsDao.getNewsByCategoryID(
			NewsDAO.NEWS_CATEGORY_SCHOOL, 0, 10));
	request.setAttribute("reviewMiniList", newsDao.getNewsByCategoryID(
			NewsDAO.NEWS_CATEGORY_REVIEW_MINI, 0, 4));
	request.setAttribute("reviewNormaliList", newsDao
			.getNewsByCategoryID(NewsDAO.NEWS_CATEGORY_REVIEW_NORMAL,
					0, 4));
	request.setAttribute("schoolImageList", schoolImageDao.findAll());
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta HTTP-EQUIV="pragma" CONTENT="no-cache"> 
		<meta HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate"> 
		<meta HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57GMT">
		
		<title>欢迎来到黑龙江省MBA俱乐部</title>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>css/jquery.lightbox-0.5.css" media="screen" />
		<link type="text/css" rel="stylesheet" href="<%=basePath%>css/base.css">
		<link type="text/css" rel="stylesheet" href="<%=basePath%>css/common.css">
		<link type="text/css" rel="stylesheet" href="<%=basePath%>css/page.css">
		<link type="text/css" rel="stylesheet" href="<%=basePath%>css/index.css">
		<link rel="stylesheet" href="<%=basePath%>themes/default/default.css" type="text/css" media="screen" />
	    <link rel="stylesheet" href="<%=basePath%>themes/light/light.css" type="text/css" media="screen" />
	    <link rel="stylesheet" href="<%=basePath%>themes/dark/dark.css" type="text/css" media="screen" />
	    <link rel="stylesheet" href="<%=basePath%>themes/bar/bar.css" type="text/css" media="screen" />
	    <link rel="stylesheet" href="<%=basePath%>css/nivo-slider.css" type="text/css" media="screen" />
	</head>
	<body>
		<jsp:include page="header.jsp"></jsp:include>
		<div class="main wrapper">
			<div class="banner-wrapper clearfix wrapper  theme-default" style="width:980px;height:280px;overflow:hidden">
				<div id="banner" class="nivoSlider">
					<img src="assets/banner-1.jpg" data-thumb="assets/banner-1.jpg"  alt="" />
	                <img src="assets/banner-2.jpg"  data-thumb="assets/banner-2.jpg" alt="" title="" />
				</div>
			</div>
			<div class="content clearfix wrapper">
				<div class="box release fl h-290">
					<div class="box-header">
						<h2>
							活动发布
							<span class="box-header-sub">Acivities release </span>
						</h2>
						<a href="<%=basePath%>activities.jsp" class="button more">more<span
							class="more-icon fr"></span> </a>
					</div>
					<div class="box-content">
						<div class="info-list">
							<ul>
								<%
									List<News> newsList = newsDao.getNewsByCategoryID(
											NewsDAO.NEWS_CATEGORY_ACTIVITY, 0, 10);
									for (int i = 0; newsList != null && i < newsList.size(); i++) {
										News n = newsList.get(i);
										if (i == newsList.size() - 1) {
											out.println("<li class=\"last\">");
										} else {
											out.println("<li>");
										}
								%>
								<a href="<%=basePath%>news.jsp?id=<%=n.getId()%>"><%=n.getName()%></a>
								</li>
								<%
									}
								%>
							</ul>
						</div>
					</div>
				</div>

				<div class="box review fr h-290">
					<div class="box-header">
						<h2>
							活动回顾
							<span class="box-header-sub">Acivities review</span>
						</h2>
						<a class="button more" href="<%=basePath%>review.jsp">more<span
							class="more-icon"></span> </a>
					</div>
					<div class="box-content clearfix">
						<div class="info-img-list fl">
							<ul>
								<c:forEach var="review" items="${reviewMiniList}">
									<li class="clearfix">
									<a href="<%=basePath%>news.jsp?id=${review.id}">
										<img width="120px" height="50px"
											src="<%=basePath%><c:out value="${review.image}" default="assets/review.png"></c:out>"
											class="fl" /></a>
										<a class="description fl" href="<%=basePath%>news.jsp?id=${review.id}">${review.name }</a>
									</li>
								</c:forEach>
							</ul>
						</div>
						<div class="img-title-group fl news clearfix">
							<c:forEach var="review" items="${reviewNormaliList}">
								<div class="img-title-item  fl">
									<a href="<%=basePath%>news.jsp?id=${review.id}">
									<img width="120px" height="80px"
										src="<%=basePath%><c:out value="${review.image}" default="assets/news.png" ></c:out>" /></a>
									<a class="description" href="<%=basePath%>news.jsp?id=${review.id}">${review.name }</a>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<div class="box unit fr h-230">
					<div class="box-header">
						<h2>
							会员单位
							<span class="box-header-sub">Member unit</span>
						</h2>
						<a class="button more"
							href="<%=basePath%>enterprise.jsp?method=<%=CompanyDAO.CATEGORY_TYPE_MEMBER%>">more<span
							class="more-icon"></span> </a>
					</div>
					<div class="box-content">
						<div class="info-img-list fl">
							<ul>
								<%
									List<Company> memImageList = companyDao
											.getCompanys(CompanyDAO.CATEGORY_TYPE_MEMBER);
									for (int i = 0; i < memImageList.size(); i++) {
										Company cimage = memImageList.get(i);
								%>
								<li class="clearfix">
									<img width="120px" height="50px"
										src="<%=basePath %><%=cimage.getLogo() == null || cimage.getLogo().equals("") ? "company/default_company_132x58.png" : cimage.getLogo()%>" class="fl" />
									<%
										if (cimage.getUrl() == null || "".equals(cimage.getUrl())) {
											out.println("<a class=\"description fl\">" + cimage.getName() + "</a>");
										} else {
									 %>
									<a class="description fl" href="<%=cimage.getUrl() == null ? "#" : UrlUtil.getLegalUrl(cimage.getUrl())%>" target="_blank"><%=cimage.getName()%></a>
									<%
										}
									 %>
								</li>
								<%
									}
								%>
							</ul>
						</div>
					</div>
				</div>
				<div class="box member fl h-230 mr-6">
					<div class="box-header">
						<h2>
							精彩会员
							<span class="box-header-sub"></span>
						</h2>
						<a class="button more" href="<%=basePath%>member.jsp">more<span
							class="more-icon"></span> </a>
					</div>
					<div class="box-content">
						<div class="info-img-list fl">
							<ul>
							<%
								for (int i = 0; imageList != null && i < imageList.size(); i++) {
									Member m = imageList.get(i);
							%>
									<li class="clearfix">
									<img width="120px" height="50px"
										src="member/<%=m.getImage() == null ? "default_user_132x58.png" : m.getImage()%>"
										class="fl" />
									<a class="description fl" href="<%=basePath%>member.jsp?id=<%=m.getId()%>"
											target="_black"><%=m.getName()%>
										</a>
									</li>
							<%
								}
							%>								
							</ul>
						</div>
					</div>
				</div>
				<div class="box information fl h-230">
					<div class="box-header">
						<h2>
							信息交流
							<span class="box-header-sub">Exchange of information</span>
						</h2>
						<a class="button more" href="<%=basePath%>information.jsp">more<span
							class="more-icon"></span> </a>
					</div>
					<div class="box-content">
						<div class="info-group">
							<ul>
								<%
									List<News> infoNewsList = newsDao.getNewsByCategoryID(
											NewsDAO.NEWS_CATEGORY_INFO_EXCHANGE, 0, 10);
									for (int i = 0; infoNewsList != null && i < infoNewsList.size(); i++) {
										News n = infoNewsList.get(i);
								%>
								<li class="info-group-item">
									<a href="news.jsp?id=<%=n.getId()%>" title="<%=n.getName()%>"><%=n.getName()%></a>
								</li>
								<%
									}
								%>
							</ul>
							<div class="op"></div>
						</div>
					</div>
				</div>
				<!--start of content-->
				<div class="box school fr h-290">
					<div class="box-header">
						<h2>
							校园在线
							<span class="box-header-sub">School</span>
						</h2>
						<a class="button more" href="school.jsp">more<span
							class="more-icon"></span> </a>
					</div>
					<div class="box-content clearfix">
						<div class="info-list fl">
							<ul>
								<c:forEach var="school" items="${schoolList}">
									<li>
										<a href="<%=basePath%>news.jsp?id=${school.id }">${school.name
											}</a>
									</li>
								</c:forEach>
							</ul>
						</div>

						<div class="slide-show fl">
							<ul class="clearfix">
								<c:forEach var="schoolImage" items="${schoolImageList}">
									<li class="fl">
										<a href="assets/${schoolImage.imagePath }" class="image"
											title='<c:out value="${schoolImage.introduce }" default="校园风采介绍"/>'><img
												src="assets/${schoolImage.imagePath }" /> </a>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
				<div class="box download fl h-230">
					<div class="box-header">
						<h2>
							常用资源
							<span class="box-header-sub">Resources</span>
						</h2>
						<a class="button more" href="http://gaofengtiyan1.host3.668895.com:804/information.jsp">more<span
							class="more-icon"></span> </a>
					</div>
					<div class="box-content">
						<div class="info-group">
							<ul>
								
								<li class="info-group-item">
									<a href="news.jsp?id=20" title="sdfasd">常用资源1</a>
								</li>
								
								<li class="info-group-item">
									<a href="news.jsp?id=7" title="test">常用资源2</a>
								</li>

								<li class="info-group-item">
									<a href="news.jsp?id=7" title="test">常用资源3</a>
								</li>

								<li class="info-group-item">
									<a href="news.jsp?id=7" title="test">常用资源4</a>
								</li>

								<li class="info-group-item">
									<a href="news.jsp?id=7" title="test">常用资源5</a>
								</li>

								<li class="info-group-item">
									<a href="news.jsp?id=7" title="test">合常用资源6</a>
								</li>
								
							</ul>
							<div class="op"></div>
						</div>
					</div>
				</div>
				<div class="enterprise h-120 wrapper box">
					<div class="box-header">
						<h2>
							合作企业
							<span class="box-header-sub">Cooperative enterprise</span>
						</h2>
						<a class="button more"
							href="<%=basePath%>enterprise.jsp?method=<%=CompanyDAO.CATEGORY_TYPE_ENTERPRISE%>">more<span
							class="more-icon"></span> </a>
					</div>
					<div class="box-content">
						<div class="image-slide">
							<ul class="clearfix">
								<%
									List<Company> comImageList = companyDao
											.getCompanysWithImage(CompanyDAO.CATEGORY_TYPE_ENTERPRISE);
									for (int i = 0; i < comImageList.size(); i++) {
										Company cimage = comImageList.get(i);
								%>
								<li class="fl mr-38">
								<%
									if (cimage.getLogo() != null && !"".equals(cimage.getLogo())) {
								%>
									<img width="120px" height="50px"
										src="<%=cimage.getLogo()%>" class="fl" />
								<%
									}
								%>
									<a class="description" href="<%=cimage.getUrl()%>" target="_blank"><%=cimage.getName()%></a>
								</li>
								<%
									}
								%>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!--end of content-->
		</div>
		<!--end of main-->
		<div class="footer wrapper">
			<div class="related clearfix">
				<div class="img-list  fl">
					<ul class="clearfix">
						<li class="fl mr-16">
							<img width="88px" height="31px" src="assets/link1.jpg" />
						</li>
						<li class="fl mr-16">
							<img width="88px" height="31px" src="assets/link2.gif" />
						</li>
						<li class="fl mr-16">
							<img width="88px" height="31px" src="assets/link1.jpg" />
						</li>
						<li class="fl mr-16">
							<img width="88px" height="31px" src="assets/link1.jpg" />
						</li>
					</ul>
				</div>
				<div class="link-list fr">
					<ul class="clearfix">
						<li class="fl mr-6">
							<a>海外中国学生学者团体</a>
						</li>
						<li class="fl mr-6">
							|
						</li>
						<li class="fl mr-6">
							<a>波罗的海中文网</a>
						</li>
						<li class="fl mr-6">
							|
						</li>
						<li class="fl mr-6">
							<a>E度教育网</a>
						</li>
						<li class="fl mr-6">
							|
						</li>
						<li class="fl mr-6">
							<a>国家汉办</a>
						</li>
						<li class="fl mr-6">
							|
						</li>
						<li class="fl mr-6">
							<a>教育部科技发展中心</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="about clearfix">
				<div class="link-list fl">
					<ul class="clearfix">
						<li class="fl mr-6">
							<a>加入收藏</a>
						</li>
						<li class="fl mr-6">
							|
						</li>
						<li class="fl mr-6">
							<a>友情链接</a>
						</li>
						<li class="fl mr-6">
							|
						</li>
						<li class="fl mr-6">
							<a href="contact.jsp">联系我们</a>
						</li>
					</ul>
				</div>
				<p class="copyright c-999">
					黑ICP备1006889612 版权所有Copyright©2012 All rights reserved.
				</p>
			</div>
		</div>
	</body>
	<script type="text/javascript" src="js/jquery-1.6.4.min.js"></script>
	<script type="text/javascript" src="js/jquery.lightbox-0.5.min.js"></script>
	<script type="text/javascript" src="js/index.js"></script>
	<script type="text/javascript" src="js/jquery.nivo.slider.pack.js"></script>
    <script type="text/javascript">
    $(window).load(function() {
        $('#banner').nivoSlider({
        	effect: 'fade',
        	animSpeed: 1000
        });
    });
    </script>
</html>

