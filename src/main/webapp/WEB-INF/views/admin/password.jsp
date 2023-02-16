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
    <meta charset="UTF-8">
    <title>课程信息显示</title>
    <link rel="stylesheet" href="${base}/css/bootstrap.css">
    <link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
    <script src="${base}/js/jquery-3.5.1.js"></script>
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
        <div class="alert alert-warning alert-dismissible fade in" role="alert" id="message">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                    aria-hidden="true">&times;</span></button>
            <span id="text">修改密码成功</span>
        </div>
    </div>

    <div class="row">
        <%--侧边导航--%>
        <div class="col-lg-2">
            <ul class="nav nav-pills nav-stacked">

                <li><a href="${pageContext.request.contextPath}/admin/showCourse">课程管理<span
                        class="badge pull-right" id="courseCount"></span></a></li>
                <li><a href="${pageContext.request.contextPath}/admin/showStudent">学生管理<span
                        class="badge pull-right" id="studentCount"></span></a></li>
                <li><a href="${pageContext.request.contextPath}/admin/showTeacher">教师管理<span
                        class="badge pull-right" id="teacherCount"></span></a></li>
                <li class="active"><a href="${pageContext.request.contextPath}/admin/changeOther">重置账号密码<i
                        class="fa-solid fa-rotate-right pull-right"></i></a></li>
                <li><a href="${pageContext.request.contextPath}/admin/changePassword">修改密码<i
                        class="fa-solid fa-pen-to-square pull-right"></i></a></li>
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
                    <form class="form-horizontal" method="post"
                          action="${pageContext.request.contextPath}/admin/password">
                        <div class="form-group">
                            <label for="username" class="col-sm-2 control-label">账号(非管理员账号)</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="username" name="username"
                                       placeholder="请输入用户名">
                            </div>
                            <div class="col-sm-2 control-label pull-left" id="usernameHint"></div>
                        </div>
                        <div class="form-group">
                            <label for="password" class="col-sm-2 control-label">密码</label>
                            <div class="col-sm-8">
                                <input type="password" class="form-control" id="password" name="password"
                                       placeholder="请输入密码 (至少6位,包含小写字母,大写字母,特殊字符)">
                            </div>
                            <div class="col-sm-2 control-label" id="passwordHint"></div>
                        </div>
                        <div class="form-group">
                            <label for="repeatPassword" class="col-sm-2 control-label">确认密码</label>
                            <div class="col-sm-8">
                                <input type="password" class="form-control" id="repeatPassword"
                                       placeholder="请再次输入密码">
                            </div>
                            <div class="col-sm-2 control-label" id="repeatHint"></div>
                        </div>
                        <div style="width: 200px; margin: 0 auto">
                            <input type="submit" class="btn btn-default" disabled id="submitBtn">
                            <input type="reset" value="重置" class="btn btn-default">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    $(function () {
        getNumbers()
        showMessage()
    })

    let usernameInput = $("#username")
    let passwordInput = $("#password")
    let passwordRepeatInput = $("#repeatPassword")

    let usernameHint = $("#usernameHint")
    let passwordHint = $("#passwordHint")
    let passwordRepeatHint = $("#repeatHint")

    let usernameFlag, passwordFlag, repeatFlag = false

    let submitBtn = $("#submitBtn")

    usernameInput.blur(function () {
        if (usernameInput.val() === "" || usernameInput.val() == null) {
            usernameHint.text("请输入用户名").css("color", "red")
            usernameFlag = false
            changeSubmitBtnEnable()
            return null
        }

        $.get("/admin/user", {"username": usernameInput.val()}, function (result) {
            if (result.code === 1 && result.data === "exist") {
                usernameHint.text("⭕该用户存在").css("color", "green")
                usernameFlag = true
                changeSubmitBtnEnable()
            } else if (result.code === 1 && result.data === "not exist") {
                usernameHint.text("❌该用户不存在").css("color", "red")
                usernameFlag = false
                changeSubmitBtnEnable()
            }
        })
    })

    passwordInput.blur(function () {
        if (passwordInput.val() === "" || passwordInput.val() == null) {
            passwordHint.text("❌请输入密码").css("color", "red")
            passwordFlag = false
            changeSubmitBtnEnable()
            return null
        }

        let number = checkPwd(passwordInput.val());
        if (number <= 1) {
            passwordHint.text("❌密码不合格").css("color", "red")
            passwordFlag = false
            changeSubmitBtnEnable()
        } else if (number <= 3) {
            passwordHint.text("密码强度: 弱").css("color", "red")
            passwordFlag = true
            changeSubmitBtnEnable()
        } else if (number <= 5) {
            passwordHint.text("密码强度: 中").css("color", "orange")
            passwordFlag = true
            changeSubmitBtnEnable()
        } else {
            passwordHint.text("密码强度: 强").css("color", "green")
            passwordFlag = true
            changeSubmitBtnEnable()
        }
    })

    passwordRepeatInput.blur(function () {
        if (passwordRepeatInput.val() === "" || passwordRepeatInput.val() == null) {
            passwordRepeatHint.text("❌请再次输入密码").css("color", "red")
            repeatFlag = false
            changeSubmitBtnEnable()
            return null;
        }

        if (passwordInput.val() === passwordRepeatInput.val()) {
            passwordRepeatHint.text("✅密码一致")
            repeatFlag = true
            changeSubmitBtnEnable()
        } else {
            passwordRepeatHint.text("❌密码不一致").css("color", "red")
            repeatFlag = false
            changeSubmitBtnEnable()
        }
    })

    function changeSubmitBtnEnable() {
        if (usernameFlag && passwordFlag && repeatFlag) {
            submitBtn.attr("disabled", false)
        } else {
            submitBtn.attr("disabled", true)
        }
    }

    function checkPwd(val) {
        // 作者：小格调梦
        // 链接：https://www.jianshu.com/p/94c8f45d97e3
        let res = 0;

        if (val.length < 6) {
            return 0;
        }

        // 长度不低于6位和12位，强度分别+1和+2
        res = val.length >= 6 ? 1 : 0;
        res = val.length >= 12 ? 2 : res;

        // 包含小写字母，强度+1或+2
        res += /[a-z]/.test(val) ? (val.length < 8 || /\d{4}/.test(val) ? 1 : 2) : 0;

        // 包含大写字母，强度+1或+2
        res += /[A-Z]/.test(val) ? (val.length < 8 || /\d{4}/.test(val) ? 1 : 2) : 0;

        // 包含特殊字符，强度+1或+2
        res += /[^a-zA-Z\s\d]/.test(val) ? (val.length < 8 || /\d{4}/.test(val) ? 1 : 2) : 0;

        return res;
    }

    function showMessage() {
        let messageAlerts = $("#message")
        if ('${message}'.length === 0) {
            messageAlerts.css("display", "none")
            return null;
        }

        let message = JSON.parse('${message}')
        console.log(message)
        if (message.msg === "success") {
            $("#text").text("密码修改成功")
        } else {
            $("#text").text("密码修改失败")
        }

        messageAlerts.alert()
    }

    function getNumbers() {
        $.get("/course", null, function (result) {
            $("#courseCount").text(result.length)
        })

        $.get("/student", null, function (result) {
            $("#studentCount").text(result.length)
        })

        $.get("/teacher", null, function (result) {
            $("#teacherCount").text(result.length)
        })
    }
</script>
</html>