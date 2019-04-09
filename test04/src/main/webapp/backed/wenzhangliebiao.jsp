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
    <script type="text/javascript" src="../js/jquery-1.8.2.min.js"></script>
    <script>
        $(function(){
            if(${sessionScope.user != null}) {
                var pageSize = $("[name=pageSize]").val();
                $.post("/NewsBackServlet?opr=getAllNews", "pageSize=" + pageSize + "&pageIndex=1", callback, "json");

                function callback(data) {
                    var $tbody = $("tbody");
                    $tbody.empty();
                    var str = "";
                    for (var i = 0; i < data.list.length; i++) {
                        str += "<tr class='gradeX'>" +
                            "<input id='20' type='hidden' value='20' />" +
                            "<td>" + (data.list)[i].title + "</td>" +
                            "<td>" + (data.list)[i].content + "</td>" +
                            "<td>" + (data.list)[i].createTime + "</td>" +
                            "<td><a class='btn btn-white btn-bitbucket' title='编辑' href='/NewsBackServlet?opr=selectNewsById&id=" + (data.list)[i].id + "'>" +
                            "<i class='fa fa-pencil-square-o' aria-hidden='true'></i>" +
                            "</a>" +
                            "<input type='hidden' value='123'/>" +
                            "<a class='btn btn-white btn-bitbucket delete' title='删除'  href='javascript:;' onclick='deleteNews(" + (data.list)[i].id + ")'>" +
                            "<i class='fa fa-trash-o' aria-hidden='true' ></i>" +
                            "</a></td>" +
                            "</tr>";
                    }
                    str += "<tr>\n" +
                        "                                    <td>共" + data.totalCount + "项</td>\n" +
                        "                                    <td>" + data.pageIndex + "/" + data.totalPage + "</td>\n" +
                        "                                    <td><a href=\"javascript:;\" onclick='getNewsPage(" + pageSize + "," + (data.pageIndex - 1) + ")'>上一页</a><a href=\"javascript:;\" onclick='getNewsPage(" + pageSize + "," + (data.pageIndex + 1) + ")'>下一页</a></td>\n" +
                        "                                </tr>"
                    $tbody.html(str);
                }
            }
        })
    </script>
    <script>
        //分页
        function getNewsPage(pageSize,pageIndex){
            $.post("/NewsBackServlet?opr=getAllNews","pageSize="+pageSize+"&pageIndex="+pageIndex,callback,"json");
            function callback(data){
                var $tbody = $("tbody");
                $tbody.empty();
                var str = "";
                for(var i=0;i<data.list.length;i++){
                    str += "<tr class='gradeX'>"+
                        "<input id='20' type='hidden' value='20' />"+
                        "<td>"+(data.list)[i].title+"</td>"+
                        "<td>"+(data.list)[i].content+"</td>"+
                        "<td>"+(data.list)[i].createTime+"</td>"+
                        "<td><a class='btn btn-white btn-bitbucket' title='编辑' href='/NewsBackServlet?opr=selectNewsById&id="+(data.list)[i].id+"'>"+
                        "<i class='fa fa-pencil-square-o' aria-hidden='true'></i>"+
                        "</a>"+
                        "<input type='hidden' value='123'/>"+
                        "<a class='btn btn-white btn-bitbucket delete' title='删除'  href='javascript:;' onclick='deleteNews("+(data.list)[i].id+")'>"+
                        "<i class='fa fa-trash-o' aria-hidden='true' ></i>"+
                        "</a></td>"+
                        "</tr>";
                }
                str += "<tr>\n" +
                    "                                    <td>共"+data.totalCount+"项</td>\n" +
                    "                                    <td>"+data.pageIndex+"/"+data.totalPage+"</td>\n" +
                    "                                    <td><a href=\"javascript:;\" onclick='getNewsPage("+pageSize+","+(data.pageIndex-1)+")'>上一页</a><a href=\"javascript:;\" onclick='getNewsPage("+pageSize+","+(data.pageIndex+1)+")'>下一页</a></td>\n" +
                    "                                </tr>"
                $tbody.html(str);
            }
        }
    </script>
    <script>
        //根据名字查询新闻
        function getLikeNameNews(pageIndex){
            var likeName = $("[name=likeName]").val();
            var pageSize = $("[name=pageSize]").val();
            $.post("/NewsBackServlet?opr=selectNewsByName","likeName="+likeName+"&pageSize="+pageSize+"&pageIndex="+pageIndex,callback,"json");
            function callback(data){
                var $tbody = $("tbody");
                $tbody.empty();
                var str = "";
                for(var i=0;i<data.list.length;i++){
                    str += "<tr class='gradeX'>"+
                        "<input id='20' type='hidden' value='20' />"+
                        "<td>"+(data.list)[i].title+"</td>"+
                        "<td>"+(data.list)[i].content+"</td>"+
                        "<td>"+(data.list)[i].createTime+"</td>"+
                        "<td><a class='btn btn-white btn-bitbucket' title='编辑' href='/NewsBackServlet?opr=selectNewsById&id="+(data.list)[i].id+"'>"+
                        "<i class='fa fa-pencil-square-o' aria-hidden='true'></i>"+
                        "</a>"+
                        "<input type='hidden' value='123'/>"+
                        "<a class='btn btn-white btn-bitbucket delete' title='删除'  href='javascript:;' onclick='deleteNews("+(data.list)[i].id+")'>"+
                        "<i class='fa fa-trash-o' aria-hidden='true' ></i>"+
                        "</a></td>"+
                        "</tr>";
                }
                str += "<tr>\n" +
                    "                                    <td>共"+data.totalCount+"项</td>\n" +
                    "                                    <td>"+data.pageIndex+"/"+data.totalPage+"</td>\n" +
                    "                                    <td><a href=\"javascript:;\" onclick='getNewsPage("+pageSize+","+(data.pageIndex-1)+")'>上一页</a><a href=\"javascript:;\" onclick='getNewsPage("+pageSize+","+(data.pageIndex+1)+")'>下一页</a></td>\n" +
                    "                                </tr>"
                $tbody.html(str);
            }
        }
    </script>
    <script>
        //删除新闻
        function deleteNews(id){
            if(window.confirm("是否删除该新闻？")){
                window.location.href = "/NewsBackServlet?opr=deleteNews&id="+id;
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
                        <h5><a href="wenzhangliebiao.jsp">文章列表</a></h5>
                        <div class="ibox-tools">
                            <a href="wenzhangtianjia.jsp">
                                <button type="button" class="btn btn-default btn-xs">添加</button>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <table class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr>
                                    每页<input type="text" name="pageSize" value="8"/>条&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="javascript:;" onclick="getLikeNameNews(1)">查询</a><input type="text" name="likeName" value=""/>
                                </tr>
                                <tr>
                                	<th>文章标题</th>
                                	<th>文章内容</th>
                                    <th>创建时间</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%--<tr class="gradeX">
                                	<input id="20" type="hidden" value="20" />
                                    <td>文章标题文章标题</td>
									<td>文章内容文章内容文章内容</td>
								    <td>2017-11-20</td> 
								    <td><a class="btn btn-white btn-bitbucket" title="编辑" href="wenzhangtianjia.jsp">
                           					<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                        				</a>
                        				<input type="hidden" value="123"/>
                        				<a class="btn btn-white btn-bitbucket delete" title="删除"  href="#">
                           					 <i class="fa fa-trash-o" aria-hidden="true" ></i>
                        				</a></td>
                                </tr>--%>
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