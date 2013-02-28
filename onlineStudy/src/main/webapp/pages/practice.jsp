<%--
  User: yangchengxi
  Date: 13-1-21
  Time: 下午5:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*,java.lang.*" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <title>开始测试</title>
    <link rel="stylesheet" href="static/js/bootstrap/css/bootstrap.css"/>
    <script type="text/javascript" src="static/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="static/js/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript" src="static/js/bootstrap/plug-in/jquery.validate.min.js"></script>
    <script type="text/javascript" src="static/js/common.js"></script>
    <link rel="stylesheet" href="static/public.css"/>
    <script type="text/javascript">
       $(function(){
           var length = $(".nomargin a").length;
           $("#barprocess").html(0+"/"+length)
           $(".radio").bind("click",function(){
               $(this).parent().find(".text").removeClass("text-success");
               $(this).children(".text").addClass("text-success");
               var index = $(this).attr("qid");
               var a_tag = "index_"+index.substring(6);
               $("#"+a_tag).removeClass("btn-info").addClass("btn-success");
               updateProcess();
           });
           $(".checkbox").bind("change",function(){
               if($(this).children("input[type='checkbox']").attr("checked")){
                   $(this).children(".text").addClass("text-success");
               }else{
                   $(this).children(".text").removeClass("text-success");
               }
               var index = $(this).attr("qid");
               var a_tag = "index_"+index.substring(6);
               $("#"+a_tag).removeClass("btn-info").addClass("btn-success");
               updateProcess();
           })
       });
       function updateProcess(){
           var length = $(".nomargin a").length;
           var curr = $(".nomargin .btn-success").length;
           var prf = curr*100.0/length;
           $("#barprocess").css("width",prf+"%");
           $("#barprocess").html(curr+"/"+length)
       }
        function locate(ind){
            window.location.hash="#index"+ind;
        }
    </script>
</head>
<body class="body">
<%@include file="../common/navbar.jsp" %>
<div class="container-fluid whiteFont">
    <div data-spy="affix" data-offset-left="100" class="navigate">
        <div>
            <h4>快捷导航</h4>
        </div>
        <div class="progress progress-striped active">
            <div class="bar bar-success" id="barprocess" style="width: 0%;">
            </div>
        </div>
        <div class="qnav">
            <ul class="nav nav-pills nomargin">
                <c:forEach items="${subs}" var="sub" varStatus="ind">
                    <a class="btn-mini btn-info" href="javascript:locate(${ind.count});" id="index_${ind.count}"> ${ind.count}</a>
                </c:forEach>
            </ul>
        </div>
    </div>
    <a id="index0" name="index0"></a>
    <a id="index1" name="index1"></a>
    <a id="index2" name="index2"></a>
    <div class="container">
        <div class="row-fluid">
            <div class="span12 question">
                <section>
                    <h3>财经法规与会计职业道德</h3>
                    <hr>
                </section>
                <a id="index1" name="index1"></a>
                <!--- 问题-->
                <c:forEach items="${subs}" var="sub" varStatus="ind">
                    <section>
                        <h5><span class="text-info">${ind.count}.　${sub.titleDesc}</span></h5>
                        <div class="form-inline q-item">
                            <c:if test="${sub.types == 1}">
                                <c:forEach items="${sub.answerList}" var="answer" varStatus="aind">
                                    <label class="radio" qid="qIndex${ind.count}">
                                        <input type="radio" name="radio${sub.sId}" id="answer${answer.aid}"  value="${answer.aid}">
                                        <span class="text">${choose[aind.index]}. ${answer.shwoText}</span>
                                    </label>
                                </c:forEach>
                            </c:if>
                            <c:if test="${sub.types == 2}">
                                <label class="radio" id="qIndex${ind.count}">
                                    <input type="radio" name="radio${sub.sId}" value="1">
                                    <span class="text">正确</span>
                                </label>
                                <label class="radio" id="qIndex${ind.count}">
                                    <input type="radio" name="radio${sub.sId}" value="0">
                                    <span class="text">错误</span>
                                </label>
                            </c:if>
                            <c:if test="${sub.types == 3}">
                                <c:forEach items="${sub.answerList}" var="answer" varStatus="aind">
                                    <label class="checkbox" qid="qIndex${ind.count}">
                                        <input type="checkbox" name="radio${sub.sId}" id="answer${answer.aid}"  value="${answer.aid}">
                                        <span class="text">${choose[aind.index]}. ${answer.shwoText}</span>
                                    </label>
                                </c:forEach>
                            </c:if>
                        </div>
                        <hr>
                        <a id="index${ind.index+4}" name="index${ind.index+4}"></a>
                    </section>
                </c:forEach>
                <div class="span12">
                    <button class="btn btn-primary">查看成绩</button>
                    <hr>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="../common/footer.jsp" %>
</body>
</html>