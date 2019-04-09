<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <title> 后台管理系统</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    
    <link rel="shortcut icon" href="favicon.ico"> 
    <link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css?v=4.1.0" rel="stylesheet">
    <script type="text/javascript" src="../js/jquery-1.8.2.min.js"></script>
    <script>
        $(function(){
            if(${sessionScope.user.type != 1}){
                alert("该用户不是管理员用户，请重新登录");
                window.location.href = "logins.jsp";
            }
        })
    </script>
</head>
<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
<input style="display: none" id="usersession" value="1">
<input style="display: none" id="dlsession" value="">
    <div id="wrapper">
		<nav class="navbar-default navbar-static-side" role="navigation">
            <div class="nav-close"><i class="fa fa-times-circle"></i>
            </div>
            <div class="sidebar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="nav-header">
                        <div class="dropdown profile-element">
                            <a data-toggle="dropdown" class="dropdown-toggle" href="index.jsp">
                                <span class="clear">
                                    <span class="block m-t-xs" style="font-size:20px;">
                                        
                                        <strong class="font-bold">中意家园网上商城</strong>
                                    </span>
                                </span>
                            </a>
                        </div>
                        <div class="logo-element">
                        	${sessionScope.user.loginName}
                        </div>
                    </li>
                    <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                        <span class="ng-scope">会员管理</span>
                    </li>
                    <li>
                        <a class="J_menuItem" href="welcome.jsp">
                            <i class="fa fa-home"></i>
                            <span class="nav-label">主页</span>
                        </a>
                    </li>
                    
                    <li>
                        <a href="#">
                            <i class="fa fa-group"></i>
                            <span class="nav-label">会员管理</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                       		<li>
                                <a class="J_menuItem" href="welcome.jsp">会员注册</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="huiyuanliebiao.jsp">会员列表</a>
                            </li>
                      		
                        </ul>
                   	 </li>
                    <li class="line dk"></li>
                    <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                        <span class="ng-scope">商品管理</span>
                    </li>
                    <li>
                    <li>
                        <a href="#">
                        	<i class="fa fa-calendar"></i>
                            <span class="nav-label">订单管理</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                    		<li>
                            	<a class="J_menuItem" href="dingdanliebiao.jsp">订单列表</a>
                            </li>
                            <li>
                            	<a class="J_menuItem" href="yifahuoliebiao.jsp">已发货列表</a>
                            </li>
                             <li>
                            	<a class="J_menuItem" href="yiwanchengliebiao.jsp">已完成列表</a>
                            </li>
                            <li>
                            	<a class="J_menuItem" href="dingdandaochu.jsp">订单导出</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                    	<a href="">
                        	<i class="fa fa-pencil-square-o"></i>
                            <span class="nav-label">商品分类管理</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a class="J_menuItem" href="yijifenlei.jsp">商品一级分类</a>
                                <a class="J_menuItem" href="erjifenlei.jsp">商品二级分类</a>
                                <a class="J_menuItem" href="sanjifenlei.jsp">商品三级分类</a>
                                <a class="J_menuItem" href="chanpinzhuanqu.jsp">产品专区</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="">
                        	<i class="fa fa-cogs"></i>
                            <span class="nav-label">专区管理</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                             <li>
                            	<a class="J_menuItem" href="chanpinzhuanqu.jsp">产品专区</a>
                                <a class="J_menuItem" href="chanpinzhuanqu1.jsp">优惠券专区</a>
                                <a class="J_menuItem" href="chanpinzhuanqu2.jsp">购物券专区</a>
                                <a class="J_menuItem" href="chanpinzhuanqu3.jsp">重消区</a>
                                <a class="J_menuItem" href="chanpinzhuanqu4.jsp">秒杀区</a>
                                <a class="J_menuItem" href="chanpinzhuanqu5.jsp">团购区</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="">
                        	<i class="fa fa-cogs"></i>
                            <span class="nav-label">品牌设置</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                             <li>
                            	<a class="J_menuItem" href="shangchuanpinpai.jsp">上传品牌</a>
                                <a class="J_menuItem" href="pinpailiebiao.jsp">品牌列表</a>
                            </li>
                        </ul>
                    </li>
                    
                     <li class="line dk"></li>
                    <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                        <span class="ng-scope">奖励纪录</span>
                    </li>
                    <li>
                        <a href="">
                        	<i class="fa fa-pencil-square-o"></i>
                            <span class="nav-label">奖励纪录</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="huiyuanjianglijilu.jsp">会员奖励记录</a></li>
                            <li><a class="J_menuItem" href="huiyuanmeirijianglijilu.jsp">会员每日奖励记录</a></li>
                        </ul>
                    </li>
                    
                    
           			 <li class="line dk"></li>
                    <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                        <span class="ng-scope">劵管理</span>
                    </li>
                    <li>
                        <a href="#">
                        	<i class="fa fa-pencil-square-o"></i>
                            <span class="nav-label">会员券管理</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                    		<li>
                            	<a class="J_menuItem" href="daijinquan.jsp">代金券</a>
                            </li>
                            <li>
                            	<a class="J_menuItem" href="youhuiquan.jsp">优惠券</a>
                            </li>
                            <li>
                            	<a class="J_menuItem" href="chongxiaoquan.jsp">重消券</a>
                            </li>
                            <li>
                            	<a class="J_menuItem" href="gouwuquan.jsp">购物券</a>
                            </li>
                            
                        </ul>
                    </li>
                    <li class="line dk"></li>
                    <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                        <span class="ng-scope">信息管理</span>
                    </li>
                    
                     <li>
                        <a href="">
                        	<i class="fa fa-pencil-square-o"></i>
                            <span class="nav-label">文章管理</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="wenzhangliebiao.jsp">文章列表</a></li>
                            <li><a class="J_menuItem" href="wenzhangtianjia.jsp">添加文章</a></li>
                        </ul>
                    </li>
                   
                     <li class="line dk"></li>
                    <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                        <span class="ng-scope">提现管理</span>
                    </li>
                    <li>
                        <a href="">
                        	<i class="fa fa-pencil-square-o"></i>
                            <span class="nav-label">提现管理</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="tixianjilu.jsp">提现记录</a></li>
                            <li><a class="J_menuItem" href="tixianshezhi.jsp">提现设置</a></li>
                        </ul>
                    </li>
                    
                   
                    <li class="line dk"></li>
                    <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                        <span class="ng-scope">每日返现管理</span>
                    </li>
                     <li>
                        <a href="">
                        	<i class="fa fa-pencil-square-o"></i>
                            <span class="nav-label">返现记录</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="meirifanxianjilu.jsp">每日返现记录</a></li>
                            
                        </ul>
                    </li>
                    
                    <li class="line dk"></li>
                    <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                        <span class="ng-scope">支付管理</span>
                    </li>
                    
                    <li>
                        <a href="">
                        	<i class="fa fa-pencil-square-o"></i>
                            <span class="nav-label">支付管理</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                        <li><a class="J_menuItem" href="zhifubaoshezhi.jsp">支付宝设置</a></li>
                            <li><a class="J_menuItem" href="weixinshezhi.jsp">微信设置</a></li>
                            
                        </ul>
                    </li>
                    
                     
                     
                    <li class="line dk"></li>
                    <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                        <span class="ng-scope">加盟店管理</span>
                    </li>
                    <li>
                        <a href="">
                        	<i class="fa fa-pencil-square-o"></i>
                            <span class="nav-label">加盟店管理</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                        <li><a class="J_menuItem" href="tianjiajiamengdian.jsp">添加加盟店</a></li>
                            <li><a class="J_menuItem" href="jiamengdianliebiao.jsp">加盟店列表</a></li>
                            <li><a class="J_menuItem" href="jiamengdianyeji.jsp">加盟店业绩</a></li>
                        </ul>
                    </li>
                    

                    <li class="line dk"></li>
                    <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                        <span class="ng-scope">其他管理</span>
                    </li>
                    <li>
                        <a href="">
                        	<i class="fa fa-pencil-square-o"></i>
                            <span class="nav-label">参数设置</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="canshushezhi.jsp">参数设置</a></li>
                            
                        </ul>
                        
                    </li>
                   
                    <li>
                        <a href="#">
                        	<i class="fa fa-cogs"></i>
                            <span class="nav-label">系统管理员</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li>
                            	<a class="J_menuItem" href="tianjiaguanliyuan.jsp">管理员注册</a>
                            </li>
                            <li>
                            	<a class="J_menuItem" href="guanliyuanliebiao.jsp">管理员列表</a>
                            </li>
                            
                        </ul>
                    </li>
                     <li>
                        <a href="#">
                        <i class="fa fa-calendar"></i>
                            <span class="nav-label">广告管理</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li>
                            	<a class="J_menuItem" href="banner.jsp">banner 广告位列表</a>
                            </li>
                            <li>
                            	<a class="J_menuItem" href="sjbanner.jsp">手机banner 广告位列表</a>
                            </li>
                        </ul>
                    </li>

                    <li class="line dk"></li>
                    <li>&nbsp;&nbsp;</li>
                    <li>&nbsp;&nbsp;</li>
                    <li>&nbsp;&nbsp;</li>
                    <li>&nbsp;&nbsp;</li>
                    <li>&nbsp;&nbsp;</li>
                    <li>&nbsp;&nbsp;</li>
                </ul>
            </div>
        </nav>

        <div id="page-wrapper" class="gray-bg dashbard-1">
            <div class="row border-bottom">
                <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                    <div class="navbar-header"><a class="navbar-minimalize minimalize-styl-2 btn btn-info " href="#"><i class="fa fa-bars"></i> </a>
                    </div>
                    
                    <ul class="nav navbar-top-links navbar-right">
                    	  
                        	  <li class="dropdown">
                           		 <a class="dropdown-toggle count-info" data-toggle="" href="/UserBackServlet?opr=loginOut" title="退出">
                            	  ${sessionScope.user.loginName}  <i class="fa fa-power-off"></i> <span class="label label-warning"></span>
                           		 </a>
                            	<ul class="dropdown-menu dropdown-messages" style="width: 100px;padding: 0px;">
                            	</ul>
                        	</li>
                       	 
                      	  
                    </ul>
                </nav>
            </div>
            <div class="row J_mainContent" id="content-main">
                <iframe id="J_iframe" width="100%" height="100%" src="welcome.jsp" frameborder="0" data-id="welcome.jsp" seamless></iframe>
            </div>
        </div>
        <!--右侧部分结束-->
    </div>

    <!-- 全局js -->
    <script src="js/jquery.min.js?v=2.1.4"></script>
    <script src="js/bootstrap.min.js?v=3.3.6"></script>
    <script src="js/jquery.metisMenu.js"></script>
    <script src="js/jquery.slimscroll.min.js"></script>
    <script src="js/layer.min.js"></script>

    <!-- 自定义js -->
    <script src="js/hAdmin.js?v=4.1.0"></script>
    <script type="text/javascript" src="js/index.js"></script>
	<script type="text/javascript">
    	$(document).ready(function(){
    		var usersession=$("#usersession").val();
    		var dlsession=$("#dlsession").val();
			if(usersession==null|dlsession==null){
				window.location.href="login.jsp";
    		}
    	});
    </script>
    <!-- 第三方插件 -->
    <script src="js/plugins/pace/pace.min.js"></script>
	
</body>

</html>
