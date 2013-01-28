<%@ page language="java" import="java.util.*,java.lang.*" pageEncoding="UTF-8"%>
<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container-fluid">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
            <a class="brand" href="index.jsp">怪蜀黍爱学习</a>
            <div class="nav-collapse collapse">
                <p class="navbar-text pull-right">
                    你好，欢迎来到怪蜀黍爱学习！
                    <a href="regist.jsp" class="navbar-link">【注册】</a>
                    <a href="login.jsp" class="navbar-link">【登录】</a>
                </p>
                <ul class="nav nav-pills">
                    <li class="active"><a href="#">我的主页</a></li>
                    <li class="dropdown">
                        <a class="dropdown-toggle"
                           data-toggle="dropdown"
                           href="#">
                            个人中心
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="#">课程选择</a></li>
                            <li><a href="#">课程选择</a></li>
                            <li><a href="#">课程选择</a></li>
                        </ul>
                    </li>
                    <li><a href="about.jsp">关于我们</a></li>
                    <li><a href="contact.jsp">联系我们</a></li>
                </ul>
            </div><!--/.nav-collapse -->
        </div>
    </div>
</div>