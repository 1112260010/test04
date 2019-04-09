<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title></title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="favicon.ico">
    <link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">

    <!-- Data Tables -->
    <link href="css/dataTables.bootstrap.css" rel="stylesheet">

    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css?v=4.1.0" rel="stylesheet">
	<script type="text/javascript" src="../js/jquery-1.8.2.min.js"></script>
	<script>
        $(function(){
            if(${sessionScope.user != null}) {
                var pageSize = $("[name=pageSize]").val();
                $.post("/ProductBackServlet?opr=getAllProductCategory", "pageSize=" + pageSize + "&pageIndex=1&type=3", callback, "json");

                function callback(data) {
                    var $tbody = $("tbody");
                    $tbody.empty();
                    var str = "";
                    for (var i = 0; i < data.list.length; i++) {
                        var na = ((data.list)[i].list).length == 0 ? "" : ((data.list)[i].list)[0].name;
                        str += "<tr class='gradeX'>" +
                            "<td>" + (data.list)[i].name + "</td>" +
                            "<td>" +
                            "三级分类" +
                            "</td>" +
                            "<td>" + na + "</td>" +
                            "<td class='center' style='text-align: center;'>" +
                            "<a href='/ProductBackServlet?opr=selectProductCategoryById&choose=update&id=" + (data.list)[i].id + "&type=" + (data.list)[i].type + "' title='编辑'>" +
                            "<button class='btn  btn-info'' style='margin-bottom: 0px;padding: 0px 5px;'>" +
                            "<i class='fa fa-pencil-square-o' aria-hidden='true'></i>" +
                            "</button>" +
                            "</a>&nbsp;" +
                            "<a href='javascript:;' onclick='shan3(" + (data.list)[i].id + "," + (data.list)[i].type + ")' title='删除'>" +
                            "<input type='hidden' value='88'/>" +
                            "<button id='delete' class='btn btn-info delete' style='margin-bottom: 0px;padding: 0px 5px;'>" +
                            "<i class='fa fa-trash-o' aria-hidden='true'></i>" +
                            "</button>" +
                            "</a>" +
                            "</td>" +
                            "</tr>";
                    }
                    str += "<tr>\n" +
                        "                                    <td>共" + data.totalCount + "项</td>\n" +
                        "                                    <td>" + data.pageIndex + "/" + data.totalPage + "</td>\n" +
                        "                                    <td><a href=\"javascript:;\" onclick='getProductCategoryPage3(" + pageSize + "," + (data.pageIndex - 1) + ")'>上一页</a><a href=\"javascript:;\" onclick='getProductCategoryPage3(" + pageSize + "," + (data.pageIndex + 1) + ")'>下一页</a></td>\n" +
                        "                                </tr>"
                    $tbody.html(str);
                }
            }
        })
	</script>
	<script>
        //三级菜单分页
        function getProductCategoryPage3(pageSize,pageIndex){
            $.post("/ProductBackServlet?opr=getAllProductCategory","pageSize="+pageSize+"&pageIndex="+pageIndex+"&type=3",callback,"json");
            function callback(data){
                var $tbody = $("tbody");
                $tbody.empty();
                var str = "";
                for(var i=0;i<data.list.length;i++){
                    var na = ((data.list)[i].list).length == 0?"":((data.list)[i].list)[0].name;
                    str += "<tr class='gradeX'>"+
                        "<td>"+(data.list)[i].name+"</td>"+
                        "<td>"+
                        "三级分类"+
                        "</td>"+
                        "<td>"+na+"</td>"+
                        "<td class='center' style='text-align: center;'>"+
                        "<a href='/ProductBackServlet?opr=selectProductCategoryById&choose=update&id="+(data.list)[i].id+"&type="+(data.list)[i].type+"' title='编辑'>"+
                        "<button class='btn  btn-info'' style='margin-bottom: 0px;padding: 0px 5px;'>"+
                        "<i class='fa fa-pencil-square-o' aria-hidden='true'></i>"+
                        "</button>"+
                        "</a>&nbsp;"+
                        "<a href='javascript:;' onclick='shan3("+(data.list)[i].id+","+(data.list)[i].type+")' title='删除'>"+
                        "<input type='hidden' value='88'/>"+
                        "<button id='delete' class='btn btn-info delete' style='margin-bottom: 0px;padding: 0px 5px;'>"+
                        "<i class='fa fa-trash-o' aria-hidden='true'></i>"+
                        "</button>"+
                        "</a>"+
                        "</td>"+
                        "</tr>";
                }
                str += "<tr>\n" +
                    "                                    <td>共"+data.totalCount+"项</td>\n" +
                    "                                    <td>"+data.pageIndex+"/"+data.totalPage+"</td>\n" +
                    "                                    <td><a href=\"javascript:;\" onclick='getProductCategoryPage3("+pageSize+","+(data.pageIndex-1)+")'>上一页</a><a href=\"javascript:;\" onclick='getProductCategoryPage3("+pageSize+","+(data.pageIndex+1)+")'>下一页</a></td>\n" +
                    "                                </tr>"
                $tbody.html(str);
            }
        }
	</script>
	<script>
        //根据名字查询三级菜单
        function getLikeNameProductCategoryPage3(pageIndex){
            var likeName = $("[name=likeName]").val();
            var pageSize = $("[name=pageSize]").val();
            $.post("/ProductBackServlet?opr=selectProductCategoryByName","likeName="+likeName+"&pageSize="+pageSize+"&pageIndex="+pageIndex+"&type=3",callback,"json");
            function callback(data){
                var $tbody = $("tbody");
                $tbody.empty();
                var str = "";
                for(var i=0;i<data.list.length;i++){
                    var na = ((data.list)[i].list).length == 0?"":((data.list)[i].list)[0].name;
                    str += "<tr class='gradeX'>"+
                        "<td>"+(data.list)[i].name+"</td>"+
                        "<td>"+
                        "三级分类"+
                        "</td>"+
                        "<td>"+na+"</td>"+
                        "<td class='center' style='text-align: center;'>"+
                        "<a href='/ProductBackServlet?opr=selectProductCategoryById&choose=update&id="+(data.list)[i].id+"&type="+(data.list)[i].type+"' title='编辑'>"+
                        "<button class='btn  btn-info'' style='margin-bottom: 0px;padding: 0px 5px;'>"+
                        "<i class='fa fa-pencil-square-o' aria-hidden='true'></i>"+
                        "</button>"+
                        "</a>&nbsp;"+
                        "<a href='javascript:;' onclick='shan3("+(data.list)[i].id+","+(data.list)[i].type+")' title='删除'>"+
                        "<input type='hidden' value='88'/>"+
                        "<button id='delete' class='btn btn-info delete' style='margin-bottom: 0px;padding: 0px 5px;'>"+
                        "<i class='fa fa-trash-o' aria-hidden='true'></i>"+
                        "</button>"+
                        "</a>"+
                        "</td>"+
                        "</tr>";
                }
                str += "<tr>\n" +
                    "                                    <td>共"+data.totalCount+"项</td>\n" +
                    "                                    <td>"+data.pageIndex+"/"+data.totalPage+"</td>\n" +
                    "                                    <td><a href=\"javascript:;\" onclick='getProductCategoryPage3("+pageSize+","+(data.pageIndex-1)+")'>上一页</a><a href=\"javascript:;\" onclick='getProductCategoryPage3("+pageSize+","+(data.pageIndex+1)+")'>下一页</a></td>\n" +
                    "                                </tr>"
                $tbody.html(str);
            }
        }
	</script>
	<script>
        //删除三级菜单
        function shan3(id,type){
            if(window.confirm("是否删除该菜单？")){
                window.location.href = "/ProductBackServlet?opr=deleteProductCategory&id="+id+"&type="+type;
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
                        <h5><a href="sanjifenlei.jsp">
                        三级
                        	分类</a> <small></small></h5>
                        <div class="ibox-tools">
                            
                        </div>
                    </div>
                    <div class="ibox-content">

                        <table class="table table-striped table-bordered table-hover">
                            <thead>
								<tr>
									每页<input type="text" name="pageSize" value="5"/>条&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="javascript:;" onclick="getLikeNameProductCategoryPage3(1)">查询</a><input type="text" name="likeName" value=""/>
								</tr>
                                <tr>
                                	<th>名称</th>
                                    <th>类型</th>
                                    
                                    	<th>上级名称</th>
                                    
                                    
                                    <th style="text-align: center;">操作</th>
                                </tr>
                            </thead>
                            <tbody>
                            	
                            	<%--<tr class="gradeX">
                                    <td>鹿茸</td>
                                    <td>
                                    	
                                    	
                                    	
                                    		三级分类
                                    	
                                    </td>
                                    
                                    	<td>保健滋补</td>
                                    
                                	<td class="center" style="text-align: center;">
                                		
	                                    <a href="admin_fenlei_edit.action?fenlei.id=113" title="编辑">
	                                    	<button class="btn  btn-info" style="margin-bottom: 0px;padding: 0px 5px;">
	                                    		<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
	                                    	</button>
	                                    </a>&nbsp;
	                                     <a href="javascript:;" title="删除">
	                                       <input type="hidden" value="113"/>
	                                  	  	<button id="delete" class="btn btn-info delete" style="margin-bottom: 0px;padding: 0px 5px;">
	                                  	  		<i class="fa fa-trash-o" aria-hidden="true"></i>
	                                  	  	</button>
	                                    </a>
                                    </td>
                                </tr>
                            	
                            	<tr class="gradeX">
                                    <td>书房四宝</td>
                                    <td>
                                    	
                                    	
                                    	
                                    		三级分类
                                    	
                                    </td>
                                    
                                    	<td>文玩字画</td>
                                    
                                	<td class="center" style="text-align: center;">
                                		
	                                    <a href="admin_fenlei_edit.action?fenlei.id=112" title="编辑">
	                                    	<button class="btn  btn-info" style="margin-bottom: 0px;padding: 0px 5px;">
	                                    		<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
	                                    	</button>
	                                    </a>&nbsp;
	                                     <a href="javascript:;" title="删除">
	                                       <input type="hidden" value="112"/>
	                                  	  	<button id="delete" class="btn btn-info delete" style="margin-bottom: 0px;padding: 0px 5px;">
	                                  	  		<i class="fa fa-trash-o" aria-hidden="true"></i>
	                                  	  	</button>
	                                    </a>
                                    </td>
                                </tr>
                            	
                            	<tr class="gradeX">
                                    <td>发卡</td>
                                    <td>
                                    	
                                    	
                                    	
                                    		三级分类
                                    	
                                    </td>
                                    
                                    	<td>珠宝配饰</td>
                                    
                                	<td class="center" style="text-align: center;">
                                		
	                                    <a href="admin_fenlei_edit.action?fenlei.id=111" title="编辑">
	                                    	<button class="btn  btn-info" style="margin-bottom: 0px;padding: 0px 5px;">
	                                    		<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
	                                    	</button>
	                                    </a>&nbsp;
	                                     <a href="javascript:;" title="删除">
	                                       <input type="hidden" value="111"/>
	                                  	  	<button id="delete" class="btn btn-info delete" style="margin-bottom: 0px;padding: 0px 5px;">
	                                  	  		<i class="fa fa-trash-o" aria-hidden="true"></i>
	                                  	  	</button>
	                                    </a>
                                    </td>
                                </tr>
                            	
                            	<tr class="gradeX">
                                    <td>戒指</td>
                                    <td>
                                    	
                                    	
                                    	
                                    		三级分类
                                    	
                                    </td>
                                    
                                    	<td>珠宝配饰</td>
                                    
                                	<td class="center" style="text-align: center;">
                                		
	                                    <a href="admin_fenlei_edit.action?fenlei.id=110" title="编辑">
	                                    	<button class="btn  btn-info" style="margin-bottom: 0px;padding: 0px 5px;">
	                                    		<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
	                                    	</button>
	                                    </a>&nbsp;
	                                     <a href="javascript:;" title="删除">
	                                       <input type="hidden" value="110"/>
	                                  	  	<button id="delete" class="btn btn-info delete" style="margin-bottom: 0px;padding: 0px 5px;">
	                                  	  		<i class="fa fa-trash-o" aria-hidden="true"></i>
	                                  	  	</button>
	                                    </a>
                                    </td>
                                </tr>
                            	
                            	<tr class="gradeX">
                                    <td>啤酒</td>
                                    <td>
                                    	
                                    	
                                    	
                                    		三级分类
                                    	
                                    </td>
                                    
                                    	<td>饮品</td>
                                    
                                	<td class="center" style="text-align: center;">
                                		
	                                    <a href="admin_fenlei_edit.action?fenlei.id=109" title="编辑">
	                                    	<button class="btn  btn-info" style="margin-bottom: 0px;padding: 0px 5px;">
	                                    		<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
	                                    	</button>
	                                    </a>&nbsp;
	                                     <a href="javascript:;" title="删除">
	                                       <input type="hidden" value="109"/>
	                                  	  	<button id="delete" class="btn btn-info delete" style="margin-bottom: 0px;padding: 0px 5px;">
	                                  	  		<i class="fa fa-trash-o" aria-hidden="true"></i>
	                                  	  	</button>
	                                    </a>
                                    </td>
                                </tr>
                            	
                            	<tr class="gradeX">
                                    <td>白酒</td>
                                    <td>
                                    	
                                    	
                                    	
                                    		三级分类
                                    	
                                    </td>
                                    
                                    	<td>饮品</td>
                                    
                                	<td class="center" style="text-align: center;">
                                		
	                                    <a href="admin_fenlei_edit.action?fenlei.id=108" title="编辑">
	                                    	<button class="btn  btn-info" style="margin-bottom: 0px;padding: 0px 5px;">
	                                    		<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
	                                    	</button>
	                                    </a>&nbsp;
	                                     <a href="javascript:;" title="删除">
	                                       <input type="hidden" value="108"/>
	                                  	  	<button id="delete" class="btn btn-info delete" style="margin-bottom: 0px;padding: 0px 5px;">
	                                  	  		<i class="fa fa-trash-o" aria-hidden="true"></i>
	                                  	  	</button>
	                                    </a>
                                    </td>
                                </tr>
                            	
                            	<tr class="gradeX">
                                    <td>桌子</td>
                                    <td>
                                    	
                                    	
                                    	
                                    		三级分类
                                    	
                                    </td>
                                    
                                    	<td>家居家纺</td>
                                    
                                	<td class="center" style="text-align: center;">
                                		
	                                    <a href="admin_fenlei_edit.action?fenlei.id=107" title="编辑">
	                                    	<button class="btn  btn-info" style="margin-bottom: 0px;padding: 0px 5px;">
	                                    		<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
	                                    	</button>
	                                    </a>&nbsp;
	                                     <a href="javascript:;" title="删除">
	                                       <input type="hidden" value="107"/>
	                                  	  	<button id="delete" class="btn btn-info delete" style="margin-bottom: 0px;padding: 0px 5px;">
	                                  	  		<i class="fa fa-trash-o" aria-hidden="true"></i>
	                                  	  	</button>
	                                    </a>
                                    </td>
                                </tr>
                            	
                            	<tr class="gradeX">
                                    <td>窗帘</td>
                                    <td>
                                    	
                                    	
                                    	
                                    		三级分类
                                    	
                                    </td>
                                    
                                    	<td>家居家纺</td>
                                    
                                	<td class="center" style="text-align: center;">
                                		
	                                    <a href="admin_fenlei_edit.action?fenlei.id=106" title="编辑">
	                                    	<button class="btn  btn-info" style="margin-bottom: 0px;padding: 0px 5px;">
	                                    		<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
	                                    	</button>
	                                    </a>&nbsp;
	                                     <a href="javascript:;" title="删除">
	                                       <input type="hidden" value="106"/>
	                                  	  	<button id="delete" class="btn btn-info delete" style="margin-bottom: 0px;padding: 0px 5px;">
	                                  	  		<i class="fa fa-trash-o" aria-hidden="true"></i>
	                                  	  	</button>
	                                    </a>
                                    </td>
                                </tr>
                            	
                            	<tr class="gradeX">
                                    <td>电脑</td>
                                    <td>
                                    	
                                    	
                                    	
                                    		三级分类
                                    	
                                    </td>
                                    
                                    	<td>电气数码</td>
                                    
                                	<td class="center" style="text-align: center;">
                                		
	                                    <a href="admin_fenlei_edit.action?fenlei.id=105" title="编辑">
	                                    	<button class="btn  btn-info" style="margin-bottom: 0px;padding: 0px 5px;">
	                                    		<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
	                                    	</button>
	                                    </a>&nbsp;
	                                     <a href="javascript:;" title="删除">
	                                       <input type="hidden" value="105"/>
	                                  	  	<button id="delete" class="btn btn-info delete" style="margin-bottom: 0px;padding: 0px 5px;">
	                                  	  		<i class="fa fa-trash-o" aria-hidden="true"></i>
	                                  	  	</button>
	                                    </a>
                                    </td>
                                </tr>
                            	
                            	<tr class="gradeX">
                                    <td>手机</td>
                                    <td>
                                    	
                                    	
                                    	
                                    		三级分类
                                    	
                                    </td>
                                    
                                    	<td>电气数码</td>
                                    
                                	<td class="center" style="text-align: center;">
                                		
	                                    <a href="admin_fenlei_edit.action?fenlei.id=104" title="编辑">
	                                    	<button class="btn  btn-info" style="margin-bottom: 0px;padding: 0px 5px;">
	                                    		<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
	                                    	</button>
	                                    </a>&nbsp;
	                                     <a href="javascript:;" title="删除">
	                                       <input type="hidden" value="104"/>
	                                  	  	<button id="delete" class="btn btn-info delete" style="margin-bottom: 0px;padding: 0px 5px;">
	                                  	  		<i class="fa fa-trash-o" aria-hidden="true"></i>
	                                  	  	</button>
	                                    </a>
                                    </td>
                                </tr>
                            	
                            	<tr class="gradeX">
                                    <td>包</td>
                                    <td>
                                    	
                                    	
                                    	
                                    		三级分类
                                    	
                                    </td>
                                    
                                    	<td>服饰鞋包</td>
                                    
                                	<td class="center" style="text-align: center;">
                                		
	                                    <a href="admin_fenlei_edit.action?fenlei.id=103" title="编辑">
	                                    	<button class="btn  btn-info" style="margin-bottom: 0px;padding: 0px 5px;">
	                                    		<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
	                                    	</button>
	                                    </a>&nbsp;
	                                     <a href="javascript:;" title="删除">
	                                       <input type="hidden" value="103"/>
	                                  	  	<button id="delete" class="btn btn-info delete" style="margin-bottom: 0px;padding: 0px 5px;">
	                                  	  		<i class="fa fa-trash-o" aria-hidden="true"></i>
	                                  	  	</button>
	                                    </a>
                                    </td>
                                </tr>
                            	
                            	<tr class="gradeX">
                                    <td>羽绒服</td>
                                    <td>
                                    	
                                    	
                                    	
                                    		三级分类
                                    	
                                    </td>
                                    
                                    	<td>服饰鞋包</td>
                                    
                                	<td class="center" style="text-align: center;">
                                		
	                                    <a href="admin_fenlei_edit.action?fenlei.id=102" title="编辑">
	                                    	<button class="btn  btn-info" style="margin-bottom: 0px;padding: 0px 5px;">
	                                    		<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
	                                    	</button>
	                                    </a>&nbsp;
	                                     <a href="javascript:;" title="删除">
	                                       <input type="hidden" value="102"/>
	                                  	  	<button id="delete" class="btn btn-info delete" style="margin-bottom: 0px;padding: 0px 5px;">
	                                  	  		<i class="fa fa-trash-o" aria-hidden="true"></i>
	                                  	  	</button>
	                                    </a>
                                    </td>
                                </tr>
                            	
                            	<tr class="gradeX">
                                    <td>裤子</td>
                                    <td>
                                    	
                                    	
                                    	
                                    		三级分类
                                    	
                                    </td>
                                    
                                    	<td>服饰鞋包</td>
                                    
                                	<td class="center" style="text-align: center;">
                                		
	                                    <a href="admin_fenlei_edit.action?fenlei.id=101" title="编辑">
	                                    	<button class="btn  btn-info" style="margin-bottom: 0px;padding: 0px 5px;">
	                                    		<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
	                                    	</button>
	                                    </a>&nbsp;
	                                     <a href="javascript:;" title="删除">
	                                       <input type="hidden" value="101"/>
	                                  	  	<button id="delete" class="btn btn-info delete" style="margin-bottom: 0px;padding: 0px 5px;">
	                                  	  		<i class="fa fa-trash-o" aria-hidden="true"></i>
	                                  	  	</button>
	                                    </a>
                                    </td>
                                </tr>
                            	
                            	<tr class="gradeX">
                                    <td>鞋子</td>
                                    <td>
                                    	
                                    	
                                    	
                                    		三级分类
                                    	
                                    </td>
                                    
                                    	<td>服饰鞋包</td>
                                    
                                	<td class="center" style="text-align: center;">
                                		
	                                    <a href="admin_fenlei_edit.action?fenlei.id=100" title="编辑">
	                                    	<button class="btn  btn-info" style="margin-bottom: 0px;padding: 0px 5px;">
	                                    		<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
	                                    	</button>
	                                    </a>&nbsp;
	                                     <a href="javascript:;" title="删除">
	                                       <input type="hidden" value="100"/>
	                                  	  	<button id="delete" class="btn btn-info delete" style="margin-bottom: 0px;padding: 0px 5px;">
	                                  	  		<i class="fa fa-trash-o" aria-hidden="true"></i>
	                                  	  	</button>
	                                    </a>
                                    </td>
                                </tr>
                            	
                            	<tr class="gradeX">
                                    <td>口腔用品</td>
                                    <td>
                                    	
                                    	
                                    	
                                    		三级分类
                                    	
                                    </td>
                                    
                                    	<td>美妆个护</td>
                                    
                                	<td class="center" style="text-align: center;">
                                		
	                                    <a href="admin_fenlei_edit.action?fenlei.id=99" title="编辑">
	                                    	<button class="btn  btn-info" style="margin-bottom: 0px;padding: 0px 5px;">
	                                    		<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
	                                    	</button>
	                                    </a>&nbsp;
	                                     <a href="javascript:;" title="删除">
	                                       <input type="hidden" value="99"/>
	                                  	  	<button id="delete" class="btn btn-info delete" style="margin-bottom: 0px;padding: 0px 5px;">
	                                  	  		<i class="fa fa-trash-o" aria-hidden="true"></i>
	                                  	  	</button>
	                                    </a>
                                    </td>
                                </tr>
                            	
                            	<tr class="gradeX">
                                    <td>化妆品</td>
                                    <td>
                                    	
                                    	
                                    	
                                    		三级分类
                                    	
                                    </td>
                                    
                                    	<td>美妆个护</td>
                                    
                                	<td class="center" style="text-align: center;">
                                		
	                                    <a href="admin_fenlei_edit.action?fenlei.id=98" title="编辑">
	                                    	<button class="btn  btn-info" style="margin-bottom: 0px;padding: 0px 5px;">
	                                    		<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
	                                    	</button>
	                                    </a>&nbsp;
	                                     <a href="javascript:;" title="删除">
	                                       <input type="hidden" value="98"/>
	                                  	  	<button id="delete" class="btn btn-info delete" style="margin-bottom: 0px;padding: 0px 5px;">
	                                  	  		<i class="fa fa-trash-o" aria-hidden="true"></i>
	                                  	  	</button>
	                                    </a>
                                    </td>
                                </tr>
                            	
                            	<tr class="gradeX">
                                    <td>厨房电器</td>
                                    <td>
                                    	
                                    	
                                    	
                                    		三级分类
                                    	
                                    </td>
                                    
                                    	<td>厨具厨电</td>
                                    
                                	<td class="center" style="text-align: center;">
                                		
	                                    <a href="admin_fenlei_edit.action?fenlei.id=97" title="编辑">
	                                    	<button class="btn  btn-info" style="margin-bottom: 0px;padding: 0px 5px;">
	                                    		<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
	                                    	</button>
	                                    </a>&nbsp;
	                                     <a href="javascript:;" title="删除">
	                                       <input type="hidden" value="97"/>
	                                  	  	<button id="delete" class="btn btn-info delete" style="margin-bottom: 0px;padding: 0px 5px;">
	                                  	  		<i class="fa fa-trash-o" aria-hidden="true"></i>
	                                  	  	</button>
	                                    </a>
                                    </td>
                                </tr>
                            	
                            	<tr class="gradeX">
                                    <td>文玩</td>
                                    <td>
                                    	
                                    	
                                    	
                                    		三级分类
                                    	
                                    </td>
                                    
                                    	<td>文玩字画</td>
                                    
                                	<td class="center" style="text-align: center;">
                                		
	                                    <a href="admin_fenlei_edit.action?fenlei.id=96" title="编辑">
	                                    	<button class="btn  btn-info" style="margin-bottom: 0px;padding: 0px 5px;">
	                                    		<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
	                                    	</button>
	                                    </a>&nbsp;
	                                     <a href="javascript:;" title="删除">
	                                       <input type="hidden" value="96"/>
	                                  	  	<button id="delete" class="btn btn-info delete" style="margin-bottom: 0px;padding: 0px 5px;">
	                                  	  		<i class="fa fa-trash-o" aria-hidden="true"></i>
	                                  	  	</button>
	                                    </a>
                                    </td>
                                </tr>
                            	
                            	<tr class="gradeX">
                                    <td>家用电器</td>
                                    <td>
                                    	
                                    	
                                    	
                                    		三级分类
                                    	
                                    </td>
                                    
                                    	<td>电气数码</td>
                                    
                                	<td class="center" style="text-align: center;">
                                		
	                                    <a href="admin_fenlei_edit.action?fenlei.id=95" title="编辑">
	                                    	<button class="btn  btn-info" style="margin-bottom: 0px;padding: 0px 5px;">
	                                    		<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
	                                    	</button>
	                                    </a>&nbsp;
	                                     <a href="javascript:;" title="删除">
	                                       <input type="hidden" value="95"/>
	                                  	  	<button id="delete" class="btn btn-info delete" style="margin-bottom: 0px;padding: 0px 5px;">
	                                  	  		<i class="fa fa-trash-o" aria-hidden="true"></i>
	                                  	  	</button>
	                                    </a>
                                    </td>
                                </tr>
                            	
                            	<tr class="gradeX">
                                    <td>家纺</td>
                                    <td>
                                    	
                                    	
                                    	
                                    		三级分类
                                    	
                                    </td>
                                    
                                    	<td>家居家纺</td>
                                    
                                	<td class="center" style="text-align: center;">
                                		
	                                    <a href="admin_fenlei_edit.action?fenlei.id=94" title="编辑">
	                                    	<button class="btn  btn-info" style="margin-bottom: 0px;padding: 0px 5px;">
	                                    		<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
	                                    	</button>
	                                    </a>&nbsp;
	                                     <a href="javascript:;" title="删除">
	                                       <input type="hidden" value="94"/>
	                                  	  	<button id="delete" class="btn btn-info delete" style="margin-bottom: 0px;padding: 0px 5px;">
	                                  	  		<i class="fa fa-trash-o" aria-hidden="true"></i>
	                                  	  	</button>
	                                    </a>
                                    </td>
                                </tr>
                            	
                            	<tr class="gradeX">
                                    <td>配饰</td>
                                    <td>
                                    	
                                    	
                                    	
                                    		三级分类
                                    	
                                    </td>
                                    
                                    	<td>珠宝配饰</td>
                                    
                                	<td class="center" style="text-align: center;">
                                		
	                                    <a href="admin_fenlei_edit.action?fenlei.id=93" title="编辑">
	                                    	<button class="btn  btn-info" style="margin-bottom: 0px;padding: 0px 5px;">
	                                    		<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
	                                    	</button>
	                                    </a>&nbsp;
	                                     <a href="javascript:;" title="删除">
	                                       <input type="hidden" value="93"/>
	                                  	  	<button id="delete" class="btn btn-info delete" style="margin-bottom: 0px;padding: 0px 5px;">
	                                  	  		<i class="fa fa-trash-o" aria-hidden="true"></i>
	                                  	  	</button>
	                                    </a>
                                    </td>
                                </tr>
                            	
                            	<tr class="gradeX">
                                    <td>矿泉水</td>
                                    <td>
                                    	
                                    	
                                    	
                                    		三级分类
                                    	
                                    </td>
                                    
                                    	<td>饮品</td>
                                    
                                	<td class="center" style="text-align: center;">
                                		
	                                    <a href="admin_fenlei_edit.action?fenlei.id=92" title="编辑">
	                                    	<button class="btn  btn-info" style="margin-bottom: 0px;padding: 0px 5px;">
	                                    		<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
	                                    	</button>
	                                    </a>&nbsp;
	                                     <a href="javascript:;" title="删除">
	                                       <input type="hidden" value="92"/>
	                                  	  	<button id="delete" class="btn btn-info delete" style="margin-bottom: 0px;padding: 0px 5px;">
	                                  	  		<i class="fa fa-trash-o" aria-hidden="true"></i>
	                                  	  	</button>
	                                    </a>
                                    </td>
                                </tr>
                            	
                            	<tr class="gradeX">
                                    <td>滋补品</td>
                                    <td>
                                    	
                                    	
                                    	
                                    		三级分类
                                    	
                                    </td>
                                    
                                    	<td>保健滋补</td>
                                    
                                	<td class="center" style="text-align: center;">
                                		
	                                    <a href="admin_fenlei_edit.action?fenlei.id=91" title="编辑">
	                                    	<button class="btn  btn-info" style="margin-bottom: 0px;padding: 0px 5px;">
	                                    		<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
	                                    	</button>
	                                    </a>&nbsp;
	                                     <a href="javascript:;" title="删除">
	                                       <input type="hidden" value="91"/>
	                                  	  	<button id="delete" class="btn btn-info delete" style="margin-bottom: 0px;padding: 0px 5px;">
	                                  	  		<i class="fa fa-trash-o" aria-hidden="true"></i>
	                                  	  	</button>
	                                    </a>
                                    </td>
                                </tr>
                            	
                            	<tr class="gradeX">
                                    <td>毛衣</td>
                                    <td>
                                    	
                                    	
                                    	
                                    		三级分类
                                    	
                                    </td>
                                    
                                    	<td>服饰鞋包</td>
                                    
                                	<td class="center" style="text-align: center;">
                                		
	                                    <a href="admin_fenlei_edit.action?fenlei.id=89" title="编辑">
	                                    	<button class="btn  btn-info" style="margin-bottom: 0px;padding: 0px 5px;">
	                                    		<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
	                                    	</button>
	                                    </a>&nbsp;
	                                     <a href="javascript:;" title="删除">
	                                       <input type="hidden" value="89"/>
	                                  	  	<button id="delete" class="btn btn-info delete" style="margin-bottom: 0px;padding: 0px 5px;">
	                                  	  		<i class="fa fa-trash-o" aria-hidden="true"></i>
	                                  	  	</button>
	                                    </a>
                                    </td>
                                </tr>
                            	
                            	<tr class="gradeX">
                                    <td>饮料</td>
                                    <td>
                                    	
                                    	
                                    	
                                    		三级分类
                                    	
                                    </td>
                                    
                                    	<td>饮品</td>
                                    
                                	<td class="center" style="text-align: center;">
                                		
	                                    <a href="admin_fenlei_edit.action?fenlei.id=87" title="编辑">
	                                    	<button class="btn  btn-info" style="margin-bottom: 0px;padding: 0px 5px;">
	                                    		<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
	                                    	</button>
	                                    </a>&nbsp;
	                                     <a href="javascript:;" title="删除">
	                                       <input type="hidden" value="87"/>
	                                  	  	<button id="delete" class="btn btn-info delete" style="margin-bottom: 0px;padding: 0px 5px;">
	                                  	  		<i class="fa fa-trash-o" aria-hidden="true"></i>
	                                  	  	</button>
	                                    </a>
                                    </td>
                                </tr>
                            	
                            	<tr class="gradeX">
                                    <td>护肤品</td>
                                    <td>
                                    	
                                    	
                                    	
                                    		三级分类
                                    	
                                    </td>
                                    
                                    	<td>美妆个护</td>
                                    
                                	<td class="center" style="text-align: center;">
                                		
	                                    <a href="admin_fenlei_edit.action?fenlei.id=85" title="编辑">
	                                    	<button class="btn  btn-info" style="margin-bottom: 0px;padding: 0px 5px;">
	                                    		<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
	                                    	</button>
	                                    </a>&nbsp;
	                                     <a href="javascript:;" title="删除">
	                                       <input type="hidden" value="85"/>
	                                  	  	<button id="delete" class="btn btn-info delete" style="margin-bottom: 0px;padding: 0px 5px;">
	                                  	  		<i class="fa fa-trash-o" aria-hidden="true"></i>
	                                  	  	</button>
	                                    </a>
                                    </td>
                                </tr>
                            	
                            	<tr class="gradeX">
                                    <td>数码</td>
                                    <td>
                                    	
                                    	
                                    	
                                    		三级分类
                                    	
                                    </td>
                                    
                                    	<td>电气数码</td>
                                    
                                	<td class="center" style="text-align: center;">
                                		
	                                    <a href="admin_fenlei_edit.action?fenlei.id=83" title="编辑">
	                                    	<button class="btn  btn-info" style="margin-bottom: 0px;padding: 0px 5px;">
	                                    		<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
	                                    	</button>
	                                    </a>&nbsp;
	                                     <a href="javascript:;" title="删除">
	                                       <input type="hidden" value="83"/>
	                                  	  	<button id="delete" class="btn btn-info delete" style="margin-bottom: 0px;padding: 0px 5px;">
	                                  	  		<i class="fa fa-trash-o" aria-hidden="true"></i>
	                                  	  	</button>
	                                    </a>
                                    </td>
                                </tr>
                            	
                            	<tr class="gradeX">
                                    <td>项链</td>
                                    <td>
                                    	
                                    	
                                    	
                                    		三级分类
                                    	
                                    </td>
                                    
                                    	<td>珠宝配饰</td>
                                    
                                	<td class="center" style="text-align: center;">
                                		
	                                    <a href="admin_fenlei_edit.action?fenlei.id=81" title="编辑">
	                                    	<button class="btn  btn-info" style="margin-bottom: 0px;padding: 0px 5px;">
	                                    		<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
	                                    	</button>
	                                    </a>&nbsp;
	                                     <a href="javascript:;" title="删除">
	                                       <input type="hidden" value="81"/>
	                                  	  	<button id="delete" class="btn btn-info delete" style="margin-bottom: 0px;padding: 0px 5px;">
	                                  	  		<i class="fa fa-trash-o" aria-hidden="true"></i>
	                                  	  	</button>
	                                    </a>
                                    </td>
                                </tr>
                            	
                            	<tr class="gradeX">
                                    <td>字画</td>
                                    <td>
                                    	
                                    	
                                    	
                                    		三级分类
                                    	
                                    </td>
                                    
                                    	<td>文玩字画</td>
                                    
                                	<td class="center" style="text-align: center;">
                                		
	                                    <a href="admin_fenlei_edit.action?fenlei.id=77" title="编辑">
	                                    	<button class="btn  btn-info" style="margin-bottom: 0px;padding: 0px 5px;">
	                                    		<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
	                                    	</button>
	                                    </a>&nbsp;
	                                     <a href="javascript:;" title="删除">
	                                       <input type="hidden" value="77"/>
	                                  	  	<button id="delete" class="btn btn-info delete" style="margin-bottom: 0px;padding: 0px 5px;">
	                                  	  		<i class="fa fa-trash-o" aria-hidden="true"></i>
	                                  	  	</button>
	                                    </a>
                                    </td>
                                </tr>
                            	
                            	<tr class="gradeX">
                                    <td>居家</td>
                                    <td>
                                    	
                                    	
                                    	
                                    		三级分类
                                    	
                                    </td>
                                    
                                    	<td>家居家纺</td>
                                    
                                	<td class="center" style="text-align: center;">
                                		
	                                    <a href="admin_fenlei_edit.action?fenlei.id=75" title="编辑">
	                                    	<button class="btn  btn-info" style="margin-bottom: 0px;padding: 0px 5px;">
	                                    		<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
	                                    	</button>
	                                    </a>&nbsp;
	                                     <a href="javascript:;" title="删除">
	                                       <input type="hidden" value="75"/>
	                                  	  	<button id="delete" class="btn btn-info delete" style="margin-bottom: 0px;padding: 0px 5px;">
	                                  	  		<i class="fa fa-trash-o" aria-hidden="true"></i>
	                                  	  	</button>
	                                    </a>
                                    </td>
                                </tr>
                            	
                            	<tr class="gradeX">
                                    <td>厨房用品</td>
                                    <td>
                                    	
                                    	
                                    	
                                    		三级分类
                                    	
                                    </td>
                                    
                                    	<td>厨具厨电</td>
                                    
                                	<td class="center" style="text-align: center;">
                                		
	                                    <a href="admin_fenlei_edit.action?fenlei.id=73" title="编辑">
	                                    	<button class="btn  btn-info" style="margin-bottom: 0px;padding: 0px 5px;">
	                                    		<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
	                                    	</button>
	                                    </a>&nbsp;
	                                     <a href="javascript:;" title="删除">
	                                       <input type="hidden" value="73"/>
	                                  	  	<button id="delete" class="btn btn-info delete" style="margin-bottom: 0px;padding: 0px 5px;">
	                                  	  		<i class="fa fa-trash-o" aria-hidden="true"></i>
	                                  	  	</button>
	                                    </a>
                                    </td>
                                </tr>
                            	
                            	<tr class="gradeX">
                                    <td>参</td>
                                    <td>
                                    	
                                    	
                                    	
                                    		三级分类
                                    	
                                    </td>
                                    
                                    	<td>保健滋补</td>
                                    
                                	<td class="center" style="text-align: center;">
                                		
	                                    <a href="admin_fenlei_edit.action?fenlei.id=71" title="编辑">
	                                    	<button class="btn  btn-info" style="margin-bottom: 0px;padding: 0px 5px;">
	                                    		<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
	                                    	</button>
	                                    </a>&nbsp;
	                                     <a href="javascript:;" title="删除">
	                                       <input type="hidden" value="71"/>
	                                  	  	<button id="delete" class="btn btn-info delete" style="margin-bottom: 0px;padding: 0px 5px;">
	                                  	  		<i class="fa fa-trash-o" aria-hidden="true"></i>
	                                  	  	</button>
	                                    </a>
                                    </td>
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
    <script>
        $(document).ready(function () {
        	$(".delete").click(function () {
        		var id=$(this).prev().val();
        		if(confirm("确定删除吗？删除后将无法恢复！")){
        			window.location.href="admin_fenlei_del.action?fenlei.id="+id;
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