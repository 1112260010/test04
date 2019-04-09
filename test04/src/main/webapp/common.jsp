<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <%@page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8" %>
    <%@ page import="util.Constants" %>
    <link type="text/css" rel="stylesheet" href="css/style.css"/>
    <!--[if IE 6]>
    <script src="js/iepng.js" type="text/javascript"></script>
    <script type="text/javascript">
        EvPNG.fix('div, ul, img, li, input, a');
    </script>
    <![endif]-->
    <%--<script type="text/javascript" src="js/jquery-1.11.1.min_044d0927.js"></script>
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
        /**/
        if (${sessionScope.list==null}) {
            window.location.href = "/ProductCategoryServlet?opr=pclist";
        }
    </script>
    <script>
        //根据id查找商品
        function go(id, level, pageIndex) {
            $(".postion>span").hide();
            var userId = "${sessionScope.eu.id}";
            $.post("/ProductCategoryServlet?opr=productList", "categoryId=" + id + "&level=" + level + "&pageIndex=" + pageIndex, callback, "json");
            function callback(data) {
                var $product = $(".i_bg");
                $product.children(":first").nextAll().remove();
                var str = "";
                str += "<div class='content mar_20'>" +
                    "<div class='1_history'>" +

                    "<div class='1_list'><div class='list_c'><ul class='cate_list'>";
                for (var i = 0; i < (data.list).length; i++) {
                    str += "<li>\n" +
                        "<div class='img'><a href='/ProductCategoryServlet?opr=product&id=" + (data.list)[i].id + "'><img src='files/" + (data.list)[i].fileName + "' width='210' height='185' /></a></div>" +
                        "<div class='price'>" +
                        "<font>￥<span>" + (data.list)[i].price + "</span></font> &nbsp; 26R" +
                        "</div>" +
                        "<div class='name'><a href='/ProductCategoryServlet?opr=product&id=" + (data.list)[i].id + "'>" + (data.list)[i].name + "</a></div>" +
                        "<div class='carbg'>" +
                        "<a href='/ProductCategoryServlet?opr=doCollect&userId=" + userId + "&productId=" + (data.list)[i].id + "' class='ss'>收藏</a>" +
                        "<a href='javascript:;' id='" + (data.list)[i].id + "' onclick='addProduct(" + (data.list)[i].id + "," + (data.list)[i].stock + ")'   class='j_car'>加入购物车</a>" +
                        "</div>" +
                        "</li>";
                }
                str += "</ul></div></div></div>" +
                    "<div class='pages'>" +
                    "<span>共" + data.totalCount + "条记录&nbsp;&nbsp; " + data.pageIndex + "/" + data.totalPage + "页</span>" +
                    "<a href='javascript:;' onclick='getPage(" + id + "," + level + "," + (data.pageIndex - 1) + ")' class='p_pre' id=" + (data.pageIndex - 1) + ">上一页</a>" +
                    "<a href='javascript:;' onclick='getPage(" + id + "," + level + "," + (data.pageIndex + 1) + ")' class='p_pre' id=" + (data.pageIndex + 1) + ">下一页</a>" +
                    "</div></div>";
                $product.append(str);
            }

        }

        function getPage(id, level, pageIndex) {
            $(".postion>span").hide();
            var userId = "${sessionScope.eu.id}";
            $.post("/ProductCategoryServlet?opr=productList", "categoryId=" + id + "&level=" + level + "&pageIndex=" + pageIndex, callback, "json");
            function callback(data) {
                var $product = $(".i_bg");
                $product.children(":first").nextAll().remove();
                var str = "";
                str += "<div class='content mar_20'>" +
                    "<div class='1_history'>" +

                    "<div class='1_list'><div class='list_c'><ul class='cate_list'>";
                for (var i = 0; i < (data.list).length; i++) {
                    str += "<li>\n" +
                        "<div class='img'><a href='/ProductCategoryServlet?opr=product&id=" + (data.list)[i].id + "'><img src='files/" + (data.list)[i].fileName + "' width='210' height='185' /></a></div>" +
                        "<div class='price'>" +
                        "<font>￥<span>" + (data.list)[i].price + "</span></font> &nbsp; 26R" +
                        "</div>" +
                        "<div class='name'><a href='/ProductCategoryServlet?opr=product&id=" + (data.list)[i].id + "'>" + (data.list)[i].name + "</a></div>" +
                        "<div class='carbg'>" +
                        "<a href='/ProductCategoryServlet?opr=doCollect&userId=" + userId + "&productId=" + (data.list)[i].id + "' class='ss'>收藏</a>" +
                        "<a href='javascript:;' id='" + (data.list)[i].id + "' onclick='addProduct(" + (data.list)[i].id + "," + (data.list)[i].stock + ")'   class='j_car'>加入购物车</a>" +
                        "</div>" +
                        "</li>\n";
                }
                str += "</ul></div></div></div>" +
                    "<div class='pages'>" +
                    "<span>共" + data.totalCount + "条记录&nbsp;&nbsp; " + data.pageIndex + "/" + data.totalPage + "页</span>" +
                    "<a href='javascript:;' onclick='getPage(" + id + "," + level + "," + (data.pageIndex - 1) + ")' class='p_pre' id=" + (data.pageIndex - 1) + ">上一页</a>" +
                    "<a href='javascript:;' onclick='getPage(" + id + "," + level + "," + (data.pageIndex + 1) + ")' class='p_pre' id=" + (data.pageIndex + 1) + ">下一页</a>" +
                    "</div></div>";
                $product.append(str);
            }
        }
    </script>
    <script>
        //根据名字查找商品
        function cx(pageIndex) {
            $(".postion>span").hide();
            var userId = "${sessionScope.eu.id}";
            var na = $("#name").val();
            $.post("/ProductCategoryServlet?opr=selectByName", "name=" + na + "&pageIndex=" + pageIndex, callback, "json");

            function callback(data) {
                var $product = $(".i_bg");
                $product.children(":first").nextAll().remove();
                var str = "";
                str += "<div class='content mar_20'>" +
                    "<div class='1_history'>" +

                    "<div class='1_list'><div class='list_c'><ul class='cate_list'>";
                for (var i = 0; i < (data.list).length; i++) {
                    str += "<li>\n" +
                        "<div class='img'><a href='/ProductCategoryServlet?opr=product&id=" + (data.list)[i].id + "'><img src='files/" + (data.list)[i].fileName + "' width='210' height='185' /></a></div>" +
                        "<div class='price'>" +
                        "<font>￥<span>" + (data.list)[i].price + "</span></font> &nbsp; 26R" +
                        "</div>" +
                        "<div class='name'><a href='/ProductCategoryServlet?opr=product&id=" + (data.list)[i].id + "'>" + (data.list)[i].name + "</a></div>" +
                        "<div class='carbg'>" +
                        "<a href='/ProductCategoryServlet?opr=doCollect&userId=" + userId + "&productId=" + (data.list)[i].id + "' class='ss'>收藏</a>" +
                        "<a href='javascript:;' id='" + (data.list)[i].id + "' onclick='addProduct(" + (data.list)[i].id + "," + data.list[i].stock + ")'   class='j_car'>加入购物车</a>" +
                        "</div>" +
                        "</li>\n";
                }
                str += "</ul></div></div></div>" +
                    "<div class=\"pages\">\n" +
                    "<span>共" + data.totalCount + "条记录&nbsp;&nbsp; " + data.pageIndex + "/" + data.totalPage + "页</span>" +
                    "<a href='javascript:;' onclick='goName(" + na + "," + (data.pageIndex - 1) + ")' class='p_pre' id=" + (data.pageIndex - 1) + ">上一页</a>" +
                    "<a href='javascript:;' onclick='goName(" + na + "," + (data.pageIndex + 1) + ")' class='p_pre' id=" + (data.pageIndex + 1) + ">下一页</a>" +
                    "</div></div>";
                $product.append(str);
            }

            function goName(name, pageIndex) {
                $.post("/ProductCategoryServlet?opr=selectByName", "name=" + name + "&pageIndex=" + pageIndex, callback, "json");

                function callback(data) {
                    var $product = $(".i_bg");
                    $product.children(":first").nextAll().remove();
                    var str = "";
                    str += "<div class='content mar_20'>" +
                        "<div class='1_history'>" +

                        "<div class='1_list'><div class='list_c'><ul class='cate_list'>";
                    for (var i = 0; i < data.length; i++) {
                        str += "<li>\n" +
                            "<div class='img'><a href='/ProductCategoryServlet?opr=product&id=" + data[i].id + "'><img src='files/" + data[i].fileName + "' width='210' height='185' /></a></div>" +
                            "<div class='price'>" +
                            "<font>￥<span>" + data[i].price + "</span></font> &nbsp; 26R" +
                            "</div>" +
                            "<div class='name'><a href='/ProductCategoryServlet?opr=product&id=" + data[i].id + "'>" + data[i].name + "</a></div>" +
                            "<div class='carbg'>" +
                            "<a href='/ProductCategoryServlet?opr=doCollect&userId=" + userId + "&productId=" + (data.list)[i].id + "' class='ss'>收藏</a>" +
                            "<a href='javascript:;' id='" + (data.list)[i].id + "' onclick='addProduct(" + (data.list)[i].id + "," + data.list[i].stock + ")'   class='j_car'>加入购物车</a>" +
                            "</div>" +
                            "</li>\n";
                    }
                    str += "</ul></div></div></div>" +
                        "<div class=\"pages\">\n" +
                        "<span>共" + data.totalCount + "条记录&nbsp;&nbsp; " + data.pageIndex + "/" + data.totalPage + "页</span>" +
                        "<a href='javascript:;' onclick='goName(" + na + "," + (data.pageIndex - 1) + ")' class='p_pre' id=" + (data.pageIndex - 1) + ">上一页</a>" +
                        "<a href='javascript:;' onclick='goName(" + na + "," + (data.pageIndex + 1) + ")' class='p_pre' id=" + (data.pageIndex + 1) + ">下一页</a>" +
                        "</div></div>";
                    $product.append(str);
                }
            }
        }
    </script>
    <script>
        //根据id查找商品添加进购物车
        function addProduct(id, stock) {
            if (${sessionScope.eu == null}) {
                alert("请先登录");
            } else {
                if (stock > 0) {
                    var loginName = "${sessionScope.eu.loginName}";
                    $.post("/ProductCategoryServlet?opr=addProduct", "id=" + id + "&loginName=" + loginName, callback, "json");

                    function callback(data) {
                        var length = 0;
                        var $car = $("#car");
                        for (var key1 in data) {
                            length += data[key1].length;
                        }
                        var str = "<div class='car_t'>购物车 [ <span>" + length + "</span> ]</div>" +
                            "      <div class='car_bg'>" +
                            "      <ul class='cars'>";
                        var sum = 0;
                        var prices = 0;
                        for (var key in data) {
                            for (var j = 0; j < data[key].length; j++) {
                                if (j == 0) {
                                    str += "<li>\n" +
                                        "                        <div class='img'><a href=\"#\"><img src='files/" + data[key][j].fileName + "' width=\"58\" height=\"58\" /></a></div>\n" +
                                        "                        <div class='name'><a href=\"#\">" + data[key][j].name + "</a></div>\n" +
                                        "                        <div class='price'><font color=\"#ff4e00\">￥" + data[key][j].price + "</font> X" + data[key].length + "</div>\n" +
                                        "                    </li>";
                                }
                            }
                            prices = (data[key][0].price) * (data[key].length);
                            sum += prices;
                        }
                        str += "</ul>\n" +
                            "                <div class=\"price_sum\">共计&nbsp; <font color=\"#ff4e00\">￥</font><span>" + sum + "</span></div>\n" +
                            "                <div class=\"price_a\"><a href='/ProductCategoryServlet?opr=getProduct&num=" + length + "&loginName=" + loginName + "'>去购物车结算</a></div>\n" +
                            "                </div>";
                        $car.html(str);
                    }
                }else{
                    alert("该商品库存不足，请选择其他类似商品");
                }
            }
        }
    </script>--%>
    <%--<script>
        //页面加载就执行
        $(function () {
            if (${sessionScope.eu != null}) {
                var loginName = "${sessionScope.eu.loginName}";
                $.post("/ProductCategoryServlet?opr=getProduct", "loginName=" + loginName, callback, "json");

                function callback(data) {
                    var $car = $("#car");
                    var str = "";
                    if (data == null) {
                        str += "<div class='car_t'>购物车 [ <span>0</span> ]</div>" +
                            "      <div class='car_bg'>" +
                            "      <ul class='cars'></ul>\n" +
                            "                <div class=\"price_sum\">共计&nbsp; <font color=\"#ff4e00\">￥</font><span>0</span></div>\n" +
                            "                <div class=\"price_a\"><a href='/ProductCategoryServlet?opr=getProduct&num=0&loginName=" + loginName + "'>去购物车结算</a></div>" +
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
                                        "                        <div class='img'><a href=\"#\"><img src='files/" + data[key][j].fileName + "' width=\"58\" height=\"58\" /></a></div>\n" +
                                        "                        <div class='name'><a href=\"#\">" + data[key][j].name + "</a></div>\n" +
                                        "                        <div class='price'><font color=\"#ff4e00\">￥" + data[key][j].price + "</font> X" + data[key].length + "</div>\n" +
                                        "                    </li>";
                                }
                            }
                            prices = (data[key][0].price) * (data[key].length);
                            sum += prices;
                        }
                        str += "</ul>\n" +
                            "                <div class=\"price_sum\">共计&nbsp; <font color=\"#ff4e00\">￥</font><span>" + sum + "</span></div>\n" +
                            "                <div class=\"price_a\"><a href='/ProductCategoryServlet?opr=getProduct&num=" + length + "&loginName=" + loginName + "'>去购物车结算</a></div>\n" +
                            "                </div>";
                    }
                    $car.html(str);
                }
            }
        })
    </script>--%>

</head>
<body>
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
                        <table border="0" class="c_tab" style="width:235px; margin-top:10px;" cellspacing="0"
                               cellpadding="0">
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

            <c:if test="${sessionScope.eu == null || sessionScope.eu.type != 0}">
                <span class="fl">你好，请<a href="Login.jsp">登录</a>&nbsp; <a href="Regist.jsp"
                                                                         style="color:#ff4e00;">免费注册</a></span>
            </c:if>
            <c:if test="${sessionScope.eu != null && sessionScope.eu.type == 0}">
                <span class="fl" id="zx">欢迎你,<a href="Member.jsp">${sessionScope.eu.userName}</a>&nbsp; <a
                        href="#">我的订单</a>&nbsp;|&nbsp;<a href="javascript:;" onclick="cl()">注销</a></span>
            </c:if>

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
            <span class="fr">|&nbsp;<a href="#">手机版&nbsp;<img src="images/s_tel.png" align="absmiddle"/></a></span>
        </span>
    </div>
</div>
<div class="top">
    <div class="logo"><a href="index.jsp"><img src="images/logo.png"/></a></div>
    <div class="search">
        <form>
            <input type="text" id="name" name="name" value="" class="s_ipt"/>
            <input type="button" value="搜索" class="s_btn" onclick="cx(1)"/>
        </form>
        <span class="fl"><a href="#">咖啡</a><a href="#">iphone 6S</a><a href="#">新鲜美食</a><a href="#">蛋糕</a><a href="#">日用品</a><a
                href="#">连衣裙</a></span>
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
<!--End Header End-->
<!--Begin Menu Begin-->
<div class="menu_bg">
    <div class="menu">
        <!--Begin 商品分类详情 Begin-->
        <div class="nav">
            <div class="nav_t">全部商品分类</div>
            <div class="leftNav none">
                <ul>
                    <c:forEach items="${sessionScope.list}" var="temp1">
                        <li>
                            <div class="fj">
                                <span class="n_img"><img src="images/nav1.png"/></span>
                                <a class="fl" href="javascript:;" id="${temp1.id}"
                                   onclick="go(${temp1.id},1,1)">${temp1.name}</a>
                            </div>
                            <div class="zj">
                                <div class="zj_l">
                                    <c:forEach items="${temp1.list}" var="temp2">
                                        <div class="zj_l_c">
                                            <h2 id="${temp2.id}" onclick="go(${temp2.id},2,1)">${temp2.name}</h2>
                                            <c:forEach items="${temp2.list}" var="temp3">
                                                <a href="javascript:;" id="${temp3.id}"
                                                   onclick="go(${temp3.id},3,1)">${temp3.name}</a>|
                                            </c:forEach>
                                        </div>
                                    </c:forEach>
                                </div>
                                <div class="zj_r">
                                    <a href="#"><img src="images/n_img1.jpg" width="236" height="200"/></a>
                                    <a href="#"><img src="images/n_img2.jpg" width="236" height="200"/></a>
                                </div>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
        <!--End 商品分类详情 End-->
        <ul class="menu_r">
            <li><a href="index.jsp">首页</a></li>
            <c:forEach items="${sessionScope.list}" var="temp">
                <li><a href="javascript:;" id="${temp.id}" onclick="go(${temp.id},1,1)">${temp.name}</a></li>
            </c:forEach>
            <%--<li><a href="Food.html">美食</a></li>
            <li><a href="Fresh.html">生鲜</a></li>
            <li><a href="HomeDecoration.html">家居</a></li>
            <li><a href="SuitDress.html">女装</a></li>
            <li><a href="MakeUp.html">美妆</a></li>
            <li><a href="Digital.html">数码</a></li>
            <li><a href="GroupBuying.html">团购</a></li>--%>
        </ul>

        <div class="m_ad">中秋送好礼！</div>
    </div>
</div>




</body>



</html>
