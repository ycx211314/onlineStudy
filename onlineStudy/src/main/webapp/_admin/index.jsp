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
    <base href="<%=basePath %>">
    <link rel="stylesheet" href="_admin/static/js/easyui/themes/icon.css" />
    <link rel="stylesheet" href="_admin/static/js/easyui/themes/boootstrap/easyui.css" />
    <script type="text/javascript" src="static/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="_admin/static/js/easyui/jquery.easyui.min.js"></script>
    <link rel="stylesheet" href="static/js/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="_admin/admin.css"/>
    <title>管理中心</title>
    <script type="text/javascript">
    </script>
</head>
<body>
    <%@include file="/_admin/common/navbar.jsp"%>
    <div class="container-fluid">
        <div class="row-fluid">
            <div class="row">
            <div class="span3 well">
                <div class="accordion" id="accordion">
                    <div class="accordion-group">
                        <div class="accordion-heading">
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                                <i class=" icon-cog"></i>系统管理
                            </a>
                        </div>
                        <div id="collapseOne" class="accordion-body collapse in">
                            <div class="accordion-inner">
                                <ul class="nav nav-pills nav-stacked">
                                    <li class="active"><a href="javascript:void(0);" data-opt="_admin/pages/admin_list.jsp">管理员管理</a></li>
                                    <li><a href="javascript:void(0);" data-opt="#">角色管理</a></li>
                                    <li><a href="javascript:void(0);" data-opt="_admin/pages/menu_list.jsp">菜单管理</a></li>
                                    <li><a href="javascript:void(0);">数据管理</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="accordion-group">
                        <div class="accordion-heading">
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapse1">
                                课程管理
                            </a>
                        </div>
                        <div id="collapse1" class="accordion-body collapse">
                            <div class="accordion-inner">
                                <ul class="nav nav-pills nav-stacked">
                                    <li class="active"><a href="javascript:void(0);">课程管理</a></li>
                                    <li><a href="javascript:void(0);">录入管理</a></li>
                                    <li><a href="javascript:void(0);">数据管理</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="span9">
                <div class="row-fluid">
                    <div class="row inline">
                        <div class="span12" style="height:40px;">
                            <ul class="breadcrumb well-small">
                                <li><a href="_admin/index.jsp">首页</a> <span class="divider">/</span></li>
                                <li><a href="#">系统管理</a> <span class="divider">/</span></li>
                                <li class="active">管理员</li>
                            </ul>
                        </div>
                    </div>
                    <div class="row">
                        <div class="span12 bg">
                            <div id="mainContent">
                            </div>
                        </div>
                     </div>
                </div>
            </div>
            </div>
        </div>
    </div>
</body>
</html>