<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <%@page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8" %>
    <link type="text/css" rel="stylesheet" href="css/style.css"/>
    <!--[if IE 6]>
    <script src="js/iepng.js" type="text/javascript"></script>
    <script type="text/javascript">
        EvPNG.fix('div, ul, img, li, input, a');
    </script>
    <![endif]-->

    <script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="js/menu.js"></script>

    <script type="text/javascript" src="js/n_nav.js"></script>

    <script type="text/javascript" src="js/select.js"></script>

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
                            "                </div>")
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
        //页面加载就显示
        (function ($) {
            if (${sessionScope.eu != null && sessionScope.eu.type == 0}) {
                var loginName = "${sessionScope.eu.loginName}";
                $.post("/ProductCategoryServlet?opr=getProduct", "loginName=" + loginName, callback, "json");

                function callback(data) {
                    //显示购物车
                    var $car = $("#car");
                    var str = "";
                    if (data == null) {
                        str += "<div class='car_t'>购物车 [ <span>0</span> ]</div>" +
                            "      <div class='car_bg'>" +
                            "      <ul class='cars'></ul>\n" +
                            "                <div class=\"price_sum\">共计&nbsp; <font color=\"#ff4e00\">￥</font><span>0</span></div>\n" +
                            "                <div class=\"price_a\"><a href='/ProductCategoryServlet?opr=getProduct&num=0&loginName=" + loginName + "'>去购物车结算</a></div>\n" +
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
                            prices = data[key][0].price * data[key].length;
                            sum += prices;
                        }
                        str += "</ul>\n" +
                            "                <div class=\"price_sum\">共计&nbsp; <font color=\"#ff4e00\">￥</font><span>" + sum + "</span></div>\n" +
                            "                <div class=\"price_a\"><a href='/ProductCategoryServlet?opr=getProduct&num=" + length + "&loginName=" + loginName + "'>去购物车结算</a></div>\n" +
                            "                </div>";

                        $car.html(str);

                        //显示商品列表
                        var $car_tab = $("#car_tab");
                        $car_tab.empty();
                        var st = "";
                        st += "<tr>\n" +
                            "                <td class='car_th' width='550'>商品名称</td>\n" +
                            "                <td class='car_th' width='140'>属性</td>\n" +
                            "                <td class='car_th' width='150'>购买数量</td>\n" +
                            "                <td class='car_th' width='130'>小计</td>\n" +
                            "                <td class='car_th' width='140'>返还积分</td>\n" +
                            "              </tr>";
                        var c = 0;

                        for (var k in data) {
                            for (var b = 0; b < data[k].length; b++) {
                                if (b == 0) {
                                    if (c % 2 != 0) {
                                        st += "<tr class='car_tr'>"
                                    } else {
                                        st += "<tr>";
                                    }
                                    st += "                <td>\n" +
                                        "                    <div class='c_s_img'><img src='files/" + data[k][b].fileName + "' width='73' height=\"73\" /></div>\n" +
                                        "                    " + data[k][b].name + "\n" +
                                        "                </td>\n" +
                                        "                <td align=\"center\">颜色：灰色</td>\n" +
                                        "                <td align=\"center\">" + data[k].length + "</td>\n" +
                                        "                <td align=\"center\" style=\"color:#ff4e00;\">￥" + (data[k].length * data[k][0].price) + "</td>\n" +
                                        "                <td align=\"center\">26R</td>\n" +
                                        "              </tr>";
                                }
                            }
                            c++;
                        }
                        st += "<tr>\n" +
                            "                <td colspan=\"5\" align=\"right\" style=\"font-family:'Microsoft YaHei';\">\n" +
                            "                    商品总价：￥" + sum + " ； 返还积分 " + (26 * c) + "R  \n" +
                            "                </td>\n" +
                            "              </tr>";
                        $car_tab.html(st);

                        //显示商品总价格
                        var $pri = $("#price");
                        $pri.empty();
                        var s = "";
                        var id = "${sessionScope.eu.id}";
                        var loginName = "${sessionScope.eu.loginName}";
                        var address1 = "${sessionScope.addressList[0].address}";
                        var price1 = sum+15+15+15;
                        s += "<tr>\n" +
                            "                    <td align=\"right\">\n" +
                            "                        该订单完成后，您将获得 <font color=\"#ff4e00\">" + 26 * c + "</font> 积分 ，以及价值 <font color=\"#ff4e00\">￥0.00</font> 的红包\n" +
                            "                        <br/>\n" +
                            "                        商品总价: <font color='#ff4e00'>￥" + sum + "</font> + 配送费用: <font color='#ff4e00'>￥15.00</font>\n" +
                            "                        +包装费用: <font color=‘#ff4e00’>￥15.00</font>+贺卡费用: <font color=‘#ff4e00’>￥15.00</font>" +
                            "                    </td>\n" +
                            "                </tr>\n" +
                            "                <tr height=\"70\">\n" +
                            "                    <td align=\"right\">\n" +
                            "                        <b style=\"font-size:14px;\">应付款金额：<span style=\"font-size:22px; color:#ff4e00;\">￥" + (sum + 15 + 15 + 15) + "</span></b>\n" +
                            "                    </td>\n" +
                            "                </tr>\n" +
                            "                <tr height=\"70\">\n" +
                            "                    <td align=\"right\"><a href='/OrderServlet?opr=addOrder&id="+id+"&loginName="+loginName+"&address="+address1+"&cost="+price1+"'><img src=\"images/btn_sure.gif\"/></a></td>\n" +
                            "                </tr>";
                        $pri.html(s);
                    }
                    //加载用户地址
                    if (${sessionScope.addressList[0] == null}) {
                        $("#address").replaceWith("<div class=\"mem_tit\">\n" +
                            "            \t<a href='Member_Address.jsp'><img src=\"images/add_ad.gif\" /></a>\n" +
                            "            </div>");

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
        <img src="images/img2.jpg"/>
    </div>

    <!--Begin 第二步：确认订单信息 Begin -->
    <div class="content mar_20">
        <div class="two_bg">
            <div class="two_t">
                <span class="fr"><a href="BuyCar.jsp">修改</a></span>商品列表
            </div>
            <table border="0" id="car_tab" class="car_tab" style="width:1110px;" cellspacing="0" cellpadding="0">
                <%--<tr>
                  <td class="car_th" width="550">商品名称</td>
                  <td class="car_th" width="140">属性</td>
                  <td class="car_th" width="150">购买数量</td>
                  <td class="car_th" width="130">小计</td>
                  <td class="car_th" width="140">返还积分</td>
                </tr>
                <tr>
                  <td>
                      <div class="c_s_img"><img src="images/c_1.jpg" width="73" height="73" /></div>
                      Rio 锐澳 水蜜桃味白兰地鸡尾酒（预调酒） 275ml
                  </td>
                  <td align="center">颜色：灰色</td>
                  <td align="center">1</td>
                  <td align="center" style="color:#ff4e00;">￥620.00</td>
                  <td align="center">26R</td>
                </tr>
                <tr class="car_tr">
                  <td>
                      <div class="c_s_img"><img src="images/c_2.jpg" width="73" height="73" /></div>
                      Rio 锐澳 水蜜桃味白兰地鸡尾酒（预调酒） 275ml
                  </td>
                  <td align="center">颜色：灰色</td>
                  <td align="center">1</td>
                  <td align="center" style="color:#ff4e00;">￥620.00</td>
                  <td align="center">26R</td>
                </tr>
                <tr>
                  <td>
                      <div class="c_s_img"><img src="images/c_3.jpg" width="73" height="73" /></div>
                      Rio 锐澳 水蜜桃味白兰地鸡尾酒（预调酒） 275ml
                  </td>
                  <td align="center">颜色：灰色</td>
                  <td align="center">1</td>
                  <td align="center" style="color:#ff4e00;">￥620.00</td>
                  <td align="center">26R</td>
                </tr>
                <tr>
                  <td colspan="5" align="right" style="font-family:'Microsoft YaHei';">
                      商品总价：￥1899.00 ； 返还积分 56R
                  </td>
                </tr>--%>
            </table>

            <div class="two_t" id="address">
                <span class="fr"><a href="Member_Address.jsp">修改</a></span>收货人信息
            </div>
            <table border="0" id="user" class="peo_tab" style="width:1110px;" cellspacing="0" cellpadding="0">
                <c:forEach items="${sessionScope.addressList}" var="item" begin="0" end="0">
                    <tr>
                        <td class="p_td" width="160">登录名</td>
                        <td width="395">${sessionScope.eu.userName}</td>
                        <td class="p_td" width="160">电子邮件</td>
                        <td width="395">${sessionScope.eu.email}</td>
                    </tr>
                    <tr>
                        <td class="p_td">备注地址</td>
                        <td>${item.remark}</td>
                        <td class="p_td">详细地址</td>
                        <td>${item.address}</td>
                    </tr>
                    <tr>
                        <td class="p_td">电话</td>
                        <td></td>
                        <td class="p_td">手机</td>
                        <td>${sessionScope.eu.mobile}</td>
                    </tr>
                    <tr>
                        <td class="p_td">标志建筑</td>
                        <td>世纪桃源大酒店</td>
                        <td class="p_td">最佳送货时间</td>
                        <td></td>
                    </tr>
                </c:forEach>
            </table>
            <div class="two_t">
                配送方式
            </div>
            <table border="0" id="ps" class="car_tab" style="width:1110px;" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="car_th" width="80"></td>
                    <td class="car_th" width="200">名称</td>
                    <td class="car_th" width="370">订购描述</td>
                    <td class="car_th" width="150">费用</td>
                    <td class="car_th" width="135">免费额度</td>
                    <td class="car_th" width="175">保价费用</td>
                </tr>
                <tr>
                    <td align="center"><input type="radio" name="ch" checked="checked"/></td>
                    <td align="center" style="font-size:14px;"><b>申通快递</b></td>
                    <td>江、浙、沪地区首重为15元/KG，其他地区18元/KG，续重均为5-6元/KG， 云南地区为8元</td>
                    <td align="center">￥15.00</td>
                    <td align="center">￥0.00</td>
                    <td align="center">不支持保价</td>
                </tr>
                <tr>
                    <td align="center"><input type="radio" name="ch"/></td>
                    <td align="center" style="font-size:14px;"><b>城际快递</b></td>
                    <td>运费固定</td>
                    <td align="center">￥15.00</td>
                    <td align="center">￥0.00</td>
                    <td align="center">不支持保价</td>
                </tr>
                <tr>
                    <td align="center"><input type="radio" name="ch"/></td>
                    <td align="center" style="font-size:14px;"><b>邮局平邮</b></td>
                    <td>运费固定</td>
                    <td align="center">￥15.00</td>
                    <td align="center">￥0.00</td>
                    <td align="center">不支持保价</td>
                </tr>
                <tr>
                    <td colspan="6">
                        <span class="fr"><label class="r_rad"><input type="radio" name="baojia"/></label><label
                                class="r_txt">配送是否需要保价</label></span>
                    </td>
                </tr>
            </table>

            <div class="two_t">
                支付方式
            </div>
            <ul class="pay">
                <li class="checked">银行卡支付
                    <div class="ch_img"></div>
                </li>
                <li>余额支付
                    <div class="ch_img"></div>
                </li>
                <li>货到付款
                    <div class="ch_img"></div>
                </li>
                <li>支付宝
                    <div class="ch_img"></div>
                </li>
            </ul>

            <div class="two_t">
                商品包装
            </div>
            <table border="0" class="car_tab" style="width:1110px;" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="car_th" width="80"></td>
                    <td class="car_th" width="490">名称</td>
                    <td class="car_th" width="180">费用</td>
                    <td class="car_th" width="180">免费额度</td>
                    <td class="car_th" width="180">图片</td>
                </tr>
                <tr>
                    <td align="center"><input type="checkbox" name="pack" checked="checked"/></td>
                    <td><b style="font-size:14px;">不要包装</b></td>
                    <td align="center">￥15.00</td>
                    <td align="center">￥0.00</td>
                    <td align="center"></td>
                </tr>
                <tr>
                    <td align="center"><input type="checkbox" name="pack"/></td>
                    <td><b style="font-size:14px;">精品包装</b></td>
                    <td align="center">￥15.00</td>
                    <td align="center">￥0.00</td>
                    <td align="center"><a href="#" style="color:#ff4e00;">查看</a></td>
                </tr>
            </table>

            <div class="two_t">
                祝福贺卡
            </div>
            <table border="0" class="car_tab" style="width:1110px;" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="car_th" width="80"></td>
                    <td class="car_th" width="490">名称</td>
                    <td class="car_th" width="180">费用</td>
                    <td class="car_th" width="180">免费额度</td>
                    <td class="car_th" width="180">图片</td>
                </tr>
                <tr>
                    <td align="center"><input type="checkbox" name="wish" checked="checked"/></td>
                    <td><b style="font-size:14px;">不要贺卡</b></td>
                    <td align="center">￥15.00</td>
                    <td align="center">￥0.00</td>
                    <td align="center"></td>
                </tr>
                <tr>
                    <td align="center" style="border-bottom:0; padding-bottom:0;"><input type="checkbox" name="wish"/>
                    </td>
                    <td style="border-bottom:0; padding-bottom:0;"><b style="font-size:14px;">祝福贺卡</b></td>
                    <td align="center" style="border-bottom:0; padding-bottom:0;">￥15.00</td>
                    <td align="center" style="border-bottom:0; padding-bottom:0;">￥0.00</td>
                    <td align="center" style="border-bottom:0; padding-bottom:0;"><a href="#"
                                                                                     style="color:#ff4e00;">查看</a></td>
                </tr>
                <tr valign="top">
                    <td align="center"></td>
                    <td colspan="4">
                        <span class="fl"><b style="font-size:14px;">祝福语：</b></span>
                        <span class="fl"><textarea class="add_txt" style="width:860px; height:50px;"></textarea></span>
                    </td>
                </tr>
            </table>

            <div class="two_t">
                其他信息
            </div>
            <table border="0" class="car_tab" style="width:1110px;" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="145" align="right" style="padding-right:0;"><b style="font-size:14px;">使用红包：</b></td>
                    <td>
                        <span class="fl" style="margin-left:50px; margin-right:10px;">选择已有红包</span>
                        <select class="jj" name="city">
                            <option value="0" selected="selected">请选择</option>
                            <option value="1">50元</option>
                            <option value="2">30元</option>
                            <option value="3">20元</option>
                            <option value="4">10元</option>
                        </select>
                        <span class="fl" style="margin-left:50px; margin-right:10px;">或者输入红包序列号</span>
                    <td class="fl"><input type="text" value="" class="c_ipt" style="width:220px;"/>
                        <span class="fr" style="margin-left:10px;"><input type="submit" value="验证红包"
                                                                          class="btn_tj"/></span>
                    </td>
                </tr>
                <tr valign="top">
                    <td align="right" style="padding-right:0;"><b style="font-size:14px;">订单附言：</b></td>
                    <td style="padding-left:0;"><textarea class="add_txt" style="width:860px; height:50px;"></textarea>
                    </td>
                </tr>
                <tr>
                    <td align="right" style="padding-right:0;"><b style="font-size:14px;">缺货处理：</b></td>
                    <td>
                        <label class="r_rad"><input type="checkbox" name="none" checked="checked"/></label><label
                            class="r_txt" style="margin-right:50px;">等待所有商品备齐后再发</label>
                        <label class="r_rad"><input type="checkbox" name="none"/></label><label class="r_txt"
                                                                                                style="margin-right:50px;">取下订单</label>
                        <label class="r_rad"><input type="checkbox" name="none"/></label><label class="r_txt"
                                                                                                style="margin-right:50px;">与店主协商</label>
                    </td>
                </tr>
            </table>

            <table id="price" border="0" style="width:900px; margin-top:20px;" cellspacing="0" cellpadding="0">
                <%--<tr>
                    <td align="right">
                        该订单完成后，您将获得 <font color="#ff4e00">1815</font> 积分 ，以及价值 <font color="#ff4e00">￥0.00</font> 的红包
                        <br/>
                        商品总价: <font color="#ff4e00">￥1815.00</font> + 配送费用: <font color="#ff4e00">￥15.00</font>
                    </td>
                </tr>
                <tr height="70">
                    <td align="right">
                        <b style="font-size:14px;">应付款金额：<span style="font-size:22px; color:#ff4e00;">￥2899</span></b>
                    </td>
                </tr>
                <tr height="70">
                    <td align="right"><a href="#"><img src="images/btn_sure.gif"/></a></td>
                </tr>--%>
            </table>


        </div>
    </div>
    <!--End 第二步：确认订单信息 End-->

    <!--Begin Footer Begin -->
    <div class="b_btm_bg bg_color">
        <div class="b_btm">
            <table border="0" style="width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;"
                   cellspacing="0" cellpadding="0">
                <tr>
                    <td width="72"><img src="images/b1.png" width="62" height="62"/></td>
                    <td><h2>正品保障</h2>正品行货 放心购买</td>
                </tr>
            </table>
            <table border="0" style="width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;"
                   cellspacing="0" cellpadding="0">
                <tr>
                    <td width="72"><img src="images/b2.png" width="62" height="62"/></td>
                    <td><h2>满38包邮</h2>满38包邮 免运费</td>
                </tr>
            </table>
            <table border="0" style="width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;"
                   cellspacing="0" cellpadding="0">
                <tr>
                    <td width="72"><img src="images/b3.png" width="62" height="62"/></td>
                    <td><h2>天天低价</h2>天天低价 畅选无忧</td>
                </tr>
            </table>
            <table border="0" style="width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;"
                   cellspacing="0" cellpadding="0">
                <tr>
                    <td width="72"><img src="images/b4.png" width="62" height="62"/></td>
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
                服务热线：<br/>
                <span>400-123-4567</span>
            </p>
        </div>
        <div class="b_er">
            <div class="b_er_c"><img src="images/er.gif" width="118" height="118"/></div>
            <img src="images/ss.png"/>
        </div>
    </div>
    <div class="btmbg">
        <div class="btm">
            备案/许可证编号：蜀ICP备12009302号-1-www.dingguagua.com Copyright © 2015-2018 尤洪商城网 All Rights Reserved. 复制必究 ,
            Technical Support: Dgg Group <br/>
            <img src="images/b_1.gif" width="98" height="33"/><img src="images/b_2.gif" width="98" height="33"/><img
                src="images/b_3.gif" width="98" height="33"/><img src="images/b_4.gif" width="98" height="33"/><img
                src="images/b_5.gif" width="98" height="33"/><img src="images/b_6.gif" width="98" height="33"/>
        </div>
    </div>
    <!--End Footer End -->
</div>

</body>


<!--[if IE 6]>
<script src="//letskillie6.googlecode.com/svn/trunk/2/zh_CN.js"></script>
<![endif]-->
</html>
