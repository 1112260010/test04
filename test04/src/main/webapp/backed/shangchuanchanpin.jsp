
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
<link type="text/css" rel="stylesheet" href="css/laydate.css">
    <link type="text/css" rel="stylesheet" href="css/laydate1.css">
    
    <link href="css/sweetalert.css" rel="stylesheet">
    
     <link rel="stylesheet" href="themes/default/default.css" />
		<script charset="utf-8" src="kindeditor-min.js"></script>
		<script charset="utf-8" src="lang/zh_CN.js"></script>
		<script>
			KindEditor.ready(function(K) {
				K.create('#content1', {
					pasteType : 0
				});
				K.create('#content2', {
					pasteType : 1
				});
				K.create('#content3', {
					pasteType : 2
				});
			});
		</script>
    <script type="text/javascript" src="ckeditor/ckeditor.js"></script>
    <script type="text/javascript" src="../js/jquery-1.8.2.min.js"></script>
    <script>
        $(function(){
            if(${sessionScope.user != null}) {
                var $select1 = $("#categoryLevel1Id");
                var $select2 = $("#categoryLevel2Id");
                var $select3 = $("#categoryLevel3Id");
                $.post("/ProductBackServlet?opr=selectProductCategory", callback, "json");

                function callback(data) {
                    $select1.empty();
                    $select2.empty();
                    $select3.empty();
                    var str1 = "";
                    var str2 = "";
                    var str3 = "";
                    for (var i = 0; i < data.length; i++) {
                        str1 += "<option selected='' value='" + data[i].id + "'>" + data[i].name + "</option>";
                        for (var j = 0; j < data[i].list.length; j++) {
                            str2 += "<option selected='' value='" + (data[i].list)[j].id + "'>" + (data[i].list)[j].name + "</option>";
                            for (var k = 0; k < (data[i].list)[j].list.length; k++) {
                                str3 += "<option selected='' value='" + ((data[i].list)[j].list)[k].id + "'>" + ((data[i].list)[j].list)[k].name + "</option>";
                            }
                        }
                    }
                    $select1.html(str1);
                    $select2.html(str2);
                    $select3.html(str3);
                }
            }
        })
    </script>
</head>
<body class="gray-bg">
	<div style="display: none;">
		<textarea name="hh"></textarea>
	</div>
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>商品上传</h5>
                    </div>
                    <div class="ibox-content">
                        <form class="form-horizontal"  action="/ProductBackServlet?opr=addProduct"  method="post" enctype="multipart/form-data">
                        	 <div class="form-group">
                        		<input type="hidden" name="product.id" id="productid" value="116">
                        		<label class="col-sm-3 control-label"></label>
                        		<div class="col-sm-8" style="color: red;font-size: 15px">
                                </div>
                        	</div>
                        	 <div class="form-group">
                                <label class="col-sm-3 control-label"><span style="color:red;">*</span>商品名称：</label>
                                <div class="col-sm-8">
                                    <input id="name"  name="name" value="" type="text" placeholder=" 请输入商品名称" class="form-control">
                                    <span class="help-block m-b-none"></span>
                                </div>
                            </div>
                             <div class="form-group">
                                <label class="col-sm-3 control-label"><span style="color:red;">*</span>商品售价：</label>
                                <div class="col-sm-8">
                                    <input id="price"  name="price" value="" type="text" placeholder=" 请输入商品售价"  onkeyup="value=value.replace(/[^\d.]/g,'')"  onblur="value=value.replace(/[^\d.]/g,'') "  class="form-control">
                                    <span class="help-block m-b-none"></span>
                                </div>
                            </div>
                             <div class="form-group">
                                <label class="col-sm-3 control-label"><span style="color:red;">*</span>库存：</label>
                                <div class="col-sm-8">
                                    <input id="stock"  name="stock" value="" type="text" placeholder=" 请输入商品库存" class="form-control" onkeyup="value=value.replace(/[^\d]/g,'')"  onblur="value=value.replace(/[^\d]/g,'') " >
                                    <span class="help-block m-b-none"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label"><span style="color:red;">*</span>一级类别：</label>
                                <div class="col-sm-8">

                                    <select id="categoryLevel1Id" name="categoryLevel1Id" style="width: 100%;" class="form-control"><%--<option selected="" value="114">红酒</option><option selected="" value="113">鹿茸</option><option selected="" value="112">书房四宝</option><option selected="" value="111">发卡</option><option selected="" value="110">戒指</option><option selected="" value="109">啤酒</option><option selected="" value="108">白酒</option><option selected="" value="107">桌子</option><option selected="" value="106">窗帘</option><option selected="" value="105">电脑</option><option selected="" value="104">手机</option><option selected="" value="103">包</option><option selected="" value="102">羽绒服</option><option selected="" value="101">裤子</option><option selected="" value="100">鞋子</option><option selected="" value="99">口腔用品</option><option selected="" value="98">化妆品</option><option selected="" value="97">厨房电器</option><option selected="" value="96">文玩</option><option selected="" value="95">家用电器</option><option selected="" value="94">家纺</option><option selected="" value="93">配饰</option><option selected="" value="92">矿泉水</option><option selected="" value="91">滋补品</option><option selected="" value="89">毛衣</option><option selected="" value="87">饮料</option><option selected="" value="85">护肤品</option><option selected="" value="83">数码</option><option selected="" value="81">项链</option><option selected="" value="77">字画</option><option selected="" value="75">居家</option><option selected="" value="73">厨房用品</option><option selected="" value="71">参</option>
--%>
                                    </select>
                                    <input type="hidden"  name="product.fmc" >
                                    <span class="help-block m-b-none"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label"><span style="color:red;">*</span>二级类别：</label>
                                <div class="col-sm-8">

                                    <select id="categoryLevel2Id" name="categoryLevel2Id" style="width: 100%;" class="form-control"><%--<option selected="" value="114">红酒</option><option selected="" value="113">鹿茸</option><option selected="" value="112">书房四宝</option><option selected="" value="111">发卡</option><option selected="" value="110">戒指</option><option selected="" value="109">啤酒</option><option selected="" value="108">白酒</option><option selected="" value="107">桌子</option><option selected="" value="106">窗帘</option><option selected="" value="105">电脑</option><option selected="" value="104">手机</option><option selected="" value="103">包</option><option selected="" value="102">羽绒服</option><option selected="" value="101">裤子</option><option selected="" value="100">鞋子</option><option selected="" value="99">口腔用品</option><option selected="" value="98">化妆品</option><option selected="" value="97">厨房电器</option><option selected="" value="96">文玩</option><option selected="" value="95">家用电器</option><option selected="" value="94">家纺</option><option selected="" value="93">配饰</option><option selected="" value="92">矿泉水</option><option selected="" value="91">滋补品</option><option selected="" value="89">毛衣</option><option selected="" value="87">饮料</option><option selected="" value="85">护肤品</option><option selected="" value="83">数码</option><option selected="" value="81">项链</option><option selected="" value="77">字画</option><option selected="" value="75">居家</option><option selected="" value="73">厨房用品</option><option selected="" value="71">参</option>
--%>
                                    </select>
                                    <input type="hidden"  name="product.fmc" >
                                    <span class="help-block m-b-none"></span>
                                </div>
                            </div>
                        	 <div class="form-group">
                                <label class="col-sm-3 control-label"><span style="color:red;">*</span>三级类别：</label>
                                <div class="col-sm-8">

                                    <select id="categoryLevel3Id" name="categoryLevel3Id" style="width: 100%;" class="form-control"><%--<option selected="" value="114">红酒</option><option selected="" value="113">鹿茸</option><option selected="" value="112">书房四宝</option><option selected="" value="111">发卡</option><option selected="" value="110">戒指</option><option selected="" value="109">啤酒</option><option selected="" value="108">白酒</option><option selected="" value="107">桌子</option><option selected="" value="106">窗帘</option><option selected="" value="105">电脑</option><option selected="" value="104">手机</option><option selected="" value="103">包</option><option selected="" value="102">羽绒服</option><option selected="" value="101">裤子</option><option selected="" value="100">鞋子</option><option selected="" value="99">口腔用品</option><option selected="" value="98">化妆品</option><option selected="" value="97">厨房电器</option><option selected="" value="96">文玩</option><option selected="" value="95">家用电器</option><option selected="" value="94">家纺</option><option selected="" value="93">配饰</option><option selected="" value="92">矿泉水</option><option selected="" value="91">滋补品</option><option selected="" value="89">毛衣</option><option selected="" value="87">饮料</option><option selected="" value="85">护肤品</option><option selected="" value="83">数码</option><option selected="" value="81">项链</option><option selected="" value="77">字画</option><option selected="" value="75">居家</option><option selected="" value="73">厨房用品</option><option selected="" value="71">参</option>
--%>
									</select>
									<input type="hidden" id="hidde" name="product.fmc" >
                                    <span class="help-block m-b-none"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label"><span style="color:red;">*</span>图片：</label>
                                <div class="col-sm-8">
                                 <%--<input name="product.tp3"  id="image3" value="/attached/image/20171126/20171126160710_945.jpg" type="text" minlength="1"  class="dfinput" style="width: 250px"/>
						<input id="selectImg3" type="button" name="selectImg" value="选择" />
						&nbsp;&nbsp;&nbsp;
						<img id="img_image3" src="/attached/image/20171126/20171126160710_945.jpg" alt="" height="95" width="120" style="vertical-align:middle;"/>
									<span class="help-block m-b-none"></span>--%>
                                     <input type="file" name="fileName" value=""/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label"><span style="color:red;">*</span>商品描述：</label>
                                <div class="col-sm-8">
                                   <textarea id="content3" name="description" style="width:700px;height:200px;visibility:hidden;"></textarea>
                                    <span class="help-block m-b-none"></span>
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
    <script src="js/laydate.js"></script>
    <script>
        //外部js调用
        laydate({
            elem: '#hello', //目标元素。由于laydate.js封装了一个轻量级的选择器引擎，因此elem还允许你传入class、tag但必须按照这种方式 '#id .class'
            event: 'focus' //响应事件。如果没有传入event，则按照默认的click
        });
        //日期范围限制
        var start = {
            elem: '#start',
            format: 'YYYY/MM/DD hh:mm:ss',
            min: laydate.now(), //设定最小日期为当前日期
            max: '2099-06-16 23:59:59', //最大日期
            istime: true,
            istoday: false,
            choose: function (datas) {
                end.min = datas; //开始日选好后，重置结束日的最小日期
                end.start = datas //将结束日的初始值设定为开始日
            }
        };
        var end = {
            elem: '#end',
            format: 'YYYY/MM/DD hh:mm:ss',
            min: laydate.now(),
            max: '2099-06-16 23:59:59',
            istime: true,
            istoday: false,
            choose: function (datas) {
                start.max = datas; //结束日选好后，重置开始日的最大日期
            }
        };
        laydate(start);
        laydate(end);
    </script>
    <script type="text/javascript">
    	/*$(function(){
			$.ajax({
				url:"admin_shangpinfenlei_list.action?fenlei.lx="+3,
				type:"post",
				dataType:"json",
				success:function(obj){
					    for(var p in obj){ 
					    	$("select").prepend('<option selected="" value="' + obj[p].id + '">' + obj[p].mc + '</option>');
					 
					    }  
					 
				},
			});
		    $("#submit").click(function(){
		    	   var type = $("#product").find("option:selected").text();
		       	   $("#hidden").val(type);
		    });
    	});*/
    </script>
     <%--<script type="text/javascript">
    	$(document).ready(function(){
    		$("#submit").click(function(){
	       		 var spmc = $("#spmc").val();
	   			 var spsj=$("#spsj").val();
	   			 var kc=$("#kc").val();
	       		 if(!spmc){
	   				 alert("请输入商品名称");
	   				 return false;
	   			 }
	       		 if(!spsj){
	       			 alert("请输入商品售价");
	       			 return false;
	       		 }
	       		 if(!kc){
	       			 alert("请输入库存");
	       			 return false;
	       		 }
    		});
    	});
    </script>--%>
</body>
</html>
