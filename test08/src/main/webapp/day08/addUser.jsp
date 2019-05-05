<%--
  Created by IntelliJ IDEA.
  User: wtc
  Date: 2019/4/26
  Time: 11:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post" action="/addpojo">
    用户名：<input name="uname"/>
    密码： <input name="upwd"/>
    家庭住址： <input name="address.homeAddress"/>
    家庭住址1： <input name="list[0].homeAddress"/>
    家庭住址2： <input name="list[1].homeAddress"/>

    <input type="submit"/>
</form>

</body>
</html>
