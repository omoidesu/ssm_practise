<%--
  Created by IntelliJ IDEA.
  User: xingj
  Date: 2023/2/15
  Time: 20:38
  To change this template use File | Settings | File Templates.
--%>
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
                <li class="active"><a href="${pageContext.request.contextPath}/teacher/showCourse">课程管理<span
                        class="badge pull-right" id="courseCount"></span></a></li>
                <li><a href="${pageContext.request.contextPath}/teacher/changePassword">修改密码<i
                        class="fa-solid fa-pen-to-square pull-right"></i></a></li>
                <li><a href="${pageContext.request.contextPath}/logout">退出系统<i
                        class="fa-solid fa-arrow-right-from-bracket pull-right"></i></a></li>
            </ul>
        </div>

        <%--正文/表格--%>
        <div class="col-lg-10">
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/teacher/showCourse">我教授的课程</a></li>
                <li class="active">学生名单</li>
            </ol>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div style="display: inline-block; font-weight: normal; font-size: xxx-large"><span
                            id="courseName"></span> 学生名单
                    </div>
                </div>
                <div class="panel-body">
                    <%--表格--%>
                    <table id="table"></table>
                </div>
            </div>
        </div>

        <div class="modal fade" tabindex="-1" role="dialog" id="scoreDetail">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span>
                        </button>
                        <h3 class="modal-title" style="text-align: center">学生打分</h3>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal">
                            <div class="form-group">
                                <label for="studentId" class="col-sm-2 control-label">学号</label>
                                <div class="col-sm-10">
                                    <input type="number" class="form-control" id="studentId" disabled>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="studentName" class="col-sm-2 control-label">姓名</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="studentName" disabled>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="studentScore" class="col-sm-2 control-label">成绩</label>
                                <div class="col-sm-10">
                                    <input type="number" class="form-control" id="studentScore" min="0" max="100"
                                           placeholder="请输入课程名称">
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" id="reset">重置</button>
                        <button type="button" class="btn btn-default" id="submit">提交</button>
                        <button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
    </div>
</div>
</body>
<script>
    let courseId = ${course}

        $(function () {
            $("#table").bootstrapTable({
                url: "/teacher/course/students",
                method: "get",
                queryParams: function () {
                    return {
                        courseId: courseId
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
                    {field: "studentId", title: "学号"},
                    {field: "studentName", title: "姓名"},
                    {field: "score", title: "分数"},
                    {field: "studentId", title: "操作", formatter: operate},
                ]
            })

            getNumbers();
        })

    function refreshTable() {
        $("#table").bootstrapTable("refresh")
    }

    function operate(_, row, _) {
        if (row.score === "未打分") {
            return "<button class='btn btn-primary' onclick='detail(" + JSON.stringify(row) + ")'>打分</button>"
        } else {
            return "<button class='btn btn-primary' disabled>已打分</button>"
        }
    }

    function detail(str) {
        if (str) {
            $("#studentId").attr("value", str.studentId)
            $("#studentName").attr("value", str.studentName)
        }
        $("#scoreDetail").modal("show")
    }

    $("#reset").click(function () {
        $("#studentScore").val("")
    })

    $("#submit").click(function () {
        let obj = {
            courseId: courseId,
            studentId: $("#studentId").val(),
            studentName: $("#studentName").val(),
            score: $("#studentScore").val(),
        }
        $.ajax({
            url: "/teacher/score",
            type: "post",
            contentType: "application/json",
            data: JSON.stringify(obj),
            success: function (result) {
                if (result.code === 1) {
                    $("#scoreDetail").modal("hide")
                    refreshTable()
                } else if (result.code === 0) {
                    $("#scoreDetail").modal("hide")
                    alert(result.msg)
                }
            }
        })
    })

    function getNumbers() {
        $.get("/course", {teacher: ${current.username}}, function (result) {
            $("#courseCount").text(result.length)
            for (item of result){
                if (item.courseId == courseId){
                    $("#courseName").text(item.courseName)
                    return null;
                }
            }
        })
    }
</script>
</html>
