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
</head>
<body>
<h4>菜单管理</h4>
<div class="btn-group">
    <a class="btn dropdown-toggle btn-small" data-toggle="dropdown" href="#">
        数据操作
        <span class="caret"></span>
    </a>
    <ul class="dropdown-menu">
        <li><a href="#myModal" class="btn" data-toggle="modal" tabindex="-1">添加菜单</a></li>
        <li><a tabindex="-1" href="#">修改菜单</a></li>
        <li><a tabindex="-1" href="#">删除菜单</a></li>
        <li><a tabindex="-1" href="#">添加数据</a></li>
    </ul>
</div>
<table class="table table-hover table-bordered">
    <thead>
    <tr>
        <th>编号</th>
        <th>菜单名称</th>
        <th>菜单路径</th>
        <th>菜单属性</th>
        <th>菜单图标</th>
        <th>可否授权</th>
        <th>跟新时间</th>
    </tr>
    </thead>
    <tr>
        <td>1</td>
        <td>2</td>
        <td>2</td>
        <td>3</td>
        <td>4</td>
        <td>5</td>
        <td>5</td>
    </tr>
    <tr>
        <td>1</td>
        <td>2</td>
        <td>2</td>
        <td>3</td>
        <td>4</td>
        <td>5</td>
        <td>5</td>
    </tr>
    <tr>
        <td>1</td>
        <td>2</td>
        <td>2</td>
        <td>3</td>
        <td>4</td>
        <td>5</td>
        <td>5</td>
    </tr>
    <tr>
        <td>1</td>
        <td>2</td>
        <td>2</td>
        <td>3</td>
        <td>4</td>
        <td>5</td>
        <td>5</td>
    </tr>
    <tr>
        <td>1</td>
        <td>2</td>
        <td>2</td>
        <td>3</td>
        <td>4</td>
        <td>5</td>
        <td>5</td>
    </tr>


</table>
<div class="pagination pagination-small pagination-centered">
    <ul>
        <li><a href="#">&lt &lt</a></li>
        <li><a href="#">1</a></li>
        <li><a href="#">2</a></li>
        <li><a href="#">3</a></li>
        <li><a href="#">4</a></li>
        <li><a href="#">5</a></li>
        <li><a href="#">6</a></li>
        <li><a href="#">&gt&gt</a></li>
    </ul>
</div>
<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">

</div>
</body>
</html>