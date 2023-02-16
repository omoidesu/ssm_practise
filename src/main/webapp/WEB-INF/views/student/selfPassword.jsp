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
                <p class="navbar-text">教务信息管理系统(教师)</p>

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
                <li><a href="${pageContext.request.contextPath}/student/showCourse">课程管理<span
                        class="badge pull-right" id="courseCount"></span></a></li>
                <li><a href="${pageContext.request.contextPath}/student/selectedCourse">已选课程<span
                        class="badge pull-right" id="selectedCourse"></span></a></li>
                <li><a href="${pageContext.request.contextPath}/student/completeCourse">已修课程<span
                        class="badge pull-right" id="completeCourse"></span></a></li>
                <li class="active"><a href="${pageContext.request.contextPath}/student/changePassword">修改密码<i
                        class="fa-solid fa-pen-to-square pull-right"></i></a></li>
                <li><a href="${pageContext.request.contextPath}/logout">退出系统<i
                        class="fa-solid fa-arrow-right-from-bracket pull-right"></i></a></li>
            </ul>
        </div>

        <%--正文/表格--%>
        <div class="col-lg-10">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <p style="font-weight: bold; font-size: xx-large; text-align: center">重置密码</p>
                </div>
                <div class="panel-body">
                    <%--表单--%>
                    <form class="form-horizontal" method="post"
                          action="${pageContext.request.contextPath}/student/password">
                        <div class="form-group">
                            <label for="oldPassword" class="col-sm-2 control-label">旧密码</label>
                            <div class="col-sm-8">
                                <input type="password" class="form-control" id="oldPassword"
                                       placeholder="请输入旧密码">
                            </div>
                            <div class="col-sm-2 control-label pull-left" id="oldPasswordHint"></div>
                        </div>
                        <div class="form-group">
                            <label for="password" class="col-sm-2 control-label">新密码</label>
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
    })

    let oldPassword = "${current.password}"

    let oldPasswordInput = $("#oldPassword")
    let passwordInput = $("#password")
    let passwordRepeatInput = $("#repeatPassword")

    let oldPasswordHint = $("#oldPasswordHint")
    let passwordHint = $("#passwordHint")
    let passwordRepeatHint = $("#repeatHint")

    let oldPasswordFlag, passwordFlag, repeatFlag = false

    let submitBtn = $("#submitBtn")

    oldPasswordInput.blur(function () {
        if (oldPasswordInput.val() === "" || oldPasswordInput.val() == null) {
            oldPasswordHint.text("❌请输入旧密码").css("color", "red")
            oldPasswordFlag = false
            changeSubmitBtnEnable()
            return null;
        }

        if (oldPasswordInput.val() === oldPassword) {
            oldPasswordHint.text("✅密码正确").css("color", "green")
            oldPasswordFlag = true
            changeSubmitBtnEnable()
        } else {
            oldPasswordHint.text("❌密码错误").css("color", "red")
            oldPasswordFlag = false
            changeSubmitBtnEnable()
        }
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
        if (oldPasswordFlag && passwordFlag && repeatFlag) {
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

    function getNumbers() {
        $.get("/course", null, function (result) {
            $("#courseCount").text(result.length)
        })

        $.get("/student/selected", {studentId: ${current.username}}, function (result) {
            $("#selectedCourse").text(result.length)
        })

        $.get("/student/selected", {studentId: ${current.username}, complete: "true"}, function (result) {
            $("#completeCourse").text(result.length)
        })
    }
</script>
</html>