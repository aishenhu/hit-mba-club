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
		<title>资源共享</title>
		<link type="text/css" rel="stylesheet"
			href="<%=basePath%>css/base.css" />
		<link type="text/css" rel="stylesheet"
			href="<%=basePath%>css/common.css" />
		<link type="text/css" rel="stylesheet"
			href="<%=basePath%>css/page.css" />
		<link type="text/css" rel="stylesheet"
			href="<%=basePath%>css/resource.css" />
	</head>
	<body>
		<jsp:include page="./header.jsp"></jsp:include>
		<div class="page-nav wrapper">
			<ul class="clearfix">
				<li class="fl">
					<span class="c-999">当前位置：</span>
				</li>
				<li class="fl">
					<a href="<%=basePath%>index.jsp">管理首页</a>
				</li>
				<li class="fl">
					>
				</li>
				<li class="fl">
					<a>资源共享</a>
				</li>
			</ul>
		</div>
		<div class="content wrapper clearfix">
			<div class="side fl">
				<div class="side-box">
					<h2 class="side-title">
						资源统计
						<span class="c-999 small">[共408个资源]</span>
					</h2>
					<div class="flash-wrapper">
						<!--object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" id="Chart" width="240" height="150" codebase="http://fpdownload.macromedia.com/get/flashplayer/current/swflash.cab">
                        <param name="movie" value="Chart.swf" /><param name="quality" value="high" /><param name="bgcolor" value="#869ca7" /><param name="allowScriptAccess" value="sameDomain" />
                        <embed src="assets/Chart.swf" quality="high" bgcolor="#869ca7" width="240" height="150" name="Chart" align="middle" play="true" loop="false" quality="high" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.adobe.com/go/getflashplayer">
                        </embed>
                        </object-->
						<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
							codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,0,0"
							width="240" height="150" id="Untitled-1" align="middle">
							<param name="allowScriptAccess" value="sameDomain" />
							<param name="movie" value="../assets/Chart.swf" />
							<param name="quality" value="high" />
							<param name="bgcolor" value="#ffffff" />
							<embed src="../assets/Chart.swf" quality="high" bgcolor="#ffffff"
								width="240" height="150" name="mymovie" align="middle"
								allowScriptAccess="sameDomain"
								type="application/x-shockwave-flash"
								pluginspage="http://www.macromedia.com/go/getflashplayer" />
						</object>
					</div>
				</div>
				<div class="side-box">
					<h2 class="side-title">
						最新资源
					</h2>
					<ul class="list">
						<li>
							<a>共享文档<span class="c-999">[2012-05-19]</span>
							</a>
						</li>
						<li>
							<a>共享文档<span class="c-999">[2012-05-19]</span>
							</a>
						</li>
						<li>
							<a>共享文档<span class="c-999">[2012-05-19]</span>
							</a>
						</li>
						<li>
							<a>共享文档<span class="c-999">[2012-05-19]</span>
							</a>
						</li>
						<li>
							<a>共享文档<span class="c-999">[2012-05-19]</span>
							</a>
						</li>
						<li>
							<a>共享文档<span class="c-999">[2012-05-19]</span>
							</a>
						</li>
						<li>
							<a>共享文档<span class="c-999">[2012-05-19]</span>
							</a>
						</li>
					</ul>
				</div>
				<div class="side-box">
					<h2 class="side-title">
						热门资源
					</h2>
					<ul class="list">
						<li>
							<a>共享文档<span class="c-999">[2012-05-19]</span><span
								class="c-999">[1231次]</span>
							</a>
						</li>
						<li>
							<a>共享文档<span class="c-999">[2012-05-19]</span>
							</a>
						</li>
						<li>
							<a>共享文档<span class="c-999">[2012-05-19]</span>
							</a>
						</li>
						<li>
							<a>共享文档<span class="c-999">[2012-05-19]</span>
							</a>
						</li>
						<li>
							<a>共享文档<span class="c-999">[2012-05-19]</span>
							</a>
						</li>
						<li>
							<a>共享文档<span class="c-999">[2012-05-19]</span>
							</a>
						</li>
						<li>
							<a>共享文档<span class="c-999">[2012-05-19]</span>
							</a>
						</li>
						<li>
							<a>共享文档<span class="c-999">[2012-05-19]</span>
							</a>
						</li>
						<li>
							<a>共享文档<span class="c-999">[2012-05-19]</span>
							</a>
						</li>
						<li>
							<a>共享文档<span class="c-999">[2012-05-19]</span>
							</a>
						</li>
						<li>
							<a>共享文档<span class="c-999">[2012-05-19]</span>
							</a>
						</li>
						<li>
							<a>共享文档<span class="c-999">[2012-05-19]</span>
							</a>
						</li>
						<li>
							<a>共享文档<span class="c-999">[2012-05-19]</span>
							</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="main fr">
				<div class="tab-wrapper">
					<div class="tab-nav">
						<ul class="clearfix">
							<li class="fl">
								<a target="tab-1"
									class="tab-nav-item tab-nav-first tab-nav-current">所有文件<span
									class="c-999">(15个)</span>
								</a>
							</li>
							<li class="fl">
								<a target="tab-4" class="tab-nav-item">上传资源</a>
							</li>
						</ul>
					</div>
					<div class="tab-container">
						<div class="tab-content tab-1 clearfix">
							<div class="fl select">
								<span>选择：</span>
								<a class="select-all">全选</a>|
								<a class="select-cancel">取消全选</a>|
								<a class="select-download">批量下载</a>
							</div>
							<div class="operation">
								<ul class="op-page clearfix">
									<li class="fl">
										<a class="button">上一页</a>
									</li>
									<li class="fl">
										<a class="button" href="resource.html?page=1">1</a>
									</li>
									<li class="fl">
										<a class="button">2</a>
									</li>
									<li class="fl">
										<a class="button">3</a>
									</li>
									<li class="fl">
										<a class="button">下一页</a>
									</li>
								</ul>
							</div>
							<table>
								<caption>
									所有分享文件
								</caption>
								<tbody>
									<tr>
										<th>
											选择
										</th>
										<th>
											文件名
										</th>
										<th>
											文件大小
										</th>
										<th>
											上传者
										</th>
										<th>
											下载次数
										</th>
										<th>
											上传时间
										</th>
										<th>
											操作
										</th>
									</tr>
									<tr>
										<td>
											<input type="checkbox" />
										</td>
										<td>
											<span class="icon word"></span>分享文档.doc
										</td>
										<td>
											418.5MB
										</td>
										<td>
											管理员
										</td>
										<td>
											321次
										</td>
										<td>
											2012-05-19
										</td>
										<td class="share-op">
											<a class="button fl">下载</a>
											<a class="button fl">重命名</a>
											<a class="button fl">删除</a>
										</td>
									</tr>
									<tr>
										<td>
											<input type="checkbox" />
										</td>
										<td>
											<span class="icon zip"></span>分享文档.zip
										</td>
										<td>
											418.5MB
										</td>
										<td>
											管理员
										</td>
										<td>
											321次
										</td>
										<td>
											2012-05-19
										</td>
										<td class="share-op">
											<a class="button fl">下载</a>
											<a class="button fl">重命名</a>
											<a class="button fl">删除</a>
										</td>
									</tr>
									<tr>
										<td>
											<input type="checkbox" />
										</td>
										<td>
											<span class="icon excel"></span>分享文档.xls
										</td>
										<td>
											418.5MB
										</td>
										<td>
											管理员
										</td>
										<td>
											321次
										</td>
										<td>
											2012-05-19
										</td>
										<td class="share-op">
											<a class="button fl">下载</a>
											<a class="button fl">重命名</a>
											<a class="button fl">删除</a>
										</td>
									</tr>
									<tr>
										<td>
											<input type="checkbox" />
										</td>
										<td>
											<span class="icon excel"></span>分享文档.xls
										</td>
										<td>
											418.5MB
										</td>
										<td>
											管理员
										</td>
										<td>
											321次
										</td>
										<td>
											2012-05-19
										</td>
										<td class="share-op">
											<a class="button fl">下载</a>
											<a class="button fl">重命名</a>
											<a class="button fl">删除</a>
										</td>
									</tr>
									<tr>
										<td>
											<input type="checkbox" />
										</td>
										<td>
											<span class="icon excel"></span>分享文档.xls
										</td>
										<td>
											418.5MB
										</td>
										<td>
											管理员
										</td>
										<td>
											321次
										</td>
										<td>
											2012-05-19
										</td>
										<td class="share-op">
											<a class="button fl">下载</a>
											<a class="button fl">重命名</a>
											<a class="button fl">删除</a>
										</td>
									</tr>
									<tr>
										<td>
											<input type="checkbox" />
										</td>
										<td>
											<span class="icon excel"></span>分享文档.xls
										</td>
										<td>
											418.5MB
										</td>
										<td>
											管理员
										</td>
										<td>
											321次
										</td>
										<td>
											2012-05-19
										</td>
										<td class="share-op">
											<a class="button fl">下载</a>
											<a class="button fl">重命名</a>
											<a class="button fl">删除</a>
										</td>
									</tr>
									<tr>
										<td>
											<input type="checkbox" />
										</td>
										<td>
											<span class="icon excel"></span>分享文档.xls
										</td>
										<td>
											418.5MB
										</td>
										<td>
											管理员
										</td>
										<td>
											321次
										</td>
										<td>
											2012-05-19
										</td>
										<td class="share-op">
											<a class="button fl">下载</a>
											<a class="button fl">重命名</a>
											<a class="button fl">删除</a>
										</td>
									</tr>
									<tr>
										<td>
											<input type="checkbox" />
										</td>
										<td>
											<span class="icon excel"></span>分享文档.xls
										</td>
										<td>
											418.5MB
										</td>
										<td>
											管理员
										</td>
										<td>
											321次
										</td>
										<td>
											2012-05-19
										</td>
										<td class="share-op">
											<a class="button fl">下载</a>
											<a class="button fl">重命名</a>
											<a class="button fl">删除</a>
										</td>
									</tr>
									<tr>
										<td>
											<input type="checkbox" />
										</td>
										<td>
											<span class="icon excel"></span>分享文档.xls
										</td>
										<td>
											418.5MB
										</td>
										<td>
											管理员
										</td>
										<td>
											321次
										</td>
										<td>
											2012-05-19
										</td>
										<td class="share-op">
											<a class="button fl">下载</a>
											<a class="button fl">重命名</a>
											<a class="button fl">删除</a>
										</td>
									</tr>
									<tr>
										<td>
											<input type="checkbox" />
										</td>
										<td>
											<span class="icon excel"></span>分享文档.xls
										</td>
										<td>
											418.5MB
										</td>
										<td>
											管理员
										</td>
										<td>
											321次
										</td>
										<td>
											2012-05-19
										</td>
										<td class="share-op">
											<a class="button fl">下载</a>
											<a class="button fl">重命名</a>
											<a class="button fl">删除</a>
										</td>
									</tr>
									<tr>
										<td>
											<input type="checkbox" />
										</td>
										<td>
											<span class="icon excel"></span>分享文档.xls
										</td>
										<td>
											418.5MB
										</td>
										<td>
											管理员
										</td>
										<td>
											321次
										</td>
										<td>
											2012-05-19
										</td>
										<td class="share-op">
											<a class="button fl">下载</a>
											<a class="button fl">重命名</a>
											<a class="button fl">删除</a>
										</td>
									</tr>
									<tr>
										<td>
											<input type="checkbox" />
										</td>
										<td>
											<span class="icon excel"></span>分享文档.xls
										</td>
										<td>
											418.5MB
										</td>
										<td>
											管理员
										</td>
										<td>
											321次
										</td>
										<td>
											2012-05-19
										</td>
										<td class="share-op">
											<a class="button fl">下载</a>
											<a class="button fl">重命名</a>
											<a class="button fl">删除</a>
										</td>
									</tr>
									<tr>
										<td>
											<input type="checkbox" />
										</td>
										<td>
											<span class="icon excel"></span>分享文档.xls
										</td>
										<td>
											418.5MB
										</td>
										<td>
											管理员
										</td>
										<td>
											321次
										</td>
										<td>
											2012-05-19
										</td>
										<td class="share-op">
											<a class="button fl">下载</a>
											<a class="button fl">重命名</a>
											<a class="button fl">删除</a>
										</td>
									</tr>
									<tr>
										<td>
											<input type="checkbox" />
										</td>
										<td>
											<span class="icon excel"></span>分享文档.xls
										</td>
										<td>
											418.5MB
										</td>
										<td>
											管理员
										</td>
										<td>
											321次
										</td>
										<td>
											2012-05-19
										</td>
										<td class="share-op">
											<a class="button fl">下载</a>
											<a class="button fl">重命名</a>
											<a class="button fl">删除</a>
										</td>
									</tr>
									<tr>
										<td>
											<input type="checkbox" />
										</td>
										<td>
											<span class="icon excel"></span>分享文档.xls
										</td>
										<td>
											418.5MB
										</td>
										<td>
											管理员
										</td>
										<td>
											321次
										</td>
										<td>
											2012-05-19
										</td>
										<td class="share-op">
											<a class="button fl">下载</a>
											<a class="button fl">重命名</a>
											<a class="button fl">删除</a>
										</td>
									</tr>
								</tbody>
							</table>
							<div class="operation">
								<ul class="op-page clearfix">
									<li class="fl">
										<a class="button">上一页</a>
									</li>
									<li class="fl">
										<a class="button" href="resource.html?page=1">1</a>
									</li>
									<li class="fl">
										<a class="button">2</a>
									</li>
									<li class="fl">
										<a class="button">3</a>
									</li>
									<li class="fl">
										<a class="button">下一页</a>
									</li>
								</ul>
							</div>
						</div>
						<div class="tab-content tab-2 hidden">
							<h2>
								应用程序
							</h2>
						</div>
						<div class="tab-content tab-3 hidden">
							<h2>
								文档
							</h2>
						</div>
						<div class="tab-content tab-4 hidden">
							<!--h2>
								管理我的资源，显示已有资源[和所有中的显示方式一致]，上传新的资源
							</h2-->
							<div class="file-box">
								<form action="FileListAction" method="post" enctype="multipart/form-data">
									<input type='text' name='textfield' id='textfield' class='txt' />
									<input type='button' class='btn' value='浏览...' />
									<input type='hidden' class='btn' value='upload' />
									<input type="file" name="fileField" class="file" id="fileField"
										size="28"
										onchange="document.getElementById('textfield').value=$(this).val()" />
									<input type="submit" name="submit" class="btn" value="上传" />
								</form>
							</div>
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
				黑龙省MBA俱乐部
			</p>
		</div>
	</body>
	<script type="text/javascript" src="<%=basePath%>js/jquery-1.6.4.min.js">
	
</script>
	<script type="text/javascript" src="<%=basePath%>js/resource.js">
	
</script>
</html>
