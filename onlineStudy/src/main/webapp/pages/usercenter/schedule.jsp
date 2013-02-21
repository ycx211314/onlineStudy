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
    <script type="text/javascript">
        $(function(){
            var date = new Date();
            var d = date.getDate();
            var m = date.getMonth();
            var y = date.getFullYear();
            var config = {
                header:{
                    left: 'prev,today,next',
                    right: 'title'
                },
                titleFormat:{
                    month: 'MMM',                             // September 2009
                    week: "MM月dd日 { '&#8212;'MM月dd日}", // Sep 7 - 13 2009
                    day: 'yyyy-MM-dd dddd'
                },
                monthNamesShort:['一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月'],
                monthNames:['一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月'],
                dayNames:['星期日','星期一','星期二','星期三','星期四','星期五','星期六'],
                dayNamesShort:['日','一','二','三','四','五','六'],
                columnFormat:{
                    month: 'dddd',    // Mon
                    week: 'dddd MM-dd', // Mon 9/7
                    day: 'dddd MM-dd'  // Monday 9/7
                },
                slotMinutes:120,
                editable: false,
                weekMode:'liquid',
                height:350,
                selectable: true,
                selectHelper: true,
                eventClick: function(calEvent, jsEvent, view) {
                    $('#schedule>.modal-header>h5').html(calEvent.title)
                    $("#schedule .modal-body").html(calEvent.showText)
                    $("#schedule").modal("show");
                },
                buttonText:{
                    today:"今天",
                    prev:"&lt;&lt",
                    next:"&gt;&gt"
                }
            }
            var events=  [
                {
                    title: '第一天',
                    start: new Date(y, m, 4),
                    showText:'你今天有50个单词需要学习',
                    allDay:true
                },
                {
                    title: '第二f天',
                    start: new Date(y, m, d-5),
                    allDay:true
                },
                {
                    title: '第二s天',
                    start: new Date(y, m, d-5),
                    allDay:true
                },
                {
                    title: '第二s天',
                    start: new Date(y, m, d-5),
                    allDay:true
                },
                {
                    title: '第二s天',
                    start: new Date(y, m, 4),
                    allDay:true
                },
                {
                    title: '第二s天',
                    start: new Date(y, m, 4),
                    allDay:true
                },
                {
                    title: '第二s天',
                    start: new Date(y, m, 4),
                    allDay:true
                }

            ];
            config.events = events;
            config.defaultView = "basicDay";
            $('#dayCalder,#weekCalder,#monthCalder').fullCalendar(config);
            $("#dayCalder").fullCalendar("changeView","basicDay");
        });
        function changeSchedul(view){
            $("#sheduleTab .active").removeClass("active");
            $("#sch"+view).addClass("active");
            switch (view){
                case 1:{
                    $("#dayCalder").fullCalendar("changeView","basicDay");
                    break;
                }
                case 2:{
                    $("#dayCalder").fullCalendar("changeView","basicWeek");
                    break;
                }
                default:{
                    $("#dayCalder").fullCalendar("changeView","month");
                    break;
                }
            }
        }
    </script>
</head>
<body>
<div class="tabbable" id="sheduleTab"> <!-- Only required for left/right tabs -->
    <ul class="nav nav-pills">
        <li id="sch1" class="active"><a href="javascript:changeSchedul(1);">日计划</a></li>
        <li id="sch2"><a href="javascript:changeSchedul(2);">周计划</a></li>
        <li id="sch3"><a href="javascript:changeSchedul(3);">月计划</a></li>
    </ul>
    <div class="tab-content">
        <div id="dayCalder" class="schedule"></div>
    </div>
</div>
</body>
</html>