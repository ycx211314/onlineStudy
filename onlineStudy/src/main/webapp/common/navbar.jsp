<%@ page language="java" import="java.util.*,java.lang.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container-fluid">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
            <a class="brand" href="index.jsp">怪蜀黍爱学习</a>
            <div class="nav-collapse collapse">
                <c:choose>
                    <c:when test="${user==null}">
                        <p class="navbar-text pull-right">
                            你好，欢迎来到怪蜀黍爱学习！
                            【<a href="regist.jsp" class="navbar-link">注册</a>】
                            【<a href="login.jsp" class="navbar-link">登录</a>】
                        </p>
                    </c:when>
                    <c:otherwise>
                        <p class="navbar-text pull-right">
                            你好，欢迎来到怪蜀黍爱学习！
                            【<a href="/index.jsp" class="navbar-link">${user.neckName}</a>】
                            【<a href="logout.do" class="navbar-link">注销</a>】
                        </p>
                    </c:otherwise>
                </c:choose>
                <ul class="nav nav-pills">
                    <li class="active"><a href="index.jsp">首页</a></li>
                    <li><a href="index.jsp">热门课程</a></li>
                    <li class="dropdown">
                        <a class="dropdown-toggle"
                           data-toggle="dropdown"
                           href="#">
                            我的进步
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="#">定制课程</a></li>
                            <li><a href="#">学习测验</a></li>
                            <li><a href="#">统计信息</a></li>
                        </ul>
                    </li>
                    <li><a href="about.jsp">关于我们</a></li>
                    <li><a href="contact.jsp">联系我们</a></li>
                </ul>
            </div><!--/.nav-collapse -->
        </div>
    </div>
</div>