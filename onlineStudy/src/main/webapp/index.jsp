<%--
  User: yangchengxi
  Date: 13-1-21
  Time: 下午5:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*,java.lang.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
  <head>
    <base href ="<%=basePath%>">
    <title>欢迎使用</title>
     <link rel="stylesheet" href="static/js/bootstrap/css/bootstrap.css"/>
      <script type="text/javascript" src="static/js/jquery-1.8.3.min.js"></script>
      <script type="text/javascript" src="static/js/bootstrap/js/bootstrap.js"></script>
      <script type="text/javascript" src="static/js/bootstrap/plug-in/jquery.validate.min.js"></script>
      <script type="text/javascript" src="static/js/common.js"></script>
      <link rel="stylesheet" href="static/docs.css"/>
  </head>
  <body data-spy="scroll" data-target=".bs-docs-sidebar">
  <%@include file="common/navbar.jsp"%>
  <div class="jumbotron masthead">
      <div class="container">
          <h1>怪蜀黍爱学习</h1>
          <p>坚持，用心，专业，进取，是成功不可缺少的因素<br>创新，多维，多角度，多思维定制学习</p>
          <p>
              <a href="regist.jsp" class="btn btn-primary btn-large" >开始畅游</a>
          </p>
          <ul class="masthead-links">
              <li>
                  <a href="regist.jsp" >注册账号</a>
              </li>
              <li>
                  <a href="login.jsp" >现在登录</a>
              </li>
              <li>
                  <a href="#" >关于合作</a>
              </li>
              <li>
                 怪蜀黍 &copy 2012-2013
              </li>
          </ul>
      </div>
  </div>
  </body>
</html>