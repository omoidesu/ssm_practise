<%--
  Created by IntelliJ IDEA.
  User: xingj
  Date: 2023/2/14
  Time: 12:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>

<%
    String contextPath = request.getContextPath();
    String base = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + contextPath;
    request.setAttribute("base", base);
%>

<html>
<head>
    <title>用户登录</title>
    <link rel="stylesheet" href="${base}/css/bootstrap.css">
    <link rel="stylesheet" href="${base}/css/login.css">
    <script src="${base}/js/bootstrap.js"></script>
</head>
<body>
<div class="container">
    <div class="form row">
        <form class="form-horizontal col-sm-offset-3 col-md-offset-3" method="post" action="/user">
            <h3 class="form-title">登录</h3>
            <div class="col-sm-9 col-md-9">
                <!-- 用户名图标和用户名输入框 -->
                <div class="form-group">
                    <i class="fa fa-user" aria-hidden="true"></i>
                    <input class="form-control" type="text" name="username" id="username" placeholder="请输入用户名"
                           required autofocus>
                </div>
                <!-- 密码图标和密码输入框 -->
                <div class="form-group">
                    <i class="fa fa-key" aria-hidden="true"></i>
                    <input class="form-control " type="password" name="password" id="password" placeholder="请输入密码"
                           required>
                </div>
                <!-- 登录按钮 -->
                <div class="form-group">
                    <input type="submit" value="登录" class="btn btn-success pull-right">
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>
