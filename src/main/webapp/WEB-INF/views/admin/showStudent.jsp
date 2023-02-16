<%--
  Created by IntelliJ IDEA.
  User: xingj
  Date: 2023/2/14
  Time: 21:35
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
                <li class="active"><a href="#">学生管理<span class="badge pull-right" id="studentCount"></span></a></li>
                <li><a href="${pageContext.request.contextPath}/admin/showTeacher">教师管理<span
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
                    <div style="display: inline-block; font-weight: normal; font-size: xxx-large">学生名单管理</div>
                    <div class="btn-toolbar pull-right" role="toolbar"
                         style="display: inline-block; margin: 0; padding: 20px">
                        <div class="btn-group" role="group">
                            <div class="input-group" style="display: inline-block; width: 300px">
                                <input type="text" class="form-control" placeholder="请输入学生姓名"
                                       style="width: 240px" id="search">
                                <span class="input-group-btn" style="margin: 0; padding: 0"><button
                                        class="btn btn-default"
                                        type="button" id="searchBtn">搜索</button></span>
                            </div>
                        </div>
                        <div class="btn-group" role="group">
                            <a class="btn btn-default" href="${pageContext.request.contextPath}/admin/addStudent">添加学生信息<i class="fa-solid fa-plus"></i></a>
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
            url: "/student",
            method: "get",
            queryParams: function () {
                return {
                    name: $("#search").val(),
                }
            },
            sidePagination: "client",
            pagination: true,
            pageNumber: 1,
            pageSize: 5,
            pageList: [5, 10, 25],
            height: 450,
            paginationLoop: false,
            uniqueId: "courseId",
            columns: [
                {field: "studentId", title: "学号", sortable: true},
                {field: "studentName", title: "姓名"},
                {field: "studentGender", title: "性别"},
                {field: "studentBirthday", title: "出生年份"},
                {field: "studentRegister", title: "入学时间"},
                {field: "studentBelong", title: "学院", sortable: true},
                {field: "studentId", title: "操作", formatter: operate},
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
        return "<a class='btn btn-primary' href='/admin/student/" + value + "'>修改</a>&nbsp;&nbsp;<button class='btn btn-danger' onclick=del(" + value + ")>删除</button>"
    }

    function del(id) {
        $.ajax({
            url: "/admin/student?studentId=" + id,
            type: "delete",
            success: function (result) {
                console.log(result.msg)
                refreshTable()
            },
            error: function () {
                alert("请求失败")
            }
        })
    }

    function getNumbers(){
        $.get("/course", null, function (result){
            $("#courseCount").text(result.length)
        })

        $.get("/student", null, function (result){
            $("#studentCount").text(result.length)
        })

        $.get("/teacher", null, function (result){
            $("#teacherCount").text(result.length)
        })
    }
</script>
</html>
