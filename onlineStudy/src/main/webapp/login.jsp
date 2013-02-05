<%--
  User: Administrator
  Date: 13-1-21
  Time: 下午5:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*,java.lang.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<%
    String basePath = String.format("%s://%s:%s%s/", request.getScheme(), request.getServerName(), request.getServerPort(), request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="static/js/bootstrap/css/bootstrap.css"/>
    <script type="text/javascript" src="static/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="static/js/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript" src="static/js/bootstrap/plug-in/jquery.validate.min.js"></script>
    <script type="text/javascript" src="static/js/common.js"></script>
    <link rel="stylesheet" href="static/docs.css"/>
    <script type="text/javascript">
        $(function () {
            importValidate();
            $('#loginForm').validate({
                debug: true,
                rules: {
                    "userName": {required: true, minlength: 6},
                    "password": {required: true, minlength: 6},
                    "validateCode": {required: true}
                },
                submitHandler: function (form) {
                    form.submit();
                }
            });
        })
    </script>
    <title>登陆</title>
</head>
<body data-spy="scroll" data-target=".bs-docs-sidebar">
    <%@include file="common/navbar.jsp" %>
    <div class="mainContent container-fluid">
    <div class="container">
        <div class="container-fluid well">
            <div class="row-fluid">
                <div class="span12">
                    <fieldset>
                        <legend><i class="icon-user"></i>欢迎登陆</legend>
                    </fieldset>
                </div>
            </div>
            <div class="row-fluid">
                <div class="span6">
                    <mvc:form id="loginForm" action="${pageContext.request.contextPath}/login.do" method="post"
                              cssClass="form-horizontal">
                        <%--<form class="form-horizontal" id="registForm" method="post" action="${pageContext.request.contextPath}/register.do">--%>
                        <div class="control-group">
                            <label class="control-label">邮　　箱：</label>

                            <div class="controls">
                                <input class="input-medium" name="username" type="text" placeholder="登录名/用户名" required>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">密　　码：</label>

                            <div class="controls">
                                <input class="input-medium" name="password" id="password" type="password"
                                       placeholder="请输入用户名">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">验证字符：</label>

                            <div class="controls">
                                <input class="input-small" type="text" name="validateCode" placeholder="请输入图片中的字符">
                                <img src="static/images/code.jsp"/>
                                <a href="#">看不清</a>
                            </div>
                        </div>
                        <%--</form>--%>
                    </mvc:form>
                </div>
                <div class="span6">
                    <fieldset>
                        <legend>合作伙伴</legend>
                    </fieldset>
                    <img src="static/images/third/renren-login.png">
                    <img src="static/images/third/weibo-login.png">
                </div>
            </div>
            <div class="row">
                <div class="span12">
                    <div class="span4 offset4">
                        <input class="btn btn-primary" type="submit" id="submitBtn" form="loginForm" value="登陆"/>
                        <input class="btn btn-primary" type="reset" form="loginForm" value="重置"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
    <%@include file="common/footer.jsp"%>
</body>
</html>