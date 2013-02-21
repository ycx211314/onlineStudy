<%@ page language="java" import="java.util.*,java.lang.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <title>欢迎使用本管理系统</title>
    <script type="text/javascript" src="static/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="_admin/static/js/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="_admin/static/js/easyui/locale/easyui-lang-zh_CN.js"></script>
    <%--<link rel="stylesheet" href="_admin/static/js/easyui/themes/icon.css">--%>
    <link rel="stylesheet" href="_admin/static/js/easyui/themes/bootstrap/easyui.css">
    <script type="text/javascript" src="static/js/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="_admin/static/css/main.css">
    <link rel="stylesheet" href="static/js/bootstrap/css/bootstrap.min.css">
    <script type="text/javascript" src="_admin/static/js/common.js"></script>
    <script type="text/javascript" src="_admin/static/js/index.js"></script>
    <%--<script type="text/javascript">--%>
        <%--function first(){--%>
            <%--<s:if test="#session.needupdatePWD">--%>
            <%--openChangeDialog();--%>
            <%--</s:if>--%>
            <%--setInterval(function(){$("#currentDate").html(new Date().toLocaleString());},500);--%>

        <%--}--%>
    <%--</script>--%>
</head>
<body class="easyui-layout">
<div id="banner" region="north" border="false">
    sdf
</div>
<div region="west" title="欢迎使用" id="menuleft" split="true" style="height:100%;width:200px;">
        <div title="功能菜单" class="easyui-panel" fit="true" iconCls="icon-computer" style="overflow:auto;padding:10px;">
            <ul id="resTree"></ul>
        </div>
        <%--<s:if test="#session.hasReport">--%>
            <%--<div title="报表菜单" iconCls="icon-computer" style="overflow:auto;padding:10px;">--%>
                <%--<ul id="reportTree"></ul>--%>
            <%--</div>--%>
        <%--</s:if>--%>
</div>
<div region="center" id="maincontent">
    <div id="content" style="width:100%;height:100%;margin:0px;background:#fafafa;">
        <div  style="width:100%;height:100%;margin:0px;background:#fafafa;" title="首页" id="mainTab">
            <iframe width="100%" frameborder="0" id="mainFrame"  height="100%^;"></iframe>
        </div>
    </div>
</div>
<div id="footer" region="south">
</div>
<div  id="commonModal" class="modal hide fade">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h3 id="commontitle">修改菜单</h3>
    </div>
    <div class="modal-body">
        <mvc:form id="commonForm"  method="post" cssClass="form-horizontal">
        </mvc:form>
    </div>
    <div class="modal-footer">
        <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
        <button id="btn_OK" class="btn btn-primary">保存</button>
    </div>
</div>
<div id="progressbar">
    <div id="pbar" class="easyui-progressbar" style="width:400px;">
    </div>
</div>
<div style="display: none;">
    <div id="mm" class="easyui-menu" style="width:120px;">
        <div onclick="updateTab();" id="btn_cur">当前页面打开</div>
        <div class="menu-sep"></div>
        <div onclick="openTab();" id="btn_new">新标签打开</div>
    </div>
    <div id="changePwd">
        <form id="upPwdForm" method="post">
            <h4 style="width:100%;margin:0px auto;text-align: center;">你的密码已经过期，请修改你的初始密码</h4>
            <dl style="width:250px;margin: 0px auto;margin-top: 20px;">
                <dd style="height: 32px;"><label>初始密码：</label><input type="password" name="opwd" class="corner-all easyui-validatebox" required="true" /></dd>
                <dd style="height: 32px;"><label>密　　码：</label><input type="password" name="apwd" class="corner-all easyui-validatebox" required="true" /></dd>
                <dd style="height: 32px;"><label>重复密码：</label><input type="password" name="npwd" class="corner-all easyui-validatebox" required="true" /></dd>
            </dl>
        </form>
    </div>
</div>
</body>
</html>