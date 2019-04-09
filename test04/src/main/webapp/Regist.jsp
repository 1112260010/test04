<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <%@page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8" %>
	<link type="text/css" rel="stylesheet" href="css/style.css" />
    <!--[if IE 6]>
    <script src="js/iepng.js" type="text/javascript"></script>
        <script type="text/javascript">
           EvPNG.fix('div, ul, img, li, input, a'); 
        </script>
    <![endif]-->    
    <script type="text/javascript" src="js/jquery-1.11.1.min_044d0927.js"></script>
	<script type="text/javascript" src="js/jquery.bxslider_e88acd1b.js"></script>
    
    <script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="js/menu.js"></script>    
        
	<script type="text/javascript" src="js/select.js"></script>
    
	<script type="text/javascript" src="js/lrscroll.js"></script>
    
    <script type="text/javascript" src="js/iban.js"></script>
    <script type="text/javascript" src="js/fban.js"></script>
    <script type="text/javascript" src="js/f_ban.js"></script>
    <script type="text/javascript" src="js/mban.js"></script>
    <script type="text/javascript" src="js/bban.js"></script>
    <script type="text/javascript" src="js/hban.js"></script>
    <script type="text/javascript" src="js/tban.js"></script>
    
	<script type="text/javascript" src="js/lrscroll_1.js"></script>

    <script>
        $(function(){
            //登陆名验证
            $("#loginName").blur(function(){
                var na = $(this).val();
                var regCode = /^\w{3,16}$/;
                if(regCode.test(na)){
                    $.post("/UserServlet?opr=selectByLoginName","loginName="+na,callback);
                    function callback(data){
                        if(data == "error"){
                            alert("登陆名重复，请重新输入");
                        }
                    }
                }else{
                    alert("登录名错误，请重新输入");
                }
            })


            /*$("#userName").blur(function(){
                var na = $(this).val();
                var regCode = /^\D{2,8}$/;
                if(!regCode.test(na)){
                    alert("用户名错误，请重新输入");
                }
            })*/

        })
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
            var p1 = $("#password").val();
            var p2 = $("#confirmPassword").val();
            if(p1 != p2){
                $("#confirmPassword").next().html("两次密码不一致，请重新输入");
            }else{
                $("#confirmPassword").next().empty();
            }
        }
    </script>
<title>易买网</title>
</head>
<body>  
<!--Begin Header Begin-->
<div class="soubg">
	<div class="sou">
        <span class="fr">
        	<span class="fl">你好，请<a href="Login.jsp">登录</a>&nbsp; <a href="Regist.jsp" style="color:#ff4e00;">免费注册</a>&nbsp; </span>
            <span class="fl">|&nbsp;关注我们：</span>
            <span class="s_sh"><a href="#" class="sh1">新浪</a><a href="#" class="sh2">微信</a></span>
            <span class="fr">|&nbsp;<a href="#">手机版&nbsp;<img src="images/s_tel.png" align="absmiddle" /></a></span>
        </span>
    </div>
</div>
<!--End Header End--> 
<!--Begin Login Begin-->
<div class="log_bg">	
    <div class="top">
        <div class="logo"><a href="index.jsp"><img src="images/logo.png" /></a></div>
    </div>
	<div class="regist">
    	<div class="log_img"><img src="images/l_img.png" width="611" height="425" /></div>
		<div class="reg_c">
        	<form method="post" action="/UserServlet?opr=register">
            <table border="0" style="width:420px; font-size:14px; margin-top:20px;" cellspacing="0" cellpadding="0">
              <tr height="50" valign="top">
              	<td width="95">&nbsp;</td>
                <td>
                	<span class="fl" style="font-size:24px;">注册</span>
                    <span class="fr">已有商城账号，<a href="Login.jsp" style="color:#ff4e00;">我要登录</a></span>
                </td>
              </tr>
              <tr height="50">
                <td align="right"><font color="#ff4e00">*</font>&nbsp;登陆名 &nbsp;</td>
                <td><input type="text" id="loginName" name="loginName" value="" class="l_user" /></td>
              </tr>
                <tr height="50">
                    <td align="right"><font color="#ff4e00">*</font>&nbsp;用户名 &nbsp;</td>
                    <td><input type="text" id="userName" name="userName" value="" class="l_user" onblur="yz('#userName',/^\D{2,8}$/,'用户名')"/><span></span></td>
                </tr>
              <tr height="50">
                <td align="right"><font color="#ff4e00">*</font>&nbsp;密码 &nbsp;</td>
                <td><input type="password" id="password" name="password" value="" class="l_pwd" onblur="yz('#password',/^\w{3,16}$/,'密码')"/><span></span></td>
              </tr>
              <tr height="50">
                <td align="right"><font color="#ff4e00">*</font>&nbsp;确认密码 &nbsp;</td>
                <td><input type="password" id="confirmPassword" name="confirmPassword" value="" class="l_pwd" onblur="pwd()"/><span></span></td>
              </tr>
                <tr height="50">
                    <td align="right"><font color="#ff4e00">*</font>&nbsp;性别 &nbsp;</td>
                    <td>
                        <input type="radio" name="sex" value="1" checked="checked">&nbsp;男&nbsp;&nbsp;
                        <input type="radio" name="sex" value="0">&nbsp;女
                    </td>
                </tr>
                <tr height="50">
                    <td align="right"><font color="#ff4e00">*</font>&nbsp;身份证号 &nbsp;</td>
                    <td><input type="text" id="identityCode" name="identityCode" value="" class="l_email" onblur="yz('#identityCode',/(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/,'身份证号')"/><span></span></td>
                </tr>
              <tr height="50">
                <td align="right"><font color="#ff4e00">*</font>&nbsp;邮箱 &nbsp;</td>
                <td><input type="text" id="email" name="email" value="" class="l_email" onblur="yz('#email',/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/,'邮箱')"/><span></span></td>
              </tr>
              <tr height="50">
                <td align="right"><font color="#ff4e00">*</font>&nbsp;手机 &nbsp;</td>
                <td><input type="text" id="mobile" name="mobile" value="" class="l_tel" onblur="yz('#mobile',/^1[34578]\d{9}$/,'手机号')"/><span></span></td>
              </tr>
              <tr height="50">
                <td align="right"> <font color="#ff4e00">*</font>&nbsp;验证码 &nbsp;</td>
                <td>
                    <input type="text" value="" class="l_ipt" />
                    <a href="#" style="font-size:12px; font-family:'宋体';">换一张</a>
                </td>
              </tr>
              <tr>
              	<td>&nbsp;</td>
                <td style="font-size:12px; padding-top:20px;">
                	<span style="font-family:'宋体';" class="fl">
                    	<label class="r_rad"><input type="checkbox" checked="checked" /></label><label class="r_txt">我已阅读并接受《用户协议》</label>
                    </span>
                </td>
              </tr>
              <tr height="60">
              	<td>&nbsp;</td>
                <td><input type="submit" value="立即注册" class="log_btn" /></td>
              </tr>
            </table>
            </form>
        </div>
    </div>
</div>
<!--End Login End--> 
<!--Begin Footer Begin-->
<div class="btmbg">
    <div class="btm">
        备案/许可证编号：蜀ICP备12009302号-1-www.dingguagua.com   Copyright © 2015-2018 尤洪商城网 All Rights Reserved. 复制必究 , Technical Support: Dgg Group <br />
        <img src="images/b_1.gif" width="98" height="33" /><img src="images/b_2.gif" width="98" height="33" /><img src="images/b_3.gif" width="98" height="33" /><img src="images/b_4.gif" width="98" height="33" /><img src="images/b_5.gif" width="98" height="33" /><img src="images/b_6.gif" width="98" height="33" />
    </div>    	
</div>
<!--End Footer End -->    

</body>


<!--[if IE 6]>
<script src="//letskillie6.googlecode.com/svn/trunk/2/zh_CN.js"></script>
<![endif]-->
</html>
