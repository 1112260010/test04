<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html style="height: 100%">
   <head>
       <meta charset="utf-8">
   </head>
   <body style="height: 100%; margin: 0">
       <div id="container" style="height: 100%"></div>
       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/echarts.min.js"></script>
       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts-gl/echarts-gl.min.js"></script>
       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts-stat/ecStat.min.js"></script>
       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/extension/dataTool.min.js"></script>
       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/china.js"></script>
       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/world.js"></script>
       <script type="text/javascript" src="https://api.map.baidu.com/api?v=2.0&ak=xfhhaTThl11qYVrqLZii6w8qE5ggnhrY&__ec_v__=20190126"></script>
       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/extension/bmap.min.js"></script>
       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/simplex.js"></script>
       <script type="text/javascript" src="/js/jQuery1.11.1.js"></script>
       <script type="text/javascript">
           $(function(){
               $.ajax({
                   url:"/findAll",
                   type:"post",
                   dataType:"json",
                   success:function(da){
                       var dom = document.getElementById("container");
                       var myChart = echarts.init(dom);
                       var app = {};
                        var names = [];
                        var sales = [];
                       for(var i=0;i<da.length;i++){
                           names.push(da[i].name);
                           sales.push(da[i].sales);
                       }
                       option = null;
                       option = {
                           title : {
                               text: '图书价格',
                               subtext:'绝对真实'
                           },
                           xAxis: {
                               type: 'category',
                               data: names
                           },
                           yAxis: {
                               type: 'value'
                           },
                           series: [{
                               data: sales,
                               type: 'bar'
                           }]
                       };
                       ;
                       if (option && typeof option === "object") {
                           myChart.setOption(option, true);
                       }
                   }
               })

           })

       </script>
   <h2>1111111111</h2>
   </body>
</html>