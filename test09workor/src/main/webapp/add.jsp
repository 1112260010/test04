<%--
  Created by IntelliJ IDEA.
  User: wtc
  Date: 2019/5/5
  Time: 10:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="/js/jQuery1.11.1.js"></script>
    <script>
        $(function(){
            var tj = 0;
            $("[type=button]").click(function(){
                if($("#executor").val() == null || $("#executor").val()==""){
                    tj = 0;
                    alert("执行人不能为空");
                }else{
                    tj = 1;
                }
                if($("#description").val() == null || $("#description").val()==""){
                    tj = 0;
                    alert("任务描述不能为空");
                }else{
                    tj = 1;
                }
                if($("option:selected").val()==0){
                    tj = 0;
                    alert("级别不能为0");
                }else{

                    tj = 1;
                }
                if(tj == 1){
                    if(window.confirm("是否提交数据？")){
                        $("form").submit();
                    }
                }else{
                    alert("还有信息没填");
                }
            })
        })
    </script>
</head>
<body>
<body>
<div align="center">
    <form id="addform" name="addform" method="post" action="/addsave">
        <input type="hidden" name="pid" value="${pid}"/>
        <table border="1px" style="width:400px; ">
            <tr>
                <td colspan="3" style="text-align: center;" ><h1>添加工单</h1></td>
            </tr>
            <tr>
                <td style="height: 42px;background-color:#dda0dc; ">执行人(*)：</td>
                <td><input type="text" id="executor" name="executor"/>
                </td>
            </tr>
            <tr>
                <td style="height: 60px;background-color:#dda0dc; ">任务描述(*)：</td>
                <td>    <textarea id="description" name="description"></textarea>
                </td>
            </tr>
            <tr>
                <td style="height: 39px;background-color:#dda0dc; ">级别(*)：</td>
                <td><select id="orderlevel" name="orderlevel">
                    <option value="0">全部</option>
                    <option value="1">1级</option>
                    <option value="2">2级</option>
                    <option value="3">3级</option>
                </select></td>
            </tr>
            <tr>
                <td colspan="3" style="text-align: center;"><input type="button" value="提交" id="add"/></td>
            </tr>
        </table>
    </form>
</div>
</body>
</body>
</html>
