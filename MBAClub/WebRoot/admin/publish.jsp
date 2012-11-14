<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>内容管理页面</title>
        <link type="text/css" rel="stylesheet" href="<%=basePath%>css/base.css">
        <link type="text/css" rel="stylesheet" href="<%=basePath%>css/common.css">
        <link type="text/css" rel="stylesheet" href="<%=basePath%>css/page.css">
        <link type="text/css" rel="stylesheet" href="<%=basePath%>css/publish.css">
    </head>
    <body>
        <div class="header wrapper clearfix">
            <div class="logo">
            </div>
            <div class="logo-word">
            </div>
            <div class="site-nav">
                <ul class="clearfix">
                    <li class="site-nav-item">
                        <a href="introduction.html">俱乐部介绍</a>
                    </li>
                    <li class="site-nav-item">
                        |
                    </li>
                    <li class="site-nav-item">
                        <a href="milestone.html">俱乐部大事记</a>
                    </li>
                    <li class="site-nav-item">
                        |
                    </li>
                    <li class="site-nav-item">
                        <a href="register.html">成为会员</a>
                    </li>
                    <li class="site-nav-item">
                        |
                    </li>
                    <li class="site-nav-item">
                        <a href="login.html">会员登陆</a>
                    </li>
                    <li class="site-nav-item">
                        |
                    </li>
                    <li class="site-nav-item">
                        <a>联络我们</a>
                    </li>
                    <li class="site-nav-item">
                        |
                    </li>
                    <li class="site-nav-item">
                        <a>基金会</a>
                    </li>
                    <li class="site-nav-item">
                        |
                    </li>
                    <li class="site-nav-item">
                        <a href="resource.html">资源共享</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="page-nav wrapper">
            <ul class="clearfix">
                <li class="fl">
                    <span class="c-999">当前位置：</span>
                </li>
                <li class="fl">
                    <a href="index.html">首页</a>
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
                    <a>活动发布</a>
                </li>
            </ul>
        </div>
        <div class="content wrapper clearfix">
            <div class="main">
                <div class="title userinput-wrapper">
                    <label>
                        标题
                    </label>
                    <input type="text" name="title" class="userinput"/>
                </div>
                <div class="tags userinput-wrapper clearfix">
                    <label>
                        标签<span class="c-999">[用英文分号分开]</span>
                    </label>
                    <input type="text" name="tag" id="tag" class="userinput fl" title="用;分开"/>
                    <div class="fl tags-result clearfix">
                        <!--span class="tag-item fl mr-6 button">tag1<a class="close hidden" title="删除">x</a></span>
                        <span class="tag-item fl mr-6 button">tag2<a class="close hidden" title="删除">x</a></span-->
                    </div>
                </div>
                <div class="thumb">
                    <input type="checkbox" value="使用缩略图" name="thumb-check" class="switch">使用缩略图
                    </input>
					<a class="switchThumbType" type=0>切换格式</a>
                    <div class="fileupload hidden">
                        <script type="text/javascript">
                            function callbackThumb(msg, url){
                                document.getElementById("file").outerHTML = document.getElementById("file").outerHTML;
                                document.getElementById("msg1").innerHTML = msg;
                                document.getElementById("thumb").src = url;
                            }
                        </script>
                        <img id="thumb" border="1" width="120" height="80" type=0>
                        <br>
                        <form action="ajax/upload-thumb.php" id="form1" name="form1" encType="multipart/form-data" method="post" target="hidden_frame">
                            <input type="file" id="file" name="file" style="width:450"><INPUT type="submit" value="上传文件" class="g-button-submit g-button"><span id="msg1"></span>
                            <br>
                            <font color="red">
                                支持JPG,JPEG,GIF,BMP,PNG文件的上传
                            </font>
                            <iframe name='hidden_frame' id="hidden_frame" style='display:none'>
                            </iframe>
                        </form>
                    </div>
                </div>
                <div class="image">
                    <input type="checkbox" value="使用附加图片" name="image-check" class="switch">使用附加图片
                    </input>
                    <div class="fileupload hidden">
                        <script type="text/javascript">
                            function callbackImage(msg, url){
                                document.getElementById("file").outerHTML = document.getElementById("file").outerHTML;
                                document.getElementById("msg2").innerHTML = msg;
                                document.getElementById("img").src = url;
                            }
                        </script>
                        <img id="img" border="1">
                        <br>
                        <form action="ajax/upload-image.php" id="form1" name="form1" encType="multipart/form-data" method="post" target="hidden_frame">
                            <input type="file" id="file" name="file" style="width:450"><INPUT type="submit" value="上传文件" class="g-button-submit g-button"><span id="msg2"></span>
                            <br>
                            <font color="red">
                                支持JPG,JPEG,GIF,BMP,PNG文件的上传
                            </font>
                            <iframe name='hidden_frame' id="hidden_frame" style='display:none'>
                            </iframe>
                        </form>
                        <div>
                            <span class="g-button-submit g-button imagesmore">继续添加</span>
                        </div>
                    </div>
                </div>
                <div class="userinfo">
                    <h2>用户信息输入区</h2>
                    <div>
                        <label>
                            姓名
                        </label>
                        <input type="text" name="username" class="userinput"/>
                    </div>
                    <div>
                        <label>
                            公司
                        </label>
                        <input type="text" name="usercompany" class="userinput"/>
                    </div>
                    <div>
                        <label>
                            毕业学校
                        </label>
                        <input type="text" name="userschool" class="userinput"/>
                    </div>
                    <div>
                        <label>
                            座右铭
                        </label>
                        <input type="text" name="usermotto" class="userinput"/>
                    </div>
                    <div>
                        <label>
                            个人主页
                        </label>
                        <input type="text" name="userpage" class="userinput"/>
                    </div>
                </div>
                <div class="companyinfo">
                    <h2>单位信息输入区</h2>
                    <div>
                        <label>
                            名称
                        </label>
                        <input type="text" name="companyname" class="userinput"/>
                    </div>
                    <div>
                        <label>
                            简介
                        </label>
                        <textarea rows=10 name="companyinfo"></textarea>
                    </div>
                    <div>
                        <label>
                            主页
                        </label>
                        <input type="text" name="companypage" class="userinput"/>
                    </div>
                    <div>
                        公司Logo请使用附加图片进行上传
                    </div>
                </div>
                <div class="editor">
                    内容编辑器
                </div>
				<span class="g-button-submit g-button" id="submit">提交</span>
            </div>
        </div>
        <div class="footer wrapper">
            <p class="c-999">
                黑ICP备1006889612 版权所有Copyright © 2012 All rights reserved.
            </p>
            <p class="c-999">
                黑龙省MBA
            </p>
        </div>
    </body>
    <script type="text/javascript" src="<%=basePath%>js/jquery-1.6.4.min.js">
    </script>
    <script type="text/javascript" src="<%=basePath%>js/publish.js">
    </script>
</html>

