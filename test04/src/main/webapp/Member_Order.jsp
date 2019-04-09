<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page isELIgnored="false" %>
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
        
    <script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="js/menu.js"></script>    
        
	<script type="text/javascript" src="js/select.js"></script>

    <script>
        //页面加载
        (function ($) {
            if (${sessionScope.eu != "null" && sessionScope.eu.type == 0}) {
                var loginName = "${sessionScope.eu.loginName}";
                $.post("/ProductCategoryServlet?opr=getProduct", "loginName=" + loginName, callback, "json");
                function callback(data) {
                    var $car = $("#car");
                    var str = "";
                    if (data == null) {
                        str += "<div class='car_t'>购物车 [ <span>0</span> ]</div>" +
                            "      <div class='car_bg'>" +
                            "      <ul class='cars'></ul>\n" +
                            "                <div class='price_sum'>共计&nbsp; <font color='#ff4e00'>￥</font><span>0</span></div>\n" +
                            "                <div class='price_a'><a href='/ProductCategoryServlet?opr=getProduct&num=0&loginName=" + loginName + "'>去购物车结算</a></div>\n" +
                            "                </div>";
                    } else {
                        var length = 0;
                        for (var key1 in data) {
                            length += data[key1].length;
                        }
                        str += "<div class='car_t'>购物车 [ <span>" + length + "</span> ]</div>" +
                            "      <div class='car_bg'>" +
                            "      <ul class='cars'>";
                        var sum = 0;
                        var prices = 0;
                        for (var key in data) {
                            for (var j = 0; j < data[key].length; j++) {
                                if (j == 0) {
                                    str += "<li>\n" +
                                        "                        <div class='img'><a href='#'><img src='files/" + data[key][j].fileName + "' width='58' height='58' /></a></div>\n" +
                                        "                        <div class='name'><a href='#'>" + data[key][j].name + "</a></div>\n" +
                                        "                        <div class='price'><font color='#ff4e00'>￥" + data[key][j].price + "</font> X" + data[key].length + "</div>\n" +
                                        "                    </li>";
                                }
                            }
                            prices = data[key][0].price * data[key].length;
                            sum += prices;
                        }
                        str += "</ul>\n" +
                            "                <div class='price_sum'>共计&nbsp; <font color='#ff4e00'>￥</font><span>" + sum + "</span></div>\n" +
                            "                <div class='price_a'><a href='/ProductCategoryServlet?opr=getProduct&num=" + length + "&loginName=" + loginName + "'>去购物车结算</a></div>\n" +
                            "                </div>";

                    }
                    $car.html(str);
                    var userId = "${sessionScope.eu.id}";
                    $.post("/OrderServlet?opr=selectOrderByUserId","userId="+userId,callback,"json");
                    function callback(data){
                        var $tab = $(".order_tab");
                        $tab.empty();
                        var strTab = "<tr>\n" +
                            "                <td width=\"20%\">订单id</td>\n" +
                            "                <td width=\"25%\">下单时间</td>\n" +
                            "                <td width=\"15%\">订单总金额</td>\n" +
                            "                <td width=\"25%\">收货地址</td>\n" +
                            "              </tr>";
                        for(var k=0;k<data.length;k++){
                            strTab += "<tr>\n" +
                                "                <td><font color=\"#ff4e00\">"+data[k].id+"</font></td>\n" +
                                "                <td>"+data[k].createTime+"</td>\n" +
                                "                <td>￥"+data[k].cost+"</td>\n" +
                                "                <td>"+data[k].userAddress+"</td>\n" +
                                "              </tr>"
                        }
                        $tab.html(strTab);
                    }
                }
            }else{
                alert("请先登录");
                window.location.href = "/Login.jsp";
            }
        })(jQuery)
    </script>
<title>易买网</title>
</head>
<body>  
<!--Begin Header Begin-->
<div class="soubg">
	<div class="sou">
    	<!--Begin 所在收货地区 Begin-->
    	<span class="s_city_b">
        	<span class="fl">送货至：</span>
            <span class="s_city">
            	<span>四川</span>
                <div class="s_city_bg">
                	<div class="s_city_t"></div>
                    <div class="s_city_c">
                    	<h2>请选择所在的收货地区</h2>
                        <table border="0" class="c_tab" style="width:235px; margin-top:10px;" cellspacing="0" cellpadding="0">
                          <tr>
                            <th>A</th>
                            <td class="c_h"><span>安徽</span><span>澳门</span></td>
                          </tr>
                          <tr>
                            <th>B</th>
                            <td class="c_h"><span>北京</span></td>
                          </tr>
                          <tr>
                            <th>C</th>
                            <td class="c_h"><span>重庆</span></td>
                          </tr>
                          <tr>
                            <th>F</th>
                            <td class="c_h"><span>福建</span></td>
                          </tr>
                          <tr>
                            <th>G</th>
                            <td class="c_h"><span>广东</span><span>广西</span><span>贵州</span><span>甘肃</span></td>
                          </tr>
                          <tr>
                            <th>H</th>
                            <td class="c_h"><span>河北</span><span>河南</span><span>黑龙江</span><span>海南</span><span>湖北</span><span>湖南</span></td>
                          </tr>
                          <tr>
                            <th>J</th>
                            <td class="c_h"><span>江苏</span><span>吉林</span><span>江西</span></td>
                          </tr>
                          <tr>
                            <th>L</th>
                            <td class="c_h"><span>辽宁</span></td>
                          </tr>
                          <tr>
                            <th>N</th>
                            <td class="c_h"><span>内蒙古</span><span>宁夏</span></td>
                          </tr>
                          <tr>
                            <th>Q</th>
                            <td class="c_h"><span>青海</span></td>
                          </tr>
                          <tr>
                            <th>S</th>
                            <td class="c_h"><span>上海</span><span>山东</span><span>山西</span><span class="c_check">四川</span><span>陕西</span></td>
                          </tr>
                          <tr>
                            <th>T</th>
                            <td class="c_h"><span>台湾</span><span>天津</span></td>
                          </tr>
                          <tr>
                            <th>X</th>
                            <td class="c_h"><span>西藏</span><span>香港</span><span>新疆</span></td>
                          </tr>
                          <tr>
                            <th>Y</th>
                            <td class="c_h"><span>云南</span></td>
                          </tr>
                          <tr>
                            <th>Z</th>
                            <td class="c_h"><span>浙江</span></td>
                          </tr>
                        </table>
                    </div>
                </div>
            </span>
        </span>
        <!--End 所在收货地区 End-->
        <span class="fr">
        	<c:if test="${sessionScope.eu == null}">
                <span class="fl">你好，请<a href="Login.jsp">登录</a>&nbsp; <a href="Regist.jsp" style="color:#ff4e00;">免费注册</a></span>
            </c:if>
            <c:if test="${sessionScope.eu != null}">
                <span class="fl" id="zx">欢迎你,<a href="Member.jsp">${sessionScope.eu.userName}</a>&nbsp; <a href="#">我的订单</a>&nbsp;|&nbsp;<a
                        href="javascript:;" onclick="cl()">注销</a></span>
            </c:if>
            <script>
                function cl() {
                    (function ($) {
                        if (window.confirm("是否注销?")) {
                            $.post("/UserServlet", "opr=loginOut", callback, "text");

                            function callback(data) {
                                alert("注销成功");
                                $("#zx").replaceWith("<span class=\"fl\">你好，请<a href=\"Login.jsp\">登录</a>&nbsp; <a href=\"../Regist.jsp\" style=\"color:#ff4e00;\">免费注册</a></span>");
                                $("#car").html("<div class=\"car_t\">购物车</div>\n" +
                                    "                <div class=\"car_bg\">\n" +
                                    "                <!--Begin 购物车未登录 Begin-->\n" +
                                    "                <div class=\"un_login\">还未登录！<a href=\"Login.jsp\" style=\"color:#ff4e00;\">马上登录</a> 查看购物车！</div>\n" +
                                    "                <!--End 购物车未登录 End-->\n" +
                                    "                </div>")

                            }
                        }
                    })(jQuery)
                }
            </script>
        	<span class="ss">
            	<div class="ss_list">
                	<a href="#">收藏夹</a>
                    <div class="ss_list_bg">
                    	<div class="s_city_t"></div>
                        <div class="ss_list_c">
                        	<ul>
                            	<li><a href="#">我的收藏夹</a></li>
                                <li><a href="#">我的收藏夹</a></li>
                            </ul>
                        </div>
                    </div>     
                </div>
                <div class="ss_list">
                	<a href="#">客户服务</a>
                    <div class="ss_list_bg">
                    	<div class="s_city_t"></div>
                        <div class="ss_list_c">
                        	<ul>
                            	<li><a href="#">客户服务</a></li>
                                <li><a href="#">客户服务</a></li>
                                <li><a href="#">客户服务</a></li>
                            </ul>
                        </div>
                    </div>    
                </div>
                <div class="ss_list">
                	<a href="#">网站导航</a>
                    <div class="ss_list_bg">
                    	<div class="s_city_t"></div>
                        <div class="ss_list_c">
                        	<ul>
                            	<li><a href="#">网站导航</a></li>
                                <li><a href="#">网站导航</a></li>
                            </ul>
                        </div>
                    </div>    
                </div>
            </span>
            <span class="fl">|&nbsp;关注我们：</span>
            <span class="s_sh"><a href="#" class="sh1">新浪</a><a href="#" class="sh2">微信</a></span>
            <span class="fr">|&nbsp;<a href="#">手机版&nbsp;<img src="images/s_tel.png" align="absmiddle" /></a></span>
        </span>
    </div>
</div>
<div class="m_top_bg">
    <div class="top">
        <div class="m_logo"><a href="index.jsp"><img src="images/logo1.png" /></a></div>
        <div class="m_search">
            <form>
                <input type="text" id="name" name="name" value="" class="m_ipt" />
                <input type="submit" value="搜索" class="m_btn" onclick="cx(1)"/>
            </form>                      
            <span class="fl"><a href="#">咖啡</a><a href="#">iphone 6S</a><a href="#">新鲜美食</a><a href="#">蛋糕</a><a href="#">日用品</a><a href="#">连衣裙</a></span>
        </div>
        <div class="i_car" id="car">
            <div class="car_t">购物车</div>
            <div class="car_bg">
                <!--Begin 购物车未登录 Begin-->
                <div class="un_login">还未登录！<a href="Login.jsp" style="color:#ff4e00;">马上登录</a> 查看购物车！</div>
                <!--End 购物车未登录 End-->
            </div>
        </div>
    </div>
</div>
<!--End Header End--> 
<div class="i_bg bg_color">
    <!--Begin 用户中心 Begin -->
	<div class="m_content">
   		<div class="m_left">
        	<div class="left_n">管理中心</div>
            <div class="left_m">
            	<div class="left_m_t t_bg1">订单中心</div>
                <ul>
                	<li><a href="Member_Order.jsp" class="now">我的订单</a></li>
                    <li><a href="Member_Address.jsp">收货地址</a></li>
                    <li><a href="#">缺货登记</a></li>
                    <li><a href="#">跟踪订单</a></li>
                </ul>
            </div>
            <div class="left_m">
            	<div class="left_m_t t_bg2">会员中心</div>
                <ul>
                	<li><a href="Member_User.jsp">用户信息</a></li>
                    <li><a href="Member_Collect.jsp">我的收藏</a></li>
                    <li><a href="Member_Msg.jsp">我的留言</a></li>
                    <li><a href="Member_Links.jsp">推广链接</a></li>
                    <li><a href="#">我的评论</a></li>
                </ul>
            </div>
            <div class="left_m">
            	<div class="left_m_t t_bg3">账户中心</div>
                <ul>
                	<li><a href="Member_Safe.jsp">账户安全</a></li>
                    <li><a href="Member_Packet.jsp">我的红包</a></li>
                    <li><a href="Member_Money.jsp">资金管理</a></li>
                </ul>
            </div>
            <div class="left_m">
            	<div class="left_m_t t_bg4">分销中心</div>
                <ul>
                	<li><a href="Member_Member.jsp">我的会员</a></li>
                    <li><a href="Member_Results.jsp">我的业绩</a></li>
                    <li><a href="Member_Commission.jsp">我的佣金</a></li>
                    <li><a href="Member_Cash.jsp">申请提现</a></li>
                </ul>
            </div>
        </div>
		<div class="m_right">
            <p></p>
            <div class="mem_tit">我的订单</div>
            <table border="0" class="order_tab" style="width:930px; text-align:center; margin-bottom:30px;" cellspacing="0" cellpadding="0">
              <%--<tr>
                <td width="20%">订单id</td>
                <td width="25%">下单时间</td>
                <td width="15%">订单总金额</td>
                <td width="25%">收货地址</td>
              </tr>--%>
<%--              <tr>
                <td><font color="#ff4e00">2015092823056</font></td>
                <td>2015-09-26   16:45:20</td>
                <td>￥456.00</td>
                <td>未确认，未付款，未发货</td>
                <td>取消订单</td>
              </tr>
              <tr>
                <td><font color="#ff4e00">2015092823056</font></td>
                <td>2015-09-26   16:45:20</td>
                <td>￥456.00</td>
                <td>已确认，已付款，已发货</td>
                <td><font color="#ff4e00">已确认</font></td>
              </tr>
              <tr>
                <td><font color="#ff4e00">2015092823056</font></td>
                <td>2015-09-26   16:45:20</td>
                <td>￥456.00</td>
                <td>未确认，未付款，未发货</td>
                <td>取消订单</td>
              </tr>
              <tr>
                <td><font color="#ff4e00">2015092823056</font></td>
                <td>2015-09-26   16:45:20</td>
                <td>￥456.00</td>
                <td>已确认，已付款，已发货</td>
                <td><font color="#ff4e00">已确认</font></td>
              </tr>
              <tr>
                <td><font color="#ff4e00">2015092823056</font></td>
                <td>2015-09-26   16:45:20</td>
                <td>￥456.00</td>
                <td>未确认，未付款，未发货</td>
                <td>取消订单</td>
              </tr>
              <tr>
                <td><font color="#ff4e00">2015092823056</font></td>
                <td>2015-09-26   16:45:20</td>
                <td>￥456.00</td>
                <td>已确认，已付款，已发货</td>
                <td><font color="#ff4e00">已确认</font></td>
              </tr>
              <tr>
                <td><font color="#ff4e00">2015092823056</font></td>
                <td>2015-09-26   16:45:20</td>
                <td>￥456.00</td>
                <td>未确认，未付款，未发货</td>
                <td>取消订单</td>
              </tr>--%>
            </table>


            <%--<div class="mem_tit">合并订单</div>
            <table border="0" class="order_tab" style="width:930px;"  cellspacing="0" cellpadding="0">
              <tr>
                <td width="135" align="right">主订单</td>
                <td width="220">
                	<select class="jj" name="order1">
                      <option value="0" selected="selected">请选择...</option>
                      <option value="1">2015092626589</option>
                      <option value="2">2015092626589</option>
                      <option value="3">2015092626589</option>
                      <option value="4">2015092626589</option>
                    </select>
                </td>
                <td width="135" align="right">从订单</td>
                <td width="220">
                	<select class="jj" name="order2">
                      <option value="0" selected="selected">请选择...</option>
                      <option value="1">2015092626589</option>
                      <option value="2">2015092626589</option>
                      <option value="3">2015092626589</option>
                      <option value="4">2015092626589</option>
                    </select>
                </td>
                <td><div class="btn_u"><a href="#">合并订单</a></div></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td colspan="4" style="font-family:'宋体'; padding:20px 10px 50px 10px;">
                	订单合并是在发货前将相同状态的订单合并成一新的订单。 <br />
                    收货地址，送货方式等以主定单为准。
                </td>
              </tr>
            </table>--%>

            
        </div>
    </div>
	<!--End 用户中心 End--> 
    <!--Begin Footer Begin -->
    <div class="b_btm_bg b_btm_c">
        <div class="b_btm">
            <table border="0" style="width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;" cellspacing="0" cellpadding="0">
              <tr>
                <td width="72"><img src="images/b1.png" width="62" height="62" /></td>
                <td><h2>正品保障</h2>正品行货  放心购买</td>
              </tr>
            </table>
			<table border="0" style="width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;" cellspacing="0" cellpadding="0">
              <tr>
                <td width="72"><img src="images/b2.png" width="62" height="62" /></td>
                <td><h2>满38包邮</h2>满38包邮 免运费</td>
              </tr>
            </table>
            <table border="0" style="width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;" cellspacing="0" cellpadding="0">
              <tr>
                <td width="72"><img src="images/b3.png" width="62" height="62" /></td>
                <td><h2>天天低价</h2>天天低价 畅选无忧</td>
              </tr>
            </table>
            <table border="0" style="width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;" cellspacing="0" cellpadding="0">
              <tr>
                <td width="72"><img src="images/b4.png" width="62" height="62" /></td>
                <td><h2>准时送达</h2>收货时间由你做主</td>
              </tr>
            </table>
        </div>
    </div>
    <div class="b_nav">
    	<dl>                                                                                            
        	<dt><a href="#">新手上路</a></dt>
            <dd><a href="#">售后流程</a></dd>
            <dd><a href="#">购物流程</a></dd>
            <dd><a href="#">订购方式</a></dd>
            <dd><a href="#">隐私声明</a></dd>
            <dd><a href="#">推荐分享说明</a></dd>
        </dl>
        <dl>
        	<dt><a href="#">配送与支付</a></dt>
            <dd><a href="#">货到付款区域</a></dd>
            <dd><a href="#">配送支付查询</a></dd>
            <dd><a href="#">支付方式说明</a></dd>
        </dl>
        <dl>
        	<dt><a href="#">会员中心</a></dt>
            <dd><a href="#">资金管理</a></dd>
            <dd><a href="#">我的收藏</a></dd>
            <dd><a href="#">我的订单</a></dd>
        </dl>
        <dl>
        	<dt><a href="#">服务保证</a></dt>
            <dd><a href="#">退换货原则</a></dd>
            <dd><a href="#">售后服务保证</a></dd>
            <dd><a href="#">产品质量保证</a></dd>
        </dl>
        <dl>
        	<dt><a href="#">联系我们</a></dt>
            <dd><a href="#">网站故障报告</a></dd>
            <dd><a href="#">购物咨询</a></dd>
            <dd><a href="#">投诉与建议</a></dd>
        </dl>
        <div class="b_tel_bg">
        	<a href="#" class="b_sh1">新浪微博</a>            
        	<a href="#" class="b_sh2">腾讯微博</a>
            <p>
            服务热线：<br />
            <span>400-123-4567</span>
            </p>
        </div>
        <div class="b_er">
            <div class="b_er_c"><img src="images/er.gif" width="118" height="118" /></div>
            <img src="images/ss.png" />
        </div>
    </div>    
    <div class="btmbg">
		<div class="btm">
        	备案/许可证编号：蜀ICP备12009302号-1-www.dingguagua.com   Copyright © 2015-2018 尤洪商城网 All Rights Reserved. 复制必究 , Technical Support: Dgg Group <br />
            <img src="images/b_1.gif" width="98" height="33" /><img src="images/b_2.gif" width="98" height="33" /><img src="images/b_3.gif" width="98" height="33" /><img src="images/b_4.gif" width="98" height="33" /><img src="images/b_5.gif" width="98" height="33" /><img src="images/b_6.gif" width="98" height="33" />
        </div>    	
    </div>
    <!--End Footer End -->    
</div>

</body>


<!--[if IE 6]>
<script src="//letskillie6.googlecode.com/svn/trunk/2/zh_CN.js"></script>
<![endif]-->
</html>
