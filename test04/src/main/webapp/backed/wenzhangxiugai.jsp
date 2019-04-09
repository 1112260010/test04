<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page isELIgnored="false" %>
<!--_meta 作为公共模版分离出去-->
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> - 基本表单</title>
	<link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css?v=4.1.0" rel="stylesheet">
    <!-- Sweet Alert -->
    <link href="css/sweetalert.css" rel="stylesheet">
    <style type="text/css">
    	.note-editable{
    		height: 200px;
    	}
    	select{
    		padding: 0px !important;
    	}
    	.form-control, .single-line{
    		margin-bottom: 3rem;
    	}
    </style>
</head>
<body class="gray-bg" style="overflow: hidden;">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>信息修改</h5>
                    </div>
                    <div class="ibox-content">
                        <form class="form-horizontal" id="form1" action="/NewsBackServlet?opr=updateNews&id=${requestScope.news.id}" method="post" style="padding-left: 10rem;padding-right: 10rem;">
                        	<div class="form-group">
                        		<label class="col-sm-3 control-label"></label>
                        		<div class="col-sm-8" style="color: red;font-size: 15px">
                                    
                                </div>
                        	</div>
                           <div class="row">
							  <div class="col-xs-6">
							  	<div class="form-group">
									<label class="col-sm-3 control-label"><span style="color:red;">*</span>标题：</label>
									<div class="col-sm-8" >
										<input type="text"  class="form-control" id="xingming" value="${requestScope.news.title}" placeholder=" 请输人标题"  name="title" required>
									</div>
								</div>
							  	<!-- 账号 -->
							  	<div class="form-group">
										<label class="col-sm-3 control-label">内容：</label>
										<div class="col-sm-8">
											<!-- 加载编辑器的容器 -->
											<textarea name="content" id="kw_edit" style="width:600px; height:200px">${requestScope.news.content}</textarea>
										</div>
									</div>
							  </div>
						   </div>
						   
						    <div class="row">
							  <div class="col-xs-12" style="text-align: center;">
							  	<input name="xinxi.id" value="" type="hidden"/>
							  	<button id="submit" class="btn btn-sm btn-info" type="submit">确认保存</button>
							  </div>
							</div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
