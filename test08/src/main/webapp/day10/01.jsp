<%@ page language="java" pageEncoding="utf-8" isELIgnored="false" %>
<html>
<head>
    <title>Ajax</title>
    <script type="text/javascript" src="/js/jQuery1.11.1.js"></script>
    <script type="text/javascript">
        $(function () {
            $("[type=button]").click(function () {
                $.ajax({
                    url:"/second",  //请求地址
                    type:"POST",//请求方式
                    data:{},//请求的数据变量
                   /* dataType:"json",*/
                    success:function (data) { //一般情况下
                        $.each(eval(data),function(i,dom){
                            alert(dom.name+"/"+dom.age);
                        })
                    }
                });
            });

        });

    </script>
</head>
<body>
    <input type="button" value="想发送Ajax？,点我不要赔的喔！！！呵呵哒~~~~~~"/>
</body>
</html>
