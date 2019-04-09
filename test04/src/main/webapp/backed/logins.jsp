
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <title> - 登录</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/login.css" rel="stylesheet">
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script>
        if (window.top !== window.self) {
            window.top.location = window.location;
        }
    </script>
	<script>
       function sub1(){
    	   $("#form").submit();
       }
       $(function () {
  	     //点击图片更换验证码
  	     $("#Verify").click(function(){
  	         $(this).attr("src","SecurityCodeImageAction.action?timestamp="+new Date().getTime());
  	     });
  	 });
    </script>
</head>

<body class="signin">
<script src="js/canvas-nest.min.js" count="200" zindex="-2" opacity="0.8" color="46,190,246" type="text/javascript"></script>
    <div class="signinpanel">
        <div class="row">
            <div class="col-sm-12">
             <form method="post" action="/UserBackServlet?opr=doLogin" id="form" autocomplete="off">
                    <h4 class="no-margins">登录：<font color="red">请维护登录信息完整.</font><a href="tianjiaguanliyuan.jsp">注册</a></h4>
                    <input autocomplete="off" type="text" class="form-control uname" name="loginName" placeholder="登陆名" value=""/>
                    <input autocomplete="off" type="password" class="form-control pword m-b" name="password" placeholder="密码" value=""/>
                    <input name="verifycode" class="form-control pword m-b" type="text" placeholder="验证码" onblur="if(this.value==''){this.value=''}" onclick="if(this.value=='验证码:'){this.value='';}" value="" style="width: 190px;">
          			<img src="images/securitycodeimageaction.action"  id="Verify" style="cursor:hand;height: 30px;float: right;margin-top: -45px;" alt="看不清，换一张"/>
                    <button class="btn btn-success btn-block" onclick="sub1()" >登录</button>
                </form>
            </div>
        </div>
        <div class="signup-footer">
            <div class="pull-left">
            </div>
        </div>
    </div>
</body>
</html>