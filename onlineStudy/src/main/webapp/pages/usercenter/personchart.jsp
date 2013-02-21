<%--
  User: Administrator
  Date: 13-2-7
  Time: 上午11:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*,java.lang.*" pageEncoding="UTF-8"%>
<%
    String basePath = String.format("%s://%s:%s%s/", request.getScheme(), request.getServerName(), request.getServerPort(), request.getContextPath());
%>
<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>" />
    <script type="text/javascript" src="static/js/highcharts/highcharts.js"></script>
      <script type="text/javascript" src="static/js/highcharts/highcharts-more.js"></script>
        <script type="text/javascript">
            var chart_ablitity,chart_schedule,chart_point,chart_exam;
                $(function () {
                    chart_ablitity = new Highcharts.Chart({
                        chart: {
                            renderTo: 'personPoint',
                            polar: true,
                            type: 'area'
                        },
                        title: {
                            text: '杨成锡',
                            x: -80
                        },
                        pane: {
                            size: '80%'
                        },
                        xAxis: {
                            categories: ['阅读', '听力', '口语', '协作','成绩'],
                            tickmarkPlacement: 'on',
                            lineWidth: 0
                        },
                        yAxis: {
                            gridLineInterpolation: 'polygon',
                            lineWidth: 0,
                            min: 0
                        },
                        tooltip: {
                            shared: true
                        },
                        legend: {
                            align: 'right',
                            verticalAlign: 'top',
                            y: 100,
                            layout: 'vertical'
                        },

                        series: [{
                            name: 'ycx',
                            data: [43000, 19000, 60000, 35000, 17000],
                            pointPlacement: 'on'
                        }]

                    });
                    chart_schedule = new Highcharts.Chart({
                        chart: {
                            renderTo: 'processSchedule',
                            type: 'column'
                        },
                        title: {
                            text: '计划完成进度'
                        },
                        xAxis: {
                            categories: ['一月', '二月', '三月', '四月', '五月']
                        },
                        yAxis: {
                            min: 0,
                            title: {
                                text: '总体'
                            },
                            max:100
                        },
                        tooltip: {
                            formatter: function() {
                                return ''+
                                        this.series.name +': '+ this.y +' ('+ Math.round(this.percentage) +'%)';
                            }
                        },
                        plotOptions: {
                            column: {
                                stacking: 'percent'
                            }
                        },
                        series: [{
                            name: '完成',
                            data: [5, 3, 4, 7, 2]
                        }, {
                            name: '未完成',
                            data: [2, 2, 3, 2, 1]
                        }]
                    });
                    chart_exam = new Highcharts.Chart({
                        chart: {
                            renderTo: 'examline',
                            type: 'spline'
                        },
                        title: {
                            text: '测评成绩'
                        },
                        xAxis: {
                            categories:['一月','二月','三月']
                        },
                        yAxis: {
                            title: {
                                text: '成绩'
                            },
                            min: 0
                        },
                        tooltip: {
                            formatter: function() {
                                return '<b>'+ this.series.name +'</b><br/>'+
                                         this.x +': '+ this.y +' m';
                            }
                        },

                        series: [{
                            name: '听力',
                            // Define the data points. All series have a dummy year
                            // of 1970/71 in order to be compared on the same x axis. Note
                            // that in JavaScript, months start at 0 for January, 1 for February etc.
                            data: [
                                ['一月',56],
                                ['二月',79],
                                ['三月',44]
                            ]
                        }, {
                            name: '阅读',
                            data: [
                                ['一月',44],
                                ['二月',22],
                                ['三月',55]
                            ]
                        }, {
                            name: '协作',
                            data: [
                                ['一月',66],
                                ['二月',44],
                                ['三月',33]
                            ]
                        }]
                    });
                    chart_point = new Highcharts.Chart({
                        chart: {
                            renderTo: 'points',
                            type: 'area'
                        },
                        title: {
                            text: 'US and USSR nuclear stockpiles'
                        },
                        xAxis: {
                            labels: {
                                formatter: function() {
                                    return this.value; // clean, unformatted number for year
                                }
                            }
                        },
                        yAxis: {
                            title: {
                                text: 'Nuclear weapon states'
                            },
                            labels: {
                                formatter: function() {
                                    return this.value / 1000 +'k';
                                }
                            }
                        },
                        tooltip: {
                            formatter: function() {
                                return this.series.name +' produced <b>'+
                                        Highcharts.numberFormat(this.y, 0) +'</b><br/>warheads in '+ this.x;
                            }
                        },
                        plotOptions: {
                            area: {
                                pointStart: 1940,
                                marker: {
                                    enabled: false,
                                    symbol: 'circle',
                                    radius: 2,
                                    states: {
                                        hover: {
                                            enabled: true
                                        }
                                    }
                                }
                            }
                        },
                        series: [{
                            name: 'USA',
                            data: [null, null, null, null, null, 6 , 11, 32, 110, 235, 369, 640,
                                1005, 1436, 2063, 3057, 4618, 6444, 9822, 15468, 20434, 24126,
                                27387, 29459, 31056, 31982, 32040, 31233, 29224, 27342, 26662,
                                26956, 27912, 28999, 28965, 27826, 25579, 25722, 24826, 24605,
                                24304, 23464, 23708, 24099, 24357, 24237, 24401, 24344, 23586,
                                22380, 21004, 17287, 14747, 13076, 12555, 12144, 11009, 10950,
                                10871, 10824, 10577, 10527, 10475, 10421, 10358, 10295, 10104 ]
                        }, {
                            name: 'USSR/Russia',
                            data: [null, null, null, null, null, null, null , null , null ,null,
                                5, 25, 50, 120, 150, 200, 426, 660, 869, 1060, 1605, 2471, 3322,
                                4238, 5221, 6129, 7089, 8339, 9399, 10538, 11643, 13092, 14478,
                                15915, 17385, 19055, 21205, 23044, 25393, 27935, 30062, 32049,
                                33952, 35804, 37431, 39197, 45000, 43000, 41000, 39000, 37000,
                                35000, 33000, 31000, 29000, 27000, 25000, 24000, 23000, 22000,
                                21000, 20000, 19000, 18000, 18000, 17000, 16000]
                        }]
                    });
                });
    </script>
  </head>
  <body>
  <div class="span12">
      <div class="tabbable tabs-left" style="background-color: #fff;">
          <ul class="nav nav-tabs">
              <li class="active"><a href="#tab1" data-toggle="tab">个人技能</a></li>
              <li><a href="#tab2" data-toggle="tab">计划进度</a></li>
              <li><a href="#tab3" data-toggle="tab">技能成绩</a></li>
              <li><a href="#tab4" data-toggle="tab">点覆盖图</a></li>
          </ul>
          <div class="tab-content">
              <div class="tab-pane active" id="tab1">
                  <div id="personPoint" class="charts"></div>
              </div>
              <div class="tab-pane" id="tab2">
                  <div id="processSchedule" class="charts"></div>
              </div>
              <div class="tab-pane" id="tab3">
                  <div id="examline" class="charts"></div>
              </div>
              <div class="tab-pane" id="tab4">
                  <div id="points" class="charts"></div>
              </div>
          </div>
      </div>
  </div>
  </body>
</html>