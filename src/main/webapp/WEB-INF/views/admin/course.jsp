<%--
  Created by IntelliJ IDEA.
  User: xingj
  Date: 2023/2/14
  Time: 21:47
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

                <li class="active"><a href="${pageContext.request.contextPath}/admin/showCourse">课程管理<span
                        class="badge pull-right" id="courseCount"></span></a></li>
                <li><a href="${pageContext.request.contextPath}/admin/showStudent">学生管理<span
                        class="badge pull-right" id="studentCount"></span></a></li>
                <li><a href="${pageContext.request.contextPath}/admin/showTeacher">教师管理<span
                        class="badge pull-right" id="teacherCount"></span></a></li>
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
                    <p style="font-weight: bold; font-size: xx-large; text-align: center">添加课程信息</p>
                </div>
                <div class="panel-body">
                    <%--表单--%>
                    <form class="form-horizontal" method="post"
                          action="${pageContext.request.contextPath}/admin/course">
                        <div class="form-group">
                            <label for="courseId" class="col-sm-2 control-label">课程号</label>
                            <div class="col-sm-10">
                                <c:choose>
                                    <c:when test="${course == null}">
                                        <input type="number" class="form-control" id="courseId" name="courseId"
                                               placeholder="请输入课程号">
                                    </c:when>
                                    <c:otherwise>
                                        <input type="number" class="form-control" id="courseId" name="courseId"
                                               value="${course.courseId}" readonly>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="courseName" class="col-sm-2 control-label">课程名称</label>
                            <div class="col-sm-10">
                                <c:choose>
                                    <c:when test="${course == null}">
                                        <input type="text" class="form-control" id="courseName" name="courseName"
                                               placeholder="请输入课程名称">
                                    </c:when>
                                    <c:otherwise>
                                        <input type="text" class="form-control" id="courseName" name="courseName"
                                               placeholder="请输入课程名称" value="${course.courseName}">
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="courseTeacher" class="col-sm-2 control-label">授课老师</label>
                            <div class="col-sm-10">
                                <select class="form-control" id="courseTeacher" name="teacherId">
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
                                <c:choose>
                                    <c:when test="${course == null}">
                                        <input type="text" class="form-control" id="courseAddress" name="courseAddress"
                                               placeholder="请输入上课地点">
                                    </c:when>
                                    <c:otherwise>
                                        <input type="text" class="form-control" id="courseAddress" name="courseAddress"
                                               placeholder="请输入上课地点" value="${course.courseAddress}">
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="courseTimes" class="col-sm-2 control-label">周数</label>
                            <div class="col-sm-10">
                                <c:choose>
                                    <c:when test="${course == null}">
                                        <input type="number" class="form-control" id="courseTimes" name="courseTimes"
                                               placeholder="请输入周数">
                                    </c:when>
                                    <c:otherwise>
                                        <input type="number" class="form-control" id="courseTimes" name="courseTimes"
                                               placeholder="请输入周数" value="${course.courseTimes}">
                                    </c:otherwise>
                                </c:choose>
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

                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="coursePoint" class="col-sm-2 control-label">学分</label>
                            <div class="col-sm-10">
                                <c:choose>
                                    <c:when test="${course == null}">
                                        <input type="number" class="form-control" id="coursePoint" name="coursePoint"
                                               placeholder="请输入学分">
                                    </c:when>
                                    <c:otherwise>
                                        <input type="number" class="form-control" id="coursePoint" name="coursePoint"
                                               placeholder="请输入学分" value="${course.coursePoint}">
                                    </c:otherwise>
                                </c:choose>
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
        getTeachers()
        getAcademies()
        changeDefaultSelect()
        getNumbers()
    })

    function getTeachers() {
        let teacherSelect = $("#courseTeacher")

        $.get("/teacher", null, function (result) {
            for (data of result) {
                teacherSelect.append(`<option value='\${data.teacherId}'>\${data.teacherName}</option>`)
            }
        })
    }

    function getAcademies() {
        let academySelect = $("#courseBelong")

        $.get("/academy", null, function (result) {
            for (data of result) {
                academySelect.append(`<option value='\${data.academyId}'>\${data.academyName}</option>`)
            }
        })
    }

    function changeDefaultSelect() {
        let courseId = $("#courseId").val()
        if (courseId != null) {
            $.get("/course/" + courseId, null, function (result) {
                $("#courseTeacher").val(result.teacherId)
                $("#courseDate").val(result.courseDate)
                $("#courseType").val(result.courseType)
                $("#courseBelong").val(result.courseBelong)
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
