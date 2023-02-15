<%--
  Created by IntelliJ IDEA.
  User: xingj
  Date: 2023/2/15
  Time: 9:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String contextPath = request.getContextPath();
    String base = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + contextPath;
    request.setAttribute("base", base);
%>

<html>
<head>
    <title>课程信息显示</title>
    <link rel="stylesheet" href="${base}/css/bootstrap.css">
    <link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
    <script src="${base}/js/bootstrap.js"></script>
</head>
<body>
<div class="container">
    <div class="row">
        <%--导航条--%>
        <nav class="navbar navbar-default col-lg-12">
            <div class="container-fluid">
                <p class="navbar-text">教务信息管理系统(管理员)</p>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                               aria-haspopup="true"
                               aria-expanded="false"><i class="fa-solid fa-user"></i>${current.username}<span
                                    class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="${pageContext.request.contextPath}/logout">退出登录</a></li>
                            </ul>
                        </li>
                    </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>
    </div>

    <div class="row">
        <%--侧边导航--%>
        <div class="col-lg-2">
            <ul class="nav nav-pills nav-stacked">

                <li class="active"><a href="${pageContext.request.contextPath}/admin/showCourse">课程管理<span
                        class="badge pull-right">8</span></a></li>
                <li><a href="${pageContext.request.contextPath}/admin/showStudent">学生管理<span
                        class="badge pull-right">8</span></a></li>
                <li><a href="${pageContext.request.contextPath}/admin/showTeacher">教师管理<span
                        class="badge pull-right">8</span></a></li>
                <li><a href="#">重置账号密码<i class="fa-solid fa-rotate-right pull-right"></i></a></li>
                <li><a href="#">修改密码<i class="fa-solid fa-pen-to-square pull-right"></i></a></li>
                <li><a href="${pageContext.request.contextPath}/logout">退出系统<i
                        class="fa-solid fa-arrow-right-from-bracket pull-right"></i></a></li>
            </ul>
        </div>

        <%--正文/表格--%>
        <div class="col-lg-10">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <p style="font-weight: bold; font-size: xx-large; text-align: center">重置其他用户密码</p>
                </div>
                <div class="panel-body">
                    <%--表单--%>
                    <form class="form-horizontal" method="post" action="">
                        <div class="form-group">
                            <label for="username" class="col-sm-2 control-label">账号(非管理员账号)</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="username" name="username"
                                       placeholder="请输入用户名">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="password" class="col-sm-2 control-label">密码</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" id="password" name="password"
                                       placeholder="请输入密码">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="passwordRepeat" class="col-sm-2 control-label">确认密码</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" id="passwordRepeat"
                                       placeholder="请再次输入密码">
                            </div>
                        </div>
                        <div style="width: 200px; margin: 0 auto">
                            <input type="submit" class="btn btn-default">
                            <input type="reset" value="重置" class="btn btn-default">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>