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
    <link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <!-- Data Tables -->
    <link href="css/dataTables.bootstrap.css" rel="stylesheet">
    <!-- Sweet Alert -->
    <link href="css/sweetalert.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css?v=4.1.0" rel="stylesheet">
    <script type="text/javascript" src="../js/jquery-1.11.1.min_044d0927.js"></script>
    <script type="text/javascript" src="../js/jquery-1.8.2.min.js"></script>
    <script>
        //页面加载就执行
        $(function(){
            if(${sessionScope.user != null}) {
                var pageSize = $("[name=pageSize]").val();
                $.post("/UserBackServlet?opr=selectHuiYuan", "pageSize=" + pageSize + "&pageIndex=1", callback, "json");

                function callback(data) {
                    var $tbody = $(".ibox-content tbody");
                    $tbody.empty();
                    var str = "";
                    for (var i = 0; i < (data.list).length; i++) {
                        var xb = (data.list)[i].sex == 1 ? "男" : "女";
                        str += "<tr class=\"gradeX\">\n" +
                            "                                \t<input id=\"28\" type=\"hidden\" value=\"28\" />\n" +
                            "                                    <td>" + (data.list)[i].loginName + "</td>\n" +
                            "                                    <td>" + (data.list)[i].userName + "</td>\n" +
                            "                                    <td>" + xb + "</td>\n" +
                            "                                    <td>" + (data.list)[i].identityCode + "</td>\n" +
                            "                                    <td>" + (data.list)[i].email + "</td>\n" +
                            "                                    <td>" + (data.list)[i].mobile + "</td>\n" +
                            "                                </tr>"
                    }
                    str += "<tr>\n" +
                        "                                    <td>共" + data.totalCount + "项</td>\n" +
                        "                                    <td>" + data.pageIndex + "/" + data.totalPage + "</td>\n" +
                        "                                    <td><a href=\"javascript:;\" onclick='getUserPage(" + pageSize + "," + (data.pageIndex - 1) + ")'>上一页</a><a href=\"javascript:;\" onclick='getUserPage(" + pageSize + "," + (data.pageIndex + 1) + ")'>下一页</a></td>\n" +
                        "                                </tr>"
                    $tbody.html(str);
                }
            }
        })
    </script>
    <script>
        //会员分页
        function getUserPage(pageSize,pageIndex){
            $.post("/UserBackServlet?opr=selectHuiYuan","pageSize="+pageSize+"&pageIndex="+pageIndex,callback,"json");
            function callback(data){
                var $tbody = $(".ibox-content tbody");
                $tbody.empty();
                var str = "";
                for(var i=0;i<(data.list).length;i++){
                    var xb = (data.list)[i].sex == 1?"男":"女";
                    str += "<tr class=\"gradeX\">\n" +
                        "                                \t<input id=\"28\" type=\"hidden\" value=\"28\" />\n" +
                        "                                    <td>"+(data.list)[i].loginName+"</td>\n" +
                        "                                    <td>"+(data.list)[i].userName+"</td>" +
                        "                                    <td>"+xb+"</td>\n" +
                        "                                    <td>"+(data.list)[i].identityCode+"</td>\n" +
                        "                                    <td>"+(data.list)[i].email+"</td>\n" +
                        "                                    <td>"+(data.list)[i].mobile+"</td>\n" +
                        "                                </tr>"
                }
                str += "<tr>\n" +
                    "                                    <td>共"+data.totalCount+"项</td>\n" +
                    "                                    <td>"+data.pageIndex+"/"+data.totalPage+"</td>\n" +
                    "                                    <td><a href=\"javascript:;\" onclick='getUserPage("+pageSize+","+(data.pageIndex-1)+")'>上一页</a><a href=\"javascript:;\" onclick='getUserPage("+pageSize+","+(data.pageIndex+1)+")'>下一页</a></td>\n" +
                    "                                </tr>"
                $tbody.html(str);
            }
        }
    </script>
    <script>
        //根据名字查找会员
        function getLikeNameUserPage(pageIndex){
            var likeName = $("[name=likeName]").val();
            var pageSize = $("[name=pageSize]").val();
            $.post("/UserBackServlet?opr=selectHuiYuanByName","likeName="+likeName+"&pageSize="+pageSize+"&pageIndex="+pageIndex,callback,"json");
            function callback(data){
                var $tbody = $(".ibox-content tbody");
                $tbody.empty();
                var str = "";
                for(var i=0;i<(data.list).length;i++){
                    var xb = (data.list)[i].sex == 1?"男":"女";
                    str += "<tr class=\"gradeX\">\n" +
                        "                                \t<input id=\"28\" type=\"hidden\" value=\"28\" />\n" +
                        "                                    <td>"+(data.list)[i].loginName+"</td>\n" +
                        "                                    <td>"+(data.list)[i].userName+"</td>\n" +
                        "                                    <td>"+xb+"</td>\n" +
                        "                                    <td>"+(data.list)[i].identityCode+"</td>\n" +
                        "                                    <td>"+(data.list)[i].email+"</td>\n" +
                        "                                    <td>"+(data.list)[i].mobile+"</td>\n" +
                        "                                </tr>"
                }
                str += "<tr>\n" +
                    "                                    <td>共"+data.totalCount+"项</td>\n" +
                    "                                    <td>"+data.pageIndex+"/"+data.totalPage+"</td>\n" +
                    "                                    <td><a href=\"javascript:;\" onclick='getLikeNameUserPage("+(data.pageIndex-1)+")'>上一页</a><a href=\"javascript:;\" onclick='getLikeNameUserPage("+(data.pageIndex+1)+")'>下一页</a></td>\n" +
                    "                                </tr>"
                $tbody.html(str);
            }
        }
    </script>
</head>
<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5><a href="huiyuanliebiao.jsp">会员列表</a></h5>
                        <div class="ibox-tools">
                        </div>
                    </div>
                    <div class="ibox-content">
                        <table class="table table-striped table-bordered table-hover">

                            <thead>
                                <tr>
                                    <th>每页<input type="text" name="pageSize" value="5"/>条</th>
                                    <th></th>
                                    <th><a href="javascript:;" onclick="getLikeNameUserPage(1)">查找登录名</a><input type="text" name="likeName" value=""/></th>
                                </tr>
                                <tr>
                                	<th>登录名</th>
                                    <th>用户名</th>
                                    <th>性别</th>
                                    <th>身份证</th>
                                    <th>邮箱</th>
                                    <th>手机号</th>
                                </tr>
                            </thead>
                            <tbody>
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
    <script src="js/jquery.dataTables.js"></script>
    <script src="js/dataTables.bootstrap.js"></script>
    <!-- 自定义js -->
    <script src="js/content.js?v=1.0.0"></script>
    <!-- Page-Level Scripts -->
    
    <!-- Sweet alert -->
    <script src="js/sweetalert.min.js"></script>
    <script>
        $(document).ready(function () {
        	$(".delete").click(function () {
        		var id=$(this).prev().val();
        		if(confirm("确定删除吗？删除后将无法恢复！")){
        			window.location.href="admin_admin_del.action?admin.id="+id;
        			return true;
        		}else{
        			return false;
        		}
            });
        	
            $('.dataTables-example').dataTable();
            /* Init DataTables */
            var oTable = $('#editable').dataTable();

            /* Apply the jEditable handlers to the table */
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


        });

        function fnClickAddRow() {
            $('#editable').dataTable().fnAddData([
                "Custom row",
                "New row",
                "New row",
                "New row",
                "New row"]);

        }
    </script>
</body>
</html>