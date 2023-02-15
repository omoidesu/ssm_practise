<%--
  Created by IntelliJ IDEA.
  User: xingj
  Date: 2023/2/15
  Time: 9:06
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
                    <p style="font-weight: bold; font-size: xx-large; text-align: center">添加学生信息</p>
                </div>
                <div class="panel-body">
                    <%--表单--%>
                    <form class="form-horizontal" method="post" action="">
                        <div class="form-group">
                            <label for="studentId" class="col-sm-2 control-label">学号</label>
                            <div class="col-sm-10">
                                <input type="number" class="form-control" id="studentId" name="studentId"
                                       placeholder="请输入学号">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="studentName" class="col-sm-2 control-label">姓名</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="studentName" name="studentName"
                                       placeholder="请输入姓名">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">性别</label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
                                    <input type="radio" name="studentGender" id="inlineRadio1" value="1"> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="studentGender" id="inlineRadio2" value="2"> 女
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="studentBirthday" class="col-sm-2 control-label">出生年份</label>
                            <div class="col-sm-10">
                                <input type="date" class="form-control" id="studentBirthday" name="studentBirthday">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="studentRegister" class="col-sm-2 control-label">入学时间</label>
                            <div class="col-sm-10">
                                <input type="date" class="form-control" id="studentRegister" name="studentRegister">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="studentBelong" class="col-sm-2 control-label">所属院系</label>
                            <div class="col-sm-10">
                                <select class="form-control" id="studentBelong" name="studentBelong">
                                    <option value="1">计算机系</option>
                                </select>
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