<%--
  Created by IntelliJ IDEA.
  User: xingj
  Date: 2023/2/15
  Time: 9:16
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
        <%--侧边导航--%>
        <div class="col-lg-2">
            <ul class="nav nav-pills nav-stacked">

                <li><a href="${pageContext.request.contextPath}/admin/showCourse">课程管理<span
                        class="badge pull-right" id="courseCount"></span></a></li>
                <li><a href="${pageContext.request.contextPath}/admin/showStudent">学生管理<span
                        class="badge pull-right" id="studentCount"></span></a></li>
                <li class="active"><a href="${pageContext.request.contextPath}/admin/showTeacher">教师管理<span
                        class="badge pull-right" id="teacherCount"></span></a></li>
                <li><a href="${pageContext.request.contextPath}/admin/changeOther">重置账号密码<i class="fa-solid fa-rotate-right pull-right"></i></a></li>
                <li><a href="${pageContext.request.contextPath}/admin/changePassword">修改密码<i class="fa-solid fa-pen-to-square pull-right"></i></a></li>
                <li><a href="${pageContext.request.contextPath}/logout">退出系统<i
                        class="fa-solid fa-arrow-right-from-bracket pull-right"></i></a></li>
            </ul>
        </div>

        <%--正文/表格--%>
        <div class="col-lg-10">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <p style="font-weight: bold; font-size: xx-large; text-align: center">添加教师信息</p>
                </div>
                <div class="panel-body">
                    <%--表单--%>
                    <form class="form-horizontal" method="post"
                          action="${pageContext.request.contextPath}/admin/teacher">
                        <div class="form-group">
                            <label for="teacherId" class="col-sm-2 control-label">工号</label>
                            <div class="col-sm-10">
                                <c:choose>
                                    <c:when test="${teacher == null}">
                                        <input type="number" class="form-control" id="teacherId" name="teacherId"
                                               placeholder="请输入工号">
                                    </c:when>
                                    <c:otherwise>
                                        <input type="number" class="form-control" id="teacherId" name="teacherId"
                                               value="${teacher.teacherId}" readonly>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="teacherName" class="col-sm-2 control-label">姓名</label>
                            <div class="col-sm-10">
                                <c:choose>
                                    <c:when test="${teacher == null}">
                                        <input type="text" class="form-control" id="teacherName" name="teacherName"
                                               placeholder="请输入姓名">
                                    </c:when>
                                    <c:otherwise>
                                        <input type="text" class="form-control" id="teacherName" name="teacherName"
                                               placeholder="请输入姓名" value="${teacher.teacherName}">
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">性别</label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
                                    <input type="radio" name="teacherGender" id="male" value="1"> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="teacherGender" id="female" value="2"> 女
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="teacherBirthday" class="col-sm-2 control-label">出生年份</label>
                            <div class="col-sm-10">
                                <c:choose>
                                    <c:when test="${teacher == null}">
                                        <input type="date" class="form-control" id="teacherBirthday"
                                               name="teacherBirthday">
                                    </c:when>
                                    <c:otherwise>
                                        <input type="date" class="form-control" id="teacherBirthday"
                                               name="teacherBirthday" value="${teacher.teacherBirthday}">
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="teacherEducation" class="col-sm-2 control-label">学历</label>
                            <div class="col-sm-10">
                                <select class="form-control" id="teacherEducation" name="teacherEducation">
                                    <option value="本科">本科</option>
                                    <option value="硕士">硕士</option>
                                    <option value="博士">博士</option>
                                    <option value="专科">专科</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="teacherRank" class="col-sm-2 control-label">职称</label>
                            <div class="col-sm-10">
                                <select class="form-control" id="teacherRank" name="teacherRank">
                                    <option value="普通教师">普通教师</option>
                                    <option value="助教">助教</option>
                                    <option value="讲师">讲师</option>
                                    <option value="副教授">副教授</option>
                                    <option value="教授">教授</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="teacherRegister" class="col-sm-2 control-label">入职时间</label>
                            <div class="col-sm-10">
                                <c:choose>
                                    <c:when test="${teacher == null}">
                                        <input type="date" class="form-control" id="teacherRegister"
                                               name="teacherRegister">
                                    </c:when>
                                    <c:otherwise>
                                        <input type="date" class="form-control" id="teacherRegister"
                                               name="teacherRegister" value="${teacher.teacherRegister}">
                                    </c:otherwise>
                                </c:choose>

                            </div>
                        </div>
                        <div class="form-group">
                            <label for="teacherBelong" class="col-sm-2 control-label">所属院系</label>
                            <div class="col-sm-10">
                                <select class="form-control" id="teacherBelong" name="teacherBelong">

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
<script>
    $(function () {
        getAcademies()
        changeDefaultSelect()
        getNumbers()
    })

    function getAcademies() {
        let academySelect = $("#teacherBelong")

        $.get("/academy", null, function (result) {
            for (data of result) {
                academySelect.append(`<option value='\${data.academyId}'>\${data.academyName}</option>`)
            }
        })
    }

    function changeDefaultSelect() {
        let teacherId = $("#teacherId").val()
        if (teacherId != null) {
            $.get("/teacher/" + teacherId, null, function (result) {
                if (result.teacherGender === "男") {
                    $("#male").attr("checked", true)
                } else if (result.teacherGender === "女") {
                    $("#female").attr("checked", true)
                }
                $("#teacherEducation").val(result.teacherEducation)
                $("#teacherRank").val(result.teacherRank)
                $("#teacherBelong").val(result.teacherBelong)
            })
        }
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
