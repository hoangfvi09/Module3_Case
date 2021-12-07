<%--
  Created by IntelliJ IDEA.
  User: hoangfvi
  Date: 06/12/2021
  Time: 09:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div align="center">
    <table border="1" cellpadding="5">
        <caption><h2>My orders</h2></caption>
        <tr>
            <th>Order Id</th>
            <th>Time </th>
            <th>Status </th>
            <%--            <th>Description</th>--%>
            <%--            <th>image</th>--%>
            <%--            <th>rate</th>--%>
            <%--            <th>sold</th>--%>
        </tr>
        <c:forEach var="order" items="${myOrders}">
            <tr>
                <td>${order.id}</td>
                <td>${order.time}</td>
                <td>${order.status}</td>
                    <%--                <td>${product.description}</td>--%>
                    <%--                <td>${product.image}</td>--%>
                    <%--                <td>${product.sold}</td>--%>
                <td>
<a href="/orders?action=cancel&id=${order.id}" onclick="return confirm('Are you sure to cancel this order?')">Cancel</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
