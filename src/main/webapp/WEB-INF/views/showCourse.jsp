<%--
  Created by IntelliJ IDEA.
  User: xingj
  Date: 2023/2/14
  Time: 15:33
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
    <script src="${base}/js/bootstrap.js"></script>
    <script src="${base}/js/bootstrap-table.js"></script>
</head>
<body>
<div class="container">
    <div class="row">
        <%--导航条--%>
        <nav class="navbar navbar-default col-lg-12">
            <div class="container-fluid">
                <c:choose>
                    <c:when test="${current.role == 999}">
                        <p class="navbar-text">教务信息管理系统(管理员)</p>
                    </c:when>
                    <c:when test="${current.role == 2}">
                        <p class="navbar-text">教务信息查询系统(教师)</p>
                    </c:when>
                    <c:when test="${current.role == 1}">
                        <p class="navbar-text">教务信息查询系统(学生)</p>
                    </c:when>
                </c:choose>

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
                <c:choose>
                    <c:when test="${current.role == 999}">
                        <li class="active"><a href="#">课程管理<span class="badge pull-right">8</span></a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/showStudent">学生管理<span
                                class="badge pull-right">8</span></a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/showTeacher">教师管理<span
                                class="badge pull-right">8</span></a></li>
                        <li><a href="#">重置账号密码<i class="fa-solid fa-rotate-right pull-right"></i></a></li>
                    </c:when>
                    <c:when test="${current.role == 2}">
                        <li class="active"><a href="#">我的课程<span class="badge pull-right">8</span></a></li>
                    </c:when>
                    <c:when test="${current.role == 1}">
                        <li class="active"><a href="#">所有课程<span class="badge pull-right">8</span></a></li>
                        <li><a href="#">已选课程<span class="badge pull-right">8</span></a></li>
                        <li><a href="#">已修课程<span class="badge pull-right">8</span></a></li>
                    </c:when>
                </c:choose>
                <li><a href="#">修改密码<i class="fa-solid fa-pen-to-square pull-right"></i></a></li>
                <li><a href="${pageContext.request.contextPath}/logout">退出系统<i
                        class="fa-solid fa-arrow-right-from-bracket pull-right"></i></a></li>
            </ul>
        </div>

        <%--正文/表格--%>
        <div class="col-lg-10">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <c:choose>
                        <c:when test="${current.role == 999}">
                            <div style="display: inline-block; font-weight: normal; font-size: xxx-large">课程名单管理
                            </div>
                        </c:when>
                        <c:when test="${current.role == 2}">
                            <div style="display: inline-block; font-weight: normal; font-size: xxx-large">我教授的课程
                            </div>
                        </c:when>
                        <c:when test="${current.role == 1}">
                            <div style="display: inline-block; font-weight: normal; font-size: xxx-large">课程列表</div>
                        </c:when>
                    </c:choose>
                    <div class="btn-toolbar pull-right" role="toolbar"
                         style="display: inline-block; margin: 0; padding: 20px">
                        <div class="btn-group" role="group">
                            <div class="input-group" style="display: inline-block; width: 300px">
                                <input id="search" type="text" class="form-control" placeholder="请输入课程名称"
                                       style="width: 240px">
                                <span class="input-group-btn" style="margin: 0; padding: 0"><button
                                        class="btn btn-default"
                                        type="button">搜索</button></span>
                            </div>
                        </div>
                        <c:if test="${current.role == 999}">
                            <div class="btn-group" role="group">
                                <button type="button" class="btn btn-default">添加课程信息<i
                                        class="fa-solid fa-plus"></i>
                                </button>
                            </div>
                        </c:if>
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

<c:if test="${current.role == 999}">
    <%--模态框--%>
    <div class="modal fade" tabindex="-1" role="dialog" id="courseDetail">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title">修改课程</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" method="post" action="">
                        <div class="form-group">
                            <label for="courseId" class="col-sm-2 control-label">课程号</label>
                            <div class="col-sm-10">
                                <input type="number" class="form-control" id="courseId" name="courseId"
                                       placeholder="请输入课程号" disabled>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="courseName" class="col-sm-2 control-label">课程名称</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="courseName" name="courseName"
                                       placeholder="请输入课程名称">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="courseTeacher" class="col-sm-2 control-label">授课老师</label>
                            <div class="col-sm-10">
                                <select class="form-control" id="courseTeacher" name="teacherId">
                                    <option value="1">张老师</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="courseDate" class="col-sm-2 control-label">上课时间</label>
                            <div class="col-sm-10">
                                <select class="form-control" id="courseDate" name="courseDate">
                                    <option value="Monday">星期一</option>
                                    <option value="Tuesday">星期二</option>
                                    <option value="Wednesday">星期三</option>
                                    <option value="Thursday">星期四</option>
                                    <option value="Friday">星期五</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="courseAddress" class="col-sm-2 control-label">上课地点</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="courseAddress" name="courseAddress"
                                       placeholder="请输入上课地点">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="courseTimes" class="col-sm-2 control-label">周数</label>
                            <div class="col-sm-10">
                                <input type="number" class="form-control" id="courseTimes" name="courseTimes"
                                       placeholder="请输入周数">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="courseType" class="col-sm-2 control-label">课程类型</label>
                            <div class="col-sm-10">
                                <select class="form-control" id="courseType" name="courseType">
                                    <option value="1">必修课</option>
                                    <option value="0">选修课</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="courseBelong" class="col-sm-2 control-label">所属院系</label>
                            <div class="col-sm-10">
                                <select class="form-control" id="courseBelong" name="courseBelong">
                                    <option value="1">计算机系</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="coursePoint" class="col-sm-2 control-label">学分</label>
                            <div class="col-sm-10">
                                <input type="number" class="form-control" id="coursePoint" name="coursePoint"
                                       placeholder="请输入学分">
                            </div>
                        </div>
                        <div style="width: 200px; margin: 0 auto">
                            <input type="reset" value="重置" class="btn btn-default">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" onclick="formSubmit()">提交</button>
                    <button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->
</c:if>
</body>
<script>
    <c:choose>
    <c:when test="${current.role == 2}">
    let teacher = current.username
    </c:when>
    <c:otherwise>
    let teacher = 0
    </c:otherwise>
    </c:choose>


    $(function () {
        $("#table").bootstrapTable({
            url: "/course",
            method: "get",
            queryParams: function () {
                return {
                    name: $("#search").val(),
                    teacher: teacher
                }
            },
            sidePagination: "client",
            pagination: true,
            pageNumber: 1,
            pageSize: 5,
            height: 450,
            paginationLoop: false,
            uniqueId: "courseId",
            columns: [
                {field: "courseId", title: "课程号", sortable: true},
                {field: "courseName", title: "课程名称"},
                {field: "teacherId", title: "授课老师编号"},
                {field: "courseDate", title: "上课时间"},
                {field: "courseAddress", title: "上课地点"},
                {field: "courseTimes", title: "周数", sortable: true},
                {field: "courseType", title: "课程类型", sortable: true},
                {field: "coursePoint", title: "学分", sortable: true},
                {field: "courseId", title: "操作", formatter: operate},
            ]
        })
    })

    function operate(value, row, _) {
        let btn = ""
        <c:choose>
        <c:when test="${current.role == 999}">
        btn = "<button onclick='del(" + value + ")'>删除</button>&nbsp;&nbsp;<button onclick='detail(" + JSON.stringify(row) + ")'>详情</button>"
        </c:when>
        <c:when test="${current.role == 2}">

        </c:when>
        <c:when test="${current.role == 1}">

        </c:when>
        </c:choose>
        return btn
    }

    function refreshTable() {
        $("#table").bootstrapTable("refresh")
    }

    <c:choose>
    <c:when test="${current.role == 999}">

    function del(id) {
        $.ajax({
            url: "/admin/course",
            method: "delete",
            data: {
                courseId: id
            },
            success: function (result) {
                console.log(result.msg)
                refreshTable()
            },
            error: function () {
                alert("请求失败")
            }
        })
    }

    function detail(data){
        if (data){
            $("#courseId").attr("value", data.courseId)
            $("#courseName").attr("value", data.courseName)
            $("#courseTeacher").val(data.teacherId)
            $("option[value=" +  data.courseDate + "]").attr("selected", true)
            $("#courseAddress").attr("value", data.courseAddress)
            $("#courseTimes").attr("value", data.courseTimes)
            $("#courseType").val(data.courseType)
            $("#courseBelong").val(data.courseBelong)
            $("#coursePoint").attr("value", data.coursePoint)
        }
        $("#courseDetail").modal("show")
    }

    function formSubmit(){
        $.ajax({
            url: "/admin/course",
            method: "put",
            data: {
                courseId: $("#courseId").val(),
                courseName: $("#courseName").val(),
                courseDate: $("#courseDate").val(),
                courseAddress: $("#courseAddress").val(),
                courseTimes: $("#courseTimes").val(),
                courseType: $("#courseType").val(),
                coursePoint: $("#coursePoint").val(),
                teacherId: $("#teacherId").val(),
                courseBelong: $("#courseBelong").val()
            },
            success: function (result){
                console.log(result.msg)
                refreshTable()
            },
            error: function (){
                alert("请求失败")
            }
        })
    }

    </c:when>
    <c:when test="${current.role == 2}">

    </c:when>
    <c:when test="${current.role == 1}">

    </c:when>
    </c:choose>
</script>
</html>
