<%--
  Created by IntelliJ IDEA.
  User: wtc
  Date: 2019/5/5
  Time: 10:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div align="center">
    <table border="1px">
        <tr>
            <td colspan="6" align="center"><h1>企业工单管理系统</h1>
            </td>
        </tr>
        <tr style="background-color:#808080;">
            <th style="width:65px;">工单编号</th>
            <th>项目名称</th>
            <th style="width:50px;">执行人</th>
            <th>任务描述</th>
            <th style="width:35px;">级别</th>
            <th>创建时间</th>
        </tr>
        <c:forEach var="w" items="${list}" varStatus="num">
            <tr
                    <c:if test="${num.index % 2==1}">style="background-color:rgb(222,158,226)"</c:if>>
                <td>${w.wid}</td>
                <td>${w.projectname}</td>
                <td>${w.executor}</td>
                <td>${w.description}</td>
                <td>${w.orderlevel}级</td>
                <td><fmt:formatDate value="${w.createdate}"
                                    pattern="yyyy-MM-dd" /></td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="6" align="center"><span>${str}</span></td>
        </tr>
    </table>
</div>
</body>
</html>
