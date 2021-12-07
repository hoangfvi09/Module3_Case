<%--
  Created by IntelliJ IDEA.
  User: hoangfvi
  Date: 06/12/2021
  Time: 09:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            <th>Product Id</th>
            <th>Quantity </th>
            <th>Status </th>
            <%--            <th>Description</th>--%>
            <%--            <th>image</th>--%>
            <%--            <th>rate</th>--%>
            <%--            <th>sold</th>--%>
        </tr>
        <c:forEach var="order" items="${myOrders}">
            <tr>
                <td>${order.id}</td>
                <td>${order.productId}</td>
                <td>${order.quantity}</td>
                <td>${order.status}</td>
                    <%--                <td>${product.description}</td>--%>
                    <%--                <td>${product.image}</td>--%>
                    <%--                <td>${product.sold}</td>--%>
                <td>
<a href="/orders?action=cancel&id=${order.id}"
                </td>
            </tr>
        </c:forEach>
        <a href="/carts?action=empty-cart">Delete All</a>
    </table>
</div>
</body>
</html>
