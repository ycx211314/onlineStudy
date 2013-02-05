<%--
  User: Administrator
  Date: 13-2-4
  Time: 上午9:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*,java.lang.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
  <head>
      <base href="<%=basePath %>">
      <link rel="stylesheet" href="static/js/easyui/themes/bootstrap/easyui.css"/>
      <script type="text/javascript" src="static/js/easyui/easyloader.js"></script>
      <script type="text/javascript">
          $(function(){
              $
          })
      </script>
  </head>
  <body>
  <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
      <h6>添加菜单</h6>
  </div>
  <mvc:form cssClass="modal-form form-horizontal" method="post" action="#">
      <div class="control-group">
          <label class="control-label">菜单名称：</label>
          <div class="controls">
              <input class="input-medium" name="username" type="text" placeholder="请输入菜单名称" required>
          </div>
      </div>
      <div class="control-group">
          <label class="control-label">菜单路径：</label>
          <div class="controls">
              <input class="input-medium" name="username" type="text" placeholder="请输入菜单名称" required>
          </div>
      </div>
      <div class="control-group">
          <label class="control-label">菜单属性：</label>
          <div class="controls">
              <input class="input-medium" name="username" type="text" placeholder="请输入菜单名称" required>
          </div>
      </div>
      <div class="control-group">
          <label class="control-label">菜单图标：</label>
          <div class="controls">
              <input class="input-medium" name="username" type="text" placeholder="请输入菜单名称" required>
          </div>
      </div>
      <div class="control-group">
          <label class="control-label">能否授权：</label>
          <div class="controls">
              <select class="input-medium">
                  <option>是</option>
                  <option>否</option>
              </select>
          </div>
      </div>
      </mvc:form>
      <div class="modal-footer">
          <button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
          <button class="btn btn-primary">确定</button>
      </div>
  </body>
</html>