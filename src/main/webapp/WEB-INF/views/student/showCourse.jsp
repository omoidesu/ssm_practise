<%--
  Created by IntelliJ IDEA.
  User: xingj
  Date: 2023/2/15
  Time: 20:38
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
    <link rel="stylesheet" href="${base}/css/bootstrap-table.css">
    <link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
    <script src="${base}/js/jquery-3.5.1.js"></script>
    <script src="${base}/js/bootstrap.js"></script>
    <script src="${base}/js/bootstrap-table.js"></script>
</head>
<body>
<div class="container">
    <div class="row">
        <%--导航条--%>
        <nav class="navbar navbar-default col-lg-12">
            <div class="container-fluid">
                <p class="navbar-text">教务信息查询系统(学生)</p>

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
                <li class="active"><a href="${pageContext.request.contextPath}/student/showCourse">课程管理<span
                        class="badge pull-right" id="courseCount"></span></a></li>
                <li><a href="${pageContext.request.contextPath}/student/selectedCourse">已选课程<span
                        class="badge pull-right" id="selectedCourse"></span></a></li>
                <li><a href="${pageContext.request.contextPath}/student/completeCourse">已修课程<span
                        class="badge pull-right" id="completeCourse"></span></a></li>
                <li><a href="${pageContext.request.contextPath}/student/changePassword">修改密码<i
                        class="fa-solid fa-pen-to-square pull-right"></i></a></li>
                <li><a href="${pageContext.request.contextPath}/logout">退出系统<i
                        class="fa-solid fa-arrow-right-from-bracket pull-right"></i></a></li>
            </ul>
        </div>

        <%--正文/表格--%>
        <div class="col-lg-10">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div style="display: inline-block; font-weight: normal; font-size: xxx-large">课程列表
                    </div>
                    <div class="btn-toolbar pull-right" role="toolbar"
                         style="display: inline-block; margin: 0; padding: 20px">
                        <div class="btn-group" role="group">
                            <div class="input-group" style="display: inline-block; width: 300px">
                                <input id="search" type="text" class="form-control" placeholder="请输入课程名称"
                                       style="width: 240px">
                                <span class="input-group-btn" style="margin: 0; padding: 0"><button
                                        class="btn btn-default" type="button" id="searchBtn">搜索</button></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel-body">
                    <%--表格--%>
                    <table id="table"></table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    $(function () {
        $("#table").bootstrapTable({
            url: "/student/course",
            queryParams: function () {
                return {
                    studentId: ${current.username},
                    courseName: $("#search").val()
                }
            },
            method: "get",
            sidePagination: "client",
            pagination: true,
            pageNumber: 1,
            pageSize: 5,
            pageList: [5, 10, 25],
            height: 450,
            paginationLoop: false,
            uniqueId: "courseId",
            columns: [
                {field: "courseId", title: "课程号", sortable: true},
                {field: "courseName", title: "课程名称"},
                {field: "teacherName", title: "授课老师"},
                {field: "courseDate", title: "上课时间"},
                {field: "courseAddress", title: "上课地点"},
                {field: "courseTimes", title: "周数", sortable: true},
                {field: "courseType", title: "课程类型", sortable: true},
                {field: "coursePoint", title: "学分", sortable: true},
                {field: "courseId", title: "操作", formatter: operate},
            ]
        })

        getNumbers();
    })

    function refreshTable() {
        $("#table").bootstrapTable("refresh")
    }

    $("#searchBtn").click(refreshTable)

    let searchInput = $("#search")
    searchInput.blur(function () {
        if (searchInput.val() == null || searchInput.val() === "") {
            refreshTable()
        }
    })

    function operate(value, row, _) {
        if (row.selected === "0") {
            return "<button class='btn btn-primary' onclick='signUp(" + value + ")' id='course" + value + "'>选课</button>"
        }
        return "<button class='btn btn-primary' disabled>已选择</button>"
    }

    function signUp(courseId) {
        $.ajax({
            url: "/student/course?courseId=" + courseId + "&studentId=" + ${current.username},
            type: "put",
            success: function (result) {
                if (result.code === 1) {
                    refreshTable()
                    getNumbers()
                }
            }
        })
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
