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
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link rel="shortcut icon" href="favicon.ico">
	<link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="css/custom.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css?v=4.1.0" rel="stylesheet">
    <!-- Sweet Alert -->
    <link href="css/sweetalert.css" rel="stylesheet">
    <script type="text/javascript" src="js/kindeditor-min.js"></script>
	<script type="text/javascript" src="js/kindeditor.js"></script>
    <style type="text/css">
    	.note-editable{
    		height: 200px;
    	}
    </style>
</head>
<body class="gray-bg">
	
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>二级分类修改</h5>
                    </div>
                    <div class="ibox-content">
                        <form class="form-horizontal" id="form1" action="/ProductBackServlet?opr=updateProductCategory&id=${requestScope.pro.id}&type=2"  method="post">
                        	<input type="hidden" name="fenlei.id" value="" />
                        	
                        		<input type="hidden" name="fenlei.lx" value="1" />
                        	
                        	
                        	<input type="hidden" name="fenlei.sjid" value="" />
                        	<input type="hidden" name="fenlei.sjmc" value="" />
                        	<div class="form-group">
                        		<label class="col-sm-3 control-label"></label>
                        		<div class="col-sm-8" style="color: red;font-size: 15px">
                                    
                                </div>
                        	</div>
								<div class="form-group">
									<label class="col-sm-3 control-label"><span style="color:red;" >二级分类</span>名称：</label>
									<div class="col-sm-8" >
										<input type="text" name="name"  placeholder=" 请输入名称 " value="${requestScope.pro.name}" id="name"  maxlength="40" class="form-control">
									</div>
								</div>
							<div style="display:none;">
                          	  	<textarea name="message.content" id="content" class="dfinput" ></textarea>
                            </div>	
								
                            <div class="form-group">
                                <div class="col-sm-offset-3 col-sm-8">
                                	<button id="submit" class="btn btn-sm btn-info" type="submit">确认保存</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 全局js -->
    <script src="js/jquery.min.js?v=2.1.4"></script>
    <script src="js/bootstrap.min.js?v=3.3.6"></script>
    <script src="js/content.js?v=1.0.0"></script>
    <script src="js/sweetalert.min.js"></script>
    <script src="js/icheck.min.js"></script>
    <script src="js/jquery.validate.min.js"></script>
    <script src="js/messages_zh.min.js"></script>

    <script src="js/form-validate-demo.js"></script>
    <script>
    </script>
    <script>
        $(document).ready(function () {
            $('.i-checks').iCheck({
                checkboxClass: 'icheckbox_square-green',
                radioClass: 'iradio_square-green',
            });
        });
    </script>
     <script>
	KindEditor.ready(function(K) {
			editor = K.create('textarea[name="message.content"]', {
				allowFileManager : true,
				filterMode : false,
				width : "670px",
				height : "300px",
				uploadJson : 'tw/jsp/upload_json.jsp',
				fileManagerJson : 'tw/jsp/file_manager_json.jsp'
			});

			K('#selectImg').click(
					function() {
						editor.loadPlugin('image', function() {
							editor.plugin.imageDialog({
								imageUrl : K('#image').val(),
								clickFn : function(url, title, width, height,
										border, align) {
									K('#image').val(url);
									$("#img_image").attr("src", url);
									editor.hideDialog();
								}
							});
						});
					});
		});
	</script>

</body>
</html>
