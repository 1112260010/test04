<%@ page language="java" pageEncoding="utf-8" isELIgnored="false" %>
<html>
<head>
    <script type="text/javascript" src="/js/jQuery1.11.1.js"></script>
    <script>
        $(function(){
            $.ajax({
                url:"/findAllProject",
                type:"post",
                dataType:"json",
                success:function(data){
                    var $op = $("[name=projectname]");
                    $op.empty();
                    for(var i=0;i<data.length;i++){
                        $op.append("<option id='"+data[i].pid+"' value='"+data[i].projectname+"'>"+data[i].projectname+"</option>")
                    }
                }
            })
        })
    </script>

    <script>
        $(function(){
            $("input").click(function(){
                var pid = $("option:selected").attr("id");
                window.location = "/projectId?pid="+pid;
            })
        })

    </script>
</head>
<body>
<div>
    <table border="1">
        <tr>
            <td colspan="2" align="center">企业工单管理系统</td>
        </tr>
        <tr>
            <td>选择项目</td>
            <td>
                <select name="projectname">
                   <%-- <option value="">信息管理</option>
                    <option value="">商品管理</option>
                    <option value="">用户管理</option>--%>
                </select>
                <input type="button" value="确定"/>
            </td>
        </tr>
    </table>
</div>
</body>
</html>
