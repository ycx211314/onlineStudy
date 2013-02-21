<%--
  User: Administrator
  Date: 13-1-25
  Time: 上午11:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*,java.lang.*" pageEncoding="UTF-8" %>
<%
    String basePath = String.format("%s://%s:%s%s/", request.getScheme(), request.getServerName(), request.getServerPort(), request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <link rel="stylesheet" href="static/js/bootstrap/css/bootstrap.css"/>
    <script type="text/javascript" src="static/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="static/js/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript" src="static/js/bootstrap/plug-in/jquery.validate.min.js"></script>
    <script type="text/javascript" src="static/js/common.js"></script>
    <script type="text/javascript" src="static/js/fullcalendar/fullcalendar.min.js"></script>
    <link rel="stylesheet" href="static/js/fullcalendar/fullcalendar.css" />
    <link rel="stylesheet" href="static/public.css"/>
    <title>个人中心</title>
    <script type="text/javascript">
        $(function(){
            $("#leftMenu a").bind("click",function(){
                $("#leftMenu .active").removeClass("active");
                $(this).parent().addClass("active");
                $("#rightMain").load($(this).attr("data-opt"));
            });
        });
    </script>
    <style type="text/css">
        .schedule{
            width:100%;
            height: 370px;
            margin: 0 auto;
        }
        .rightContent{
            width:100%;
            height: 425px;
            background-color: #fff;
        }
        #lefM #leftMenu{
            min-height: 403px;
        }
    </style>
</head>
<body>
<%@include file="/common/navbar.jsp" %>
<div class="mainContent">
    <div class="row-fluid mainBody">
        <div class="span3 well" id="lefM">
            <ul class="nav nav-stacked nav-pills" id="leftMenu">
                <li class="nav-header">个人中心</li>
                <li class="active"><a href="javascript:void(0);" data-opt="pages/usercenter/schedule.jsp">我的计划</a></li>
                <li><a href="javascript:void(0);">课程安排</a></li>
                <li><a href="javascript:void(0);">个性数据</a></li>
                <li><a href="javascript:void(0);" data-opt="pages/usercenter/personchart.jsp" >个性数据</a></li>
                <li><a href="javascript:void(0);">学习指导</a></li>
                <li class="nav-header">个人设置</li>
                <li><a href="javascript:void(0);">提示设置</a></li>
                <li><a href="javascript:void(0);">学习模式</a></li>
                <li><a href="javascript:void(0);">图表定制</a></li>
                <li><a href="javascript:void(0);">其他设置</a></li>
            </ul>
        </div>
        <div class="span9">
            <div class="row well rightContent" id="rightMain">
            </div>
        </div>
    </div>
</div>
<%@include file="/common/footer.jsp" %>
<div id="schedule" class="modal hide fade">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h5></h5>
    </div>
    <div class="modal-body">
    </div>
</div>
</body>
</html>