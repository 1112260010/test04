<%--
  Created by IntelliJ IDEA.
  User: wtc
  Date: 2019/4/30
  Time: 8:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="/js/jQuery1.11.1.js" type="text/javascript"></script>
    <script>
        $(function(){
            $("h2").click(function(){
                $.ajax({
                    url:"/findAll",
                    type:"post",
                    dataType:"json",
                    success:function(data){
                        $.each(data,function(i,dom){
                            alert(dom.name+"/"+dom.price+"/"+dom.sales);
                        })
                    }
                })
            })
        })
    </script>
</head>
<body>
    <h2>查询</h2>
</body>
</html>
