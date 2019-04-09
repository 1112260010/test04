
<!--_meta 作为公共模版分离出去-->
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> - 基本表单</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link rel="shortcut icon" href="favicon.ico"> <link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">

    <link href="css/custom.css" rel="stylesheet">

    <link href="css/chosen.css" rel="stylesheet">

    <link href="css/bootstrap-colorpicker.min.css" rel="stylesheet">

    <link href="css/cropper.min.css" rel="stylesheet">

    <link href="css/switchery.css" rel="stylesheet">

    <link href="css/jasny-bootstrap.min.css" rel="stylesheet">

    <link href="css/jquery.nouislider.css" rel="stylesheet">

    <link href="css/datepicker3.css" rel="stylesheet">

    <link href="css/ion.rangeSlider.css" rel="stylesheet">
    <link href="css/ion.rangeSlider.skinFlat.css" rel="stylesheet">

    <link href="css/awesome-bootstrap-checkbox.css" rel="stylesheet">

    <link href="css/clockpicker.css" rel="stylesheet">

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
   <script>
		var editor;
		KindEditor.ready(function(K) {
			editor = K.create('textarea[name="hh"]', {
				allowFileManager : true,
				width : "700px",
				height : "400px",
				uploadJson : 'tw/jsp/upload_json.jsp',
				fileManagerJson : 'tw/jsp/file_manager_json.jsp'
			});
			
			K('#selectImg').click(function() {
				editor.loadPlugin('image', function() {
					editor.plugin.imageDialog({
						imageUrl : K('#image').val(),
						clickFn : function(url, title, width, height,
								border, align) {
							K('#image').val(url);
							$("#img_image").attr("src",url);
							editor.hideDialog();
						}
					});
				});
			});
			K('#selectImg2').click(function() {
				editor.loadPlugin('image', function() {
					editor.plugin.imageDialog({
						imageUrl : K('#image2').val(),
						clickFn : function(url, title, width, height,
								border, align) {
							K('#image2').val(url);
							$("#img_image2").attr("src",url);
							editor.hideDialog();
						}
					});
				});
			});
			K('#selectImg3').click(function() {
				editor.loadPlugin('image', function() {
					editor.plugin.imageDialog({
						imageUrl : K('#image3').val(),
						clickFn : function(url, title, width, height,
								border, align) {
							K('#image3').val(url);
							$("#img_image3").attr("src",url);
							editor.hideDialog();
						}
					});
				});
			});
		});
	</script>
	<script>
        function na(){
            var mz = $("#loginName").val();
            var regCode = /^\w{3,16}$/;
            if(regCode.test(mz)){
                $.post("/UserBackServlet?opr=selectByLoginName","loginName="+mz,callback);
                function callback(data){
                    if(data == "error"){
                        alert("登陆名重复，请重新输入");
                    }
                }
            }else{
                alert("登录名必须是3-16位的数字、下划线、字符字母，请重新输入");
            }
        }

        //注册验证
        function yz(str1,regCode,str2){
            var na = $(str1).val();
            if(!regCode.test(na)){
                $(str1).next().html(str2+"错误，请重新输入");
                /*alert(str2+"错误，请重新输入");*/
            }else{
                $(str1).next().empty();
            }
        }

        //验证二次密码
        function pwd(){
            var p1 = $("#password1").val();
            var p2 = $("#password2").val();
            if(p1 != p2){
                $("#password2").next().html("两次密码不一致，请重新输入");
            }else{
                $("#password2").next().empty();
            }
        }
	</script>
</head>
<body class="gray-bg">
	<script src="js/jquery-1.7.2.min_1.js"></script>

    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>会员添加</h5>
                    </div>
                    <div class="ibox-content">
                        <form class="form-horizontal" id="form1" action="/UserBackServlet?opr=register"  method="post">
                        	<input type="hidden" name="user.id" value="">
                        	<div class="form-group">
                        		<label class="col-sm-3 control-label"></label>
                        		<div class="col-sm-8" style="color: red;font-size: 15px">
                                </div>
                        	</div>
								<div class="form-group">
									<label class="col-sm-3 control-label"><span style="color:red;" >*</span>登陆名：</label>
									<div class="col-sm-8" >
										<input type="text" onblur="na()" name="loginName"  placeholder=" 请输入登录名" value="" id="loginName" maxlength="20" class="form-control">
										<span></span>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label"><span style="color:red;" >*</span>用户名：</label>
									<div class="col-sm-8" >
										<input type="text" onblur="yz('#userName',/^\D{2,8}$/,'用户名')" name="userName"  placeholder=" 请输入用户名名" value="" id="userName" maxlength="20" class="form-control">
										<span></span>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label"><span style="color:red;" >*</span>手机号：</label>
									<div class="col-sm-8" >
										<input type="text" onblur="yz('#mobile',/^1[34578]\d{9}$/,'手机号')" name="mobile"  placeholder=" 请输入手机号" value="" maxlength="20" id="mobile" class="form-control">
										<span></span>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label"><span style="color:red;" >*</span>密码：</label>
									<div class="col-sm-8" >
										<input type="password" onblur="yz('#password1',/^\w{3,16}$/,'密码')" name="password1"  placeholder=" 请输入密码" value=""   id="password1" maxlength="20" class="form-control">
										<span></span>
									</div>
								</div>	
								<div class="form-group">
									<label class="col-sm-3 control-label"><span style="color:red;" >*</span>确认密码：</label>
									<div class="col-sm-8" >
										<input type="password" onblur="pwd()" name="password2"  placeholder=" 请确认密码 " value=""  id="password2"  maxlength="20" class="form-control">
										<span></span>
									</div>
								</div>
							<div class="form-group">
								<label class="col-sm-3 control-label"><span style="color:red;" >*</span>性别：</label>
								<div>
									<input type="radio" name="sex" value="1" checked="checked">&nbsp;男&nbsp;&nbsp;
									<input type="radio" name="sex" value="0">&nbsp;女
								</div>
							</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">身份证号：</label>
									<div class="col-sm-8" >
										<input type="text" id="identityCode" onblur="yz('#identityCode',/(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/,'身份证号')" name="identityCode"  placeholder=" 请输入身份证号 " value=""     maxlength="20" class="form-control">
										<span></span>
									</div>
								</div>
							<div class="form-group">
								<label class="col-sm-3 control-label"><span style="color:red;" >*</span>邮箱：</label>
								<div class="col-sm-8" >
									<input type="text" onblur="yz('#email',/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/,'邮箱')" name="email"  placeholder=" 请确认邮箱 " value=""  id="email"  maxlength="20" class="form-control">
									<span></span>
								</div>
							</div>
                           	 <div class="form-group">
                                <div class="col-sm-offset-3 col-sm-8">
                                	<input id="submit" class="btn btn-sm btn-info" type="submit">确认保存</input>
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
