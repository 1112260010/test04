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
                
	<script type="text/javascript" src="js/n_nav.js"></script>   
    
    <script type="text/javascript" src="js/num.js">
    	var jq = jQuery.noConflict();
    </script>     
    
    <script type="text/javascript" src="js/shade.js"></script>
    <script>
        /**/
        (function($){
        if (${sessionScope.list==null}) {
            window.location.href = "/ProductCategoryServlet?opr=pclist";
        }
        })(jQuery)
    </script>
    <script>
        function cl() {
            (function($){
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
                            "                </div>");
                    }
                }
            })(jQuery)
        }
    </script>
    <%--<script>
        //根据名字查找商品
        function cx(pageIndex) {
            (function ($) {
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
                            "<a href='#' class='ss'>收藏</a>" +
                            "<a href='javascript:;' id='" + (data.list)[i].id + "' onclick='addProduct(" + (data.list)[i].id + ","+data.list[i].stock+")'   class='j_car'>加入购物车</a>" +
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
                                "<a href='#' class='ss'>收藏</a>" +
                                "<a href='javascript:;' id='" + (data.list)[i].id + "' onclick='addProduct(" + (data.list)[i].id + ","+data.list[i].stock+")'   class='j_car'>加入购物车</a>" +
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
            })(jQuery)
        }
    </script>--%>
    <script>
        //页面加载
        (function($){
            if (${sessionScope.eu != null && sessionScope.eu.type == 0}) {
                var loginName = "${sessionScope.eu.loginName}";
                var id = "${sessionScope.eu.id}";
                $.post("/ProductCategoryServlet?opr=deleteAll", "loginName=" + loginName, callback, "text");
                    function callback(data){
                        if(data == "success"){
                            var $car = $("#car");
                            var str = "";
                            str += "<div class='car_t'>购物车 [ <span>0</span> ]</div>" +
                                "      <div class='car_bg'>" +
                                "      <ul class='cars'></ul>\n" +
                                "                <div class='price_sum'>共计&nbsp; <font color='#ff4e00'>￥</font><span>0</span></div>\n" +
                                "                <div class='price_a'><a href='/ProductCategoryServlet?opr=getProduct&num=0&loginName=" + loginName + "'>去购物车结算</a></div>\n" +
                                "                </div>";
                            $car.html(str);
                            $(".warning").remove();
                            if(window.confirm("生成订单成功，是否前往用户页面")){
                                window.location.href = "/Member.jsp";
                            }
                        }
                }
            }
        })(jQuery)
    </script>
    <script>
        //根据id查找商品
        function go(id, level, pageIndex) {
            (function ($) {
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
            })(jQuery)
        }

        function getPage(id, level, pageIndex) {
            (function ($) {
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
            })(jQuery)
        }
    </script>
    <script>
        //根据名字查找商品
        function cx(pageIndex) {
            (function ($) {
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
            })(jQuery)
        }
    </script>
    <script>
        //根据id查找商品添加进购物车
        function addProduct(id, stock) {
            (function ($) {
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
                    } else {
                        alert("该商品库存不足，请选择其他类似商品");
                    }
                }
            })(jQuery)
        }
    </script>
<title>易买网</title>
</head>
<body>  
<!--Begin Header Begin-->
<%@include file="common.jsp"%>
<%--<div class="soubg">
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
                <span class="fl">你好，请<a href="Login.jsp">登录</a>&nbsp; <a href="Regist.jsp"
                                                                         style="color:#ff4e00;">免费注册</a></span>
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
<div class="top">
    <div class="logo"><a href="index.jsp"><img src="images/logo.png" /></a></div>
    <div class="search">
    	<form>
        	<input type="text" id="name" name="name" value="" class="s_ipt" />
            <input type="button" value="搜索" class="s_btn" onclick="cx(1)"/>
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
<!--End Header End--> 
<!--Begin Menu Begin-->
<div class="menu_bg">
    <div class="menu">
        <!--Begin 商品分类详情 Begin-->
        <div class="nav">
            <div class="nav_t">全部商品分类</div>
            <div class="leftNav" style="display: none">
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
            &lt;%&ndash;<li><a href="Food.html">美食</a></li>
            <li><a href="Fresh.html">生鲜</a></li>
            <li><a href="HomeDecoration.html">家居</a></li>
            <li><a href="SuitDress.html">女装</a></li>
            <li><a href="MakeUp.html">美妆</a></li>
            <li><a href="Digital.html">数码</a></li>
            <li><a href="GroupBuying.html">团购</a></li>&ndash;%&gt;
        </ul>

        <div class="m_ad">中秋送好礼！</div>
    </div>
</div>--%>
<!--End Menu End--> 
<div class="i_bg">  
    <div class="content mar_20">
    	<img src="images/img3.jpg" />        
    </div>
    
    <!--Begin 第三步：提交订单 Begin -->
    <div class="content mar_20">
    	
        <!--Begin 银行卡支付 Begin -->
    	<div class="warning">        	
            <table border="0" style="width:1000px; text-align:center;" cellspacing="0" cellpadding="0">
              <tr height="35">
                <td style="font-size:18px;">
                	感谢您在本店购物！您的订单已提交成功，请记住您的订单号: <font color="#ff4e00">${requestScope.order.serialNumber}</font>
                </td>
              </tr>
              <tr>
                <td style="font-size:14px; font-family:'宋体'; padding:10px 0 20px 0; border-bottom:1px solid #b6b6b6;">
                	您选定的配送方式为: <font color="#ff4e00">申通快递</font>； &nbsp; &nbsp;您选定的支付方式为: <font color="#ff4e00">银行卡支付</font>； &nbsp; &nbsp;您的应付款金额为: <font color="#ff4e00">￥${requestScope.order.cost}</font>
                </td>
              </tr>
              <tr>
                <td style="padding:20px 0 30px 0; font-family:'宋体';">
                	银行名称 收款人信息：全称 ××× ；帐号或地址 ××× ；开户行 ×××。 <br />
                    注意事项：办理电汇时，请在电汇单“汇款用途”一栏处注明您的订单号。
                </td>
              </tr>
              <tr>
                <td>
                	<a href="#">首页</a> &nbsp; &nbsp; <a href="#">用户中心</a>
                </td>
              </tr>
            </table>        	
        </div>
        <!--Begin 银行卡支付 Begin -->
        
        <!--Begin 支付宝支付 Begin -->
    	<%--<div class="warning">
            <table border="0" style="width:1000px; text-align:center;" cellspacing="0" cellpadding="0">
              <tr height="35">
                <td style="font-size:18px;">
                	感谢您在本店购物！您的订单已提交成功，请记住您的订单号: <font color="#ff4e00">2015092598275</font>
                </td>
              </tr>
              <tr>
                <td style="font-size:14px; font-family:'宋体'; padding:10px 0 20px 0; border-bottom:1px solid #b6b6b6;">
                	您选定的配送方式为: <font color="#ff4e00">申通快递</font>； &nbsp; &nbsp;您选定的支付方式为: <font color="#ff4e00">银行卡</font>； &nbsp; &nbsp;您的应付款金额为: <font color="#ff4e00">￥888.00</font>
                </td>
              </tr>
              <tr>
                <td style="padding:20px 0 30px 0; font-family:'宋体';">
                	支付宝网站(www.alipay.com) 是国内先进的网上支付平台。<br />
                    支付宝收款接口：在线即可开通，零预付，免年费，单笔阶梯费率，无流量限制。<br />
                    <a href="#" style="color:#ff4e00;">立即在线申请</a>
                </td>
              </tr>
              <tr>
                <td>
                	<div class="btn_u" style="margin:0 auto; padding:0 20px; width:120px;"><a href="#">立即使用支付宝支付</a></div>
                	<a href="#">首页</a> &nbsp; &nbsp; <a href="#">用户中心</a>
                </td>
              </tr>
            </table>        	
        </div>--%>
        <!--Begin 支付宝支付 Begin -->
        
        <!--Begin 余额不足 Begin -->
    	<%--<div class="warning">
            <table border="0" style="width:1000px; text-align:center;" cellspacing="0" cellpadding="0">
              <tr>
                <td>
                	<p style="font-size:22px;">提示 !</p>
                    <b style="color:#ff4e00; font-size:16px; font-family:'宋体';">您的余额不足以支付整个订单，请选择其他支付方式</b>
                	<div class="backs"><a href="#">返回上一页</a></div>
                </td>
              </tr>
            </table>        	
        </div>--%>
        <!--Begin 余额不足 Begin -->
        
        
    </div>
	<!--End 第三步：提交订单 End--> 
    
    
    <!--Begin Footer Begin -->
    <div class="b_btm_bg bg_color">
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
