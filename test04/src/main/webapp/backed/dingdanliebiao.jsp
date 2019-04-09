<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> - 数据表格</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="favicon.ico"> 
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.css" rel="stylesheet">
    <!-- Data Tables -->
    <link href="css/dataTables.bootstrap.css" rel="stylesheet">
    <!-- Sweet Alert -->
    <link href="css/sweetalert.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css?v=4.1.0" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="css/laydate.css">
    <link type="text/css" rel="stylesheet" href="css/laydate1.css">
    <script type="text/javascript" src="../js/jquery-1.8.2.min.js"></script>
    <script>
        $(function(){
            if(${sessionScope.user != null}) {
                var pageSize = $("[name=pageSize]").val();
                $.post("/OrderBackServlet?opr=getAllOrder", "pageSize=" + pageSize + "&pageIndex=1", callback, "json");

                function callback(data) {
                    var $tbody = $("tbody");
                    $tbody.empty();
                    var str = "";
                    for (var i = 0; i < data.list.length; i++) {
                        str += "<tr class=\"gradeX\">\n" +
                            "                                    <td style=\"text-align: center;\">" + (data.list)[i].id + "</td>\n" +
                            "                                    <td style=\"text-align: center;\">" + (data.list)[i].loginName + "</td>\n" +
                            "                                    <td style=\"text-align: center;\">" + (data.list)[i].createTime + "</td>\n" +
                            "                                    <td style=\"text-align: center;\">" + (data.list)[i].cost + "</td>\n" +
                            "                                    <td style=\"text-align: center;\">" + (data.list)[i].userAddress + "</td>\n" +
                            "                                    <td style=\"text-align: center;\">" + ((data.list)[i].list)[0].loginName + "</td>\n" +
                            "                                    <td style=\"text-align: center;\">" + ((data.list)[i].list)[0].userName + "</td>\n" +
                            "                                    <td style=\"text-align: center;\">" + ((data.list)[i].list)[0].mobile + "</td>\n" +
                            "                                \t <td style=\"text-align: center;\">\n" +
                            "                        \t\t\t\t<input type=\"hidden\" value=\"105\"/>\n" +
                            "                        \t\t\t\t<a class=\"btn btn-white btn-bitbucket delete\" title=\"删除\"  href=\"javascript:;\" onclick='deleteOrder(" + (data.list)[i].id + ")'>\n" +
                            "                           \t\t\t\t\t <i class=\"fa fa-trash-o\" aria-hidden=\"true\"></i>\n" +
                            "                        \t\t\t\t</a>\n" +
                            "                        \t\t\t</td>\n" +
                            "                                </tr> "
                    }
                    str += "<tr>\n" +
                        "                                    <td>共" + data.totalCount + "项</td>\n" +
                        "                                    <td>" + data.pageIndex + "/" + data.totalPage + "</td>\n" +
                        "                                    <td><a href=\"javascript:;\" onclick='getOrderPage(" + pageSize + "," + (data.pageIndex - 1) + ")'>上一页</a><a href=\"javascript:;\" onclick='getOrderPage(" + pageSize + "," + (data.pageIndex + 1) + ")'>下一页</a></td>\n" +
                        "                                </tr>"
                    $tbody.html(str);
                }
            }
        })
    </script>
    <script>
        //分页查找
        function getOrderPage(pageSize,pageIndex){
            $.post("/OrderBackServlet?opr=getAllOrder","pageSize="+pageSize+"&pageIndex="+pageIndex,callback,"json");
            function callback(data){
                var $tbody = $("tbody");
                $tbody.empty();
                var str = "";
                for(var i=0;i<data.list.length;i++){
                    str += "<tr class=\"gradeX\">\n" +
                        "                                    <td style=\"text-align: center;\">"+(data.list)[i].id+"</td>\n" +
                        "                                    <td style=\"text-align: center;\">"+(data.list)[i].loginName+"</td>\n" +
                        "                                    <td style=\"text-align: center;\">"+(data.list)[i].createTime+"</td>\n" +
                        "                                    <td style=\"text-align: center;\">"+(data.list)[i].cost+"</td>\n" +
                        "                                    <td style=\"text-align: center;\">"+(data.list)[i].userAddress+"</td>\n" +
                        "                                    <td style=\"text-align: center;\">"+((data.list)[i].list)[0].loginName+"</td>\n" +
                        "                                    <td style=\"text-align: center;\">"+((data.list)[i].list)[0].userName+"</td>\n" +
                        "                                    <td style=\"text-align: center;\">"+((data.list)[i].list)[0].mobile+"</td>\n" +
                        "                                \t <td style=\"text-align: center;\">\n" +
                        "                        \t\t\t\t<input type=\"hidden\" value=\"105\"/>\n" +
                        "                        \t\t\t\t<a class=\"btn btn-white btn-bitbucket delete\" title=\"删除\"  href=\"javascript:;\" onclick='deleteOrder("+(data.list)[i].id+")'>\n" +
                        "                           \t\t\t\t\t <i class=\"fa fa-trash-o\" aria-hidden=\"true\"></i>\n" +
                        "                        \t\t\t\t</a>\n" +
                        "                        \t\t\t</td>\n" +
                        "                                </tr> "
                }
                str += "<tr>\n" +
                    "                                    <td>共"+data.totalCount+"项</td>\n" +
                    "                                    <td>"+data.pageIndex+"/"+data.totalPage+"</td>\n" +
                    "                                    <td><a href=\"javascript:;\" onclick='getOrderPage("+pageSize+","+(data.pageIndex-1)+")'>上一页</a><a href=\"javascript:;\" onclick='getOrderPage("+pageSize+","+(data.pageIndex+1)+")'>下一页</a></td>\n" +
                    "                                </tr>"
                $tbody.html(str);
            }
        }
    </script>
    <script>
        //根据登录名查找订单
        function getLikeNameOrder(pageIndex){
            var pageSize = $("[name=pageSize]").val();
            var likeName = $("[name=likeName]").val();
            $.post("/OrderBackServlet?opr=getOrderByLikeName","pageSize="+pageSize+"&pageIndex="+pageIndex+"&likeName="+likeName,callback,"json");
            function callback(data){
                var $tbody = $("tbody");
                $tbody.empty();
                var str = "";
                for(var i=0;i<data.list.length;i++){
                    str += "<tr class=\"gradeX\">\n" +
                        "                                    <td style=\"text-align: center;\">"+(data.list)[i].id+"</td>\n" +
                        "                                    <td style=\"text-align: center;\">"+(data.list)[i].loginName+"</td>\n" +
                        "                                    <td style=\"text-align: center;\">"+(data.list)[i].createTime+"</td>\n" +
                        "                                    <td style=\"text-align: center;\">"+(data.list)[i].cost+"</td>\n" +
                        "                                    <td style=\"text-align: center;\">"+(data.list)[i].userAddress+"</td>\n" +
                        "                                    <td style=\"text-align: center;\">"+((data.list)[i].list)[0].loginName+"</td>\n" +
                        "                                    <td style=\"text-align: center;\">"+((data.list)[i].list)[0].userName+"</td>\n" +
                        "                                    <td style=\"text-align: center;\">"+((data.list)[i].list)[0].mobile+"</td>\n" +
                        "                                \t <td style=\"text-align: center;\">\n" +
                        "                        \t\t\t\t<input type=\"hidden\" value=\"105\"/>\n" +
                        "                        \t\t\t\t<a class=\"btn btn-white btn-bitbucket delete\" title=\"删除\"  href=\"javascript:;\" onclick='deleteOrder("+(data.list)[i].id+")'>\n" +
                        "                           \t\t\t\t\t <i class=\"fa fa-trash-o\" aria-hidden=\"true\"></i>\n" +
                        "                        \t\t\t\t</a>\n" +
                        "                        \t\t\t</td>\n" +
                        "                                </tr> "
                }
                str += "<tr>\n" +
                    "                                    <td>共"+data.totalCount+"项</td>\n" +
                    "                                    <td>"+data.pageIndex+"/"+data.totalPage+"</td>\n" +
                    "                                    <td><a href=\"javascript:;\" onclick='getOrderPage("+pageSize+","+(data.pageIndex-1)+")'>上一页</a><a href=\"javascript:;\" onclick='getOrderPage("+pageSize+","+(data.pageIndex+1)+")'>下一页</a></td>\n" +
                    "                                </tr>"
                $tbody.html(str);
            }
        }
    </script>
    <script>
        //删除订单
        function deleteOrder(id) {
            if(window.confirm("是否删除该订单？")){
                window.location.href = "/OrderBackServlet?opr=deleteOrder&id="+id;
            }
        }
    </script>
</head>

<body class="gray-bg" style="overflow-x:scroll">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12" style="width:2000px;">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5><a href="dingdanliebiao.jsp">订单管理</a></h5>
                    </div>
                    <div class="ibox-content">

                        <table class="table table-striped table-bordered table-hover dataTables-example">
                            <thead>
                                <tr>
                                    每页<input type="text" name="pageSize" value="8"/>条&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="javascript:;" onclick="getLikeNameOrder(1)">查询</a><input type="text" name="likeName" value=""/>
                                </tr>
                                <tr>
                                    <th style="text-align: center;" >订单id</th>
                                    <th style="text-align: center;" >收货人</th>
                                    <th style="text-align: center;">订单时间</th>
                                    <th style="text-align: center;">订单金额</th>
                                    <th style="text-align: center;">收货地址</th>
                                    <th style="text-align: center;">会员账号</th>
                                    <th style="text-align: center;">会员姓名</th>
                                    <th style="text-align: center;">联系方式</th>
                                    <th style="text-align: center;">操作</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<%--<tr class="gradeX">
                                    <td style="text-align: center;">123456</td>
                                    <td style="text-align: center;">123456789</td>
                                    <td style="text-align: center;">某某某</td>
                                    <td style="text-align: center;">1</td>
                                    <td style="text-align: center;">100.00</td>
                                    <td style="text-align: center;">150.00</td>
                                    <td style="text-align: center;">某某某</td>
                                    <td style="text-align: center;">12345678910</td>
                                    <td style="text-align: center;">某某某某某某某某某</td>
                                    
                                    <td style="text-align: center;">
                                    	已完成支付
									</td>
                                    <td  style="text-align: center;" >2017-11-26</td>
                                    <td  style="text-align: center;" >2017-11-26</td>
                                    <td style="text-align: center;">
                                    		<span class="label label-primary">已支付</span>
									</td>
                                    <td  style="text-align: center;" >支付宝</td>
                                    <td  style="text-align: center;" >123456</td>
                                    <td  style="text-align: center;" >某某某</td>
                                    <td  style="text-align: center;" >123456789</td>
                                    <td  style="text-align: center;" > </td>
                                	 <td style="text-align: center;">
                                    	<a class="btn btn-white btn-bitbucket" title="查看" href="admin_dingdan_edit.action?dingdan.id=105">
                           					<i class="fa fa-th-list" aria-hidden="true"></i>
                        				</a>
                        				<input type="hidden" value="105"/>
                        				<a class="btn btn-white btn-bitbucket delete" title="删除"  href="javascript:;">
                           					 <i class="fa fa-trash-o" aria-hidden="true"></i>
                        				</a>
                        			</td>
                                </tr>
                            	
                            	<tr class="gradeX">
                                    <td style="text-align: center;">123456</td>
                                    <td style="text-align: center;">123456789</td>
                                    <td style="text-align: center;">某某某</td>
                                    <td style="text-align: center;">1</td>
                                    <td style="text-align: center;">100.00</td>
                                    <td style="text-align: center;">150.00</td>
                                    <td style="text-align: center;">某某某</td>
                                    <td style="text-align: center;">12345678910</td>
                                    <td style="text-align: center;">某某某某某某某某某</td>
                                    
                                    <td style="text-align: center;">
                                    	已完成支付
									</td>
                                    <td  style="text-align: center;" >2017-11-26</td>
                                    <td  style="text-align: center;" >2017-11-26</td>
                                    <td style="text-align: center;">
                                    		<span class="label label-primary">已支付</span>
									</td>
                                    <td  style="text-align: center;" >支付宝</td>
                                    <td  style="text-align: center;" >123456</td>
                                    <td  style="text-align: center;" >某某某</td>
                                    <td  style="text-align: center;" >123456789</td>
                                    <td  style="text-align: center;" > </td>
                                	 <td style="text-align: center;">
                                    	<a class="btn btn-white btn-bitbucket" title="查看" href="admin_dingdan_edit.action?dingdan.id=105">
                           					<i class="fa fa-th-list" aria-hidden="true"></i>
                        				</a>
                        				<input type="hidden" value="105"/>
                        				<a class="btn btn-white btn-bitbucket delete" title="删除"  href="javascript:;">
                           					 <i class="fa fa-trash-o" aria-hidden="true"></i>
                        				</a>
                        			</td>
                                </tr>
								
                                <tr class="gradeX">
                                    <td style="text-align: center;">123456</td>
                                    <td style="text-align: center;">123456789</td>
                                    <td style="text-align: center;">某某某</td>
                                    <td style="text-align: center;">1</td>
                                    <td style="text-align: center;">100.00</td>
                                    <td style="text-align: center;">150.00</td>
                                    <td style="text-align: center;">某某某</td>
                                    <td style="text-align: center;">12345678910</td>
                                    <td style="text-align: center;">某某某某某某某某某</td>
                                    
                                    <td style="text-align: center;">
                                    	已完成支付
									</td>
                                    <td  style="text-align: center;" >2017-11-26</td>
                                    <td  style="text-align: center;" >2017-11-26</td>
                                    <td style="text-align: center;">
                                    		<span class="label label-primary">已支付</span>
									</td>
                                    <td  style="text-align: center;" >支付宝</td>
                                    <td  style="text-align: center;" >123456</td>
                                    <td  style="text-align: center;" >某某某</td>
                                    <td  style="text-align: center;" >123456789</td>
                                    <td  style="text-align: center;" > </td>
                                	 <td style="text-align: center;">
                                    	<a class="btn btn-white btn-bitbucket" title="查看" href="admin_dingdan_edit.action?dingdan.id=105">
                           					<i class="fa fa-th-list" aria-hidden="true"></i>
                        				</a>
                        				<input type="hidden" value="105"/>
                        				<a class="btn btn-white btn-bitbucket delete" title="删除"  href="javascript:;">
                           					 <i class="fa fa-trash-o" aria-hidden="true"></i>
                        				</a>
                        			</td>
                                </tr>
                                <tr class="gradeX">
                                    <td style="text-align: center;">123456</td>
                                    <td style="text-align: center;">123456789</td>
                                    <td style="text-align: center;">某某某</td>
                                    <td style="text-align: center;">1</td>
                                    <td style="text-align: center;">100.00</td>
                                    <td style="text-align: center;">150.00</td>
                                    <td style="text-align: center;">某某某</td>
                                    <td style="text-align: center;">12345678910</td>
                                    <td style="text-align: center;">某某某某某某某某某</td>
                                    
                                    <td style="text-align: center;">
                                    	已完成支付
									</td>
                                    <td  style="text-align: center;" >2017-11-26</td>
                                    <td  style="text-align: center;" >2017-11-26</td>
                                    <td style="text-align: center;">
                                    		<span class="label label-primary">已支付</span>
									</td>
                                    <td  style="text-align: center;" >支付宝</td>
                                    <td  style="text-align: center;" >123456</td>
                                    <td  style="text-align: center;" >某某某</td>
                                    <td  style="text-align: center;" >123456789</td>
                                    <td  style="text-align: center;" > </td>
                                	 <td style="text-align: center;">
                                    	<a class="btn btn-white btn-bitbucket" title="查看" href="admin_dingdan_edit.action?dingdan.id=105">
                           					<i class="fa fa-th-list" aria-hidden="true"></i>
                        				</a>
                        				<input type="hidden" value="105"/>
                        				<a class="btn btn-white btn-bitbucket delete" title="删除"  href="javascript:;">
                           					 <i class="fa fa-trash-o" aria-hidden="true"></i>
                        				</a>
                        			</td>
                                </tr>      --%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 全局js -->
    <script src="js/jquery.min.js?v=2.1.4"></script>
    <script src="js/bootstrap.min.js?v=3.3.6"></script>
    <script src="js/jquery.jeditable.js"></script>
    <!-- Data Tables -->
    <!-- 页面 分页 -->
    
    <script src="js/dataTables.bootstrap.js"></script>
    <!-- 自定义js -->
    <script src="js/content.js?v=1.0.0"></script>
    <!-- Page-Level Scripts -->
    
    <!-- Sweet alert -->
    <script src="js/sweetalert.min.js"></script>
    <script>
        /*$(document).ready(function () {
        	$(".delete").click(function () {
        		var id=$(this).prev().val();
        		if(confirm("确定删除吗？删除后将无法恢复！")){
        			window.location.href="admin_guanlilyuan_del.action?guanlilyuan.id="+id;
        			return true;
        		}else{
        			return false;
        		}
            });
        	
            $('.dataTables-example').dataTable();
            /!* Init DataTables *!/
            var oTable = $('#editable').dataTable();

            /!* Apply the jEditable handlers to the table *!/
            oTable.$('td').editable('../example_ajax.php', {
                "callback": function (sValue, y) {
                    var aPos = oTable.fnGetPosition(this);
                    oTable.fnUpdate(sValue, aPos[0], aPos[1]);
                },
                "submitdata": function (value, settings) {
                    return {
                        "row_id": this.parentNode.getAttribute('id'),
                        "column": oTable.fnGetPosition(this)[2]
                    };
                },

                "width": "90%",
                "height": "100%"
            });


        });*/

        function fnClickAddRow() {
            $('#editable').dataTable().fnAddData([
                "Custom row",
                "New row",
                "New row",
                "New row",
                "New row"]);

        }
    </script>
    <script src="js/laydate.js"></script>
    <script>
        //外部js调用
        laydate({
            elem: '#hello', //目标元素。由于laydate.js封装了一个轻量级的选择器引擎，因此elem还允许你传入class、tag但必须按照这种方式 '#id .class'
            event: 'focus', //响应事件。如果没有传入event，则按照默认的click
           	format: 'YYYY-MM-DD hh:mm:ss', //日期格式
           	istime: true, //是否开启时间选择
           	isclear: true, //是否显示清空
           	istoday: true, //是否显示今天
           	issure: true, //是否显示确认
           	festival: true, //是否显示节日
           	min: '', //最小日期
           	max: '2099-12-31 23:59:59', //最大日期
           	start: '',    //开始日期
        });
      //外部js调用
        laydate({
            elem: '#hello2', //目标元素。由于laydate.js封装了一个轻量级的选择器引擎，因此elem还允许你传入class、tag但必须按照这种方式 '#id .class'
            event: 'focus', //响应事件。如果没有传入event，则按照默认的click
           	format: 'YYYY-MM-DD hh:mm:ss', //日期格式
           	istime: true, //是否开启时间选择
           	isclear: true, //是否显示清空
           	istoday: true, //是否显示今天
           	issure: true, //是否显示确认
           	festival: true, //是否显示节日
           	min: '', //最小日期
           	max: '2099-12-31 23:59:59', //最大日期
           	start: '',    //开始日期
        });
        //日期范围限制
        var start = {
            elem: '#start',
            format: 'YYYY/MM/DD hh:mm:ss',
            min: laydate.now(), //设定最小日期为当前日期
            max: '2099-06-16 23:59:59', //最大日期
            istime: true,
            istoday: false,
            choose: function (datas) {
                end.min = datas; //开始日选好后，重置结束日的最小日期
                end.start = datas   //将结束日的初始值设定为开始日
            }
        };
        var end = {
            elem: '#end',
            format: 'YYYY/MM/DD hh:mm:ss',
            min: laydate.now(),
            max: '2099-06-16 23:59:59',
            istime: true,
            istoday: false,
            choose: function (datas) {
                start.max = datas; //结束日选好后，重置开始日的最大日期
            }
        };
        laydate(start);
        laydate(end);
    </script>
</body>

</html>
