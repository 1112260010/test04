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
    <style type="text/css">
    	.note-editable{
    		height: 200px;
    	}
    </style>
    <script type="text/javascript" src="../js/jquery-1.8.2.min.js"></script>

</head>
<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>管理员修改</h5>
                    </div>
                    <div class="ibox-content">
                        <form class="form-horizontal"  action="/UserBackServlet?opr=updateAdmin&userId=${requestScope.user.id}" method="post" id="form">
                        	<div class="form-group">
                        		<input type="hidden" name="admin.id" id="guanliyuanid" value="26">
                        		<label class="col-sm-3 control-label"></label>
                        		<div class="col-sm-8" style="color: red;font-size: 15px">
                                </div>
                        	</div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label"><span style="color:red;">*</span>管理员登录名：</label>
                                <div class="col-sm-8">
                                    <input id="loginName"  name="loginName" value="${requestScope.user.loginName}"  type="text"  class="form-control">
                                    <span class="help-block m-b-none"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label"><span style="color:red;">*</span>新用户名：</label>
                                <div class="col-sm-8">
                                    <input id="userName" name="userName" placeholder=" 请输入要使用的用户名" type="text"  class="form-control">
                                    	<span class="help-block m-b-none"><i class="fa fa-info-circle"></i> 不输入默认不修改</span>
                                    
                                </div>
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
    <!-- 自定义js -->
    <script src="js/content.js?v=1.0.0"></script>
    <!-- Sweet alert -->
    <script src="js/sweetalert.min.js"></script>
    <script type="text/javascript">
    	/*$(document).ready(function(){
    		$("#submit").click(function(){
    			 var guanliyuanid = $("#guanliyuanid").val();
	       		 var username = $("#username").val();
	       		 var password = $("#password").val();
	       		 var confirm_password=$("#confirm_password").val();
	   			 var xingming = $("#xingming").val();
	   			 if(!username){
	   				 alert("请输入账号");
	   				 return false;
	   			 }
				 if(password){
					 if(password!=confirm_password){
						 alert("您输入的两次密码不一致，请重新输入！");
						 return false;
					 }
				 }else{
					 if(!guanliyuanid){
					 	alert("请输入密码");
					 	return false;
					 }
				 }
	   			 return true;
    		});
    	});*/
    </script>
  
    <!-- iCheck -->
    <script src="js/icheck.min.js"></script>
    <!-- jQuery Validation plugin javascript-->
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
</body>
</html>
