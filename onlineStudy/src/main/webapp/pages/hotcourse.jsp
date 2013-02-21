<%--
  User: yangchengxi
  Date: 13-1-21
  Time: 下午5:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*,java.lang.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <title>欢迎使用</title>
    <link rel="stylesheet" href="static/js/bootstrap/css/bootstrap.css"/>
    <script type="text/javascript" src="static/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="static/js/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript" src="static/js/bootstrap/plug-in/jquery.validate.min.js"></script>
    <script type="text/javascript" src="static/js/common.js"></script>
    <link rel="stylesheet" href="static/public.css"/>
</head>
<body class="body">
<%@include file="../common/navbar.jsp" %>
<div class="container-fluid whiteFont">
    <div class="row-fluid">
        <div class="span3">
            <section class="hot-list">
                <h3>热门课程</h3>
                <ol>
                    <li class="active"><a href="javascript:void(0);">GRE 英语</a></li>
                    <li>商务英语</li>
                    <li>托福英语</li>
                    <li>1</li>
                    <li>1</li>
                    <li>1</li>
                    <li>1</li>
                    <li>1</li>
                    <li>1</li>
                    <li>1</li>
                </ol>
            </section>
        </div>
        <div class="span3">
            <section>
                <h4>火爆课程</h4>
            </section>
        </div>
        <div class="span3">
            <section>
                <h4>火爆s课程</h4>
            </section>
        </div>
        <div class="span3">
            <section>
                <h4>推荐课程</h4>
            </section>
        </div>
    </div>
</div>
<%@include file="../common/footer.jsp" %>
</body>
</html>